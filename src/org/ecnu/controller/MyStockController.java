package org.ecnu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.Depot;
import org.ecnu.orm.DepotHis;
import org.ecnu.orm.MyStock;
import org.ecnu.orm.NodeMapping;
import org.ecnu.orm.Profit;
import org.ecnu.orm.Users;
import org.ecnu.service.DepotService;
import org.ecnu.service.MyStockService;
import org.ecnu.service.NodeMappingService;
import org.ecnu.service.ProfitService;
import org.ecnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("MyStockController")
public class MyStockController {
	@Autowired
	private UserService us;
	
	@Autowired
	private MyStockService mss;
	
	@Autowired
	private DepotService ds;
	
	@Autowired
	private NodeMappingService nms;
	
	@Autowired
	private ProfitService ps;
	
	@RequestMapping("/to_stock_checkpage_3")
	public ModelAndView stockcheckPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("StockCheck");
		
		List<Users> users = us.searchAllEmp();
		mav.addObject("users", users);
		
		return mav;
	}
	
	/**
	 * 
	 * @param eName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_stock_checksearch_3")
	public ModelAndView dostockcheckPage(@RequestParam("employeeName") String eName)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("StockCheck");

		List<Users> users = us.searchAllEmp();
		mav.addObject("users", users);
		mav.addObject("eName", eName);
		
		MyStock ms = new MyStock();
		ms.setEmployeeName(eName);
		ms.setType("1");//1为未清算，2为已清算
		List<MyStock> mslist = new ArrayList<MyStock>();
		mslist = (List<MyStock>) mss.searchAll(ms);
		ms.setType("2");
		List<MyStock> mslist2 = (List<MyStock>) mss.searchAll(ms);
		if(mslist2.size()!=0)
		{
			mav.addObject("who", eName);
			mav.addObject("lasttime", mslist2.get(mslist2.size()-1).getLastTime().substring(0, 4)+"年"+mslist2.get(mslist2.size()-1).getLastTime().substring(4, 6)+"月"+mslist2.get(mslist2.size()-1).getLastTime().substring(6, 8)+"日");//上次清算时间
		}
//		List<MyStock> mslist =mss.searchAllByEmp(eName);//此处需要通过是否已清算标志位区分查找
		mav.addObject("mslist", mslist);
		return mav;
	}
	
	/**
	 * 仓库清算
	 * @return
	 */
	@RequestMapping("/do_stock_update_0")
	public ModelAndView dostockUpdate(@RequestParam("ename") String ename, @RequestParam("stockId") List<Long> sids, @RequestParam("wareName") List<String> wNames, @RequestParam("checkStoreNum") List<Integer> csns)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("StockCheck");

		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat df=new SimpleDateFormat("yyyyMM"); //制定日期格式
		Calendar c=Calendar.getInstance();
		Date now=new Date();
		c.setTime(now);
		c.add(Calendar.MONTH,1); //将当前日期加一个月
		String validityDate=df.format(c.getTime());
		
		String stry = validityDate.substring(0, 4);
		String strm = validityDate.substring(4, 6);
		String lastTime = sdf.format(now);
		
		int pwc = 0; //profit ware cost,即depotWareCost - checkWareCost 的总和
		
		for(int i =0; i<sids.size(); i++){
			MyStock ms = new MyStock();
			Long sid = sids.get(i);
//			ms.setStockId(sid);
			ms = (MyStock) mss.read(sid);
			int csn = csns.get(i);
			int wareCost = 0;//checkWareCost
			
			//wareCost为该月CHECK_WARE_COST，即清算存货的总价格
			wareCost = CountWareCost(ename, wNames.get(i), csn, stry, strm);//计算当月库存清算价格,年月可以不要，！！！！直接用标志位,未清算
			mss.creatNextMonth(ename, wNames.get(i), csn, wareCost, stry, strm, lastTime);//创建一条新的记录
			mss.updateStoreNum(sid, csn, wareCost);//不删除，只更新, 按年月字段记录，不需要历史表
//			mss.delete(ms);
			
			//Depot表中删除该员工所有该商品记录
//			Depot d = new Depot();
//			d.setDepotWareName(wNames.get(i));
//			d.setEmployeeName(ename);
//			ds.delete(d);
			//上面这样不能删除
			ds.deleteOnesEW(ename, wNames.get(i));
			
			//计算ename的货物销售成本
//			MyStock ms2 = (MyStock) mss.read(sid);
			System.out.println("ms.getLastMonthCost()"+ms.getLastMonthCost());
			System.out.println("ms.getDepotWareCost()"+ms.getDepotWareCost());
			System.out.println("wareCost"+wareCost);
			pwc += (ms.getLastMonthCost() + ms.getDepotWareCost() - wareCost);//上月余额+当月领取-当月统计
		}
		
		//更新利润表中货物销售成本
		Profit p = new Profit();
		Profit p2 = new Profit();
		p2.setEmployeeName(ename);
		p2.setType("1");
		
		if(ps.countRows(p2)>0){
			p = (Profit) ps.search(p2, 0).get(0);
			p.setWareCost(pwc);
			
			ps.update(p);
		}else{
			p.setEmployeeName(ename);
			p.setWareCost(pwc);
			p.setType("1");
			p.setYear(stry);
			p.setMonth(strm);
			
			ps.insert(p);
		}
		
		List<Users> users = us.searchAllEmp();
		mav.addObject("users", users);
		return mav;
	}

	protected int CountWareCost(String ename, String wname, int csn, String stry, String strm) {
		// TODO Auto-generated method stub
//		List<MyStock> mslist = mss.searchThisMonthByWName(ename, wname, stry, strm);//貌似不用在这表中取数
//		System.out.println(ename+"||"+wname+"||"+csn+"||"+stry+"||"+strm);
		String strym = stry+strm;
		List<Depot> dlist = ds.searchThisMonthByWNameEName(ename, wname, strym);//20130430不再用strym，depot表中处理完后及删除，只保留未清算的记录，更精确
//		System.out.println("dlist.size():"+dlist.size());
		int cost = 0;
		int i = 0;
			
			if(dlist.size()==0){//当月未取该类货物，按上月余留均价计算
				MyStock ms = new MyStock();
				MyStock ms2 = new MyStock();
				ms2.setType("1");
				ms2.setEmployeeName(ename);
				ms2.setWareName(wname);
				
				ms = (MyStock) mss.search(ms2, 0).get(0);
				if(ms.getLastMonthNum()!=0)cost = (ms.getLastMonthCost()/ms.getLastMonthNum())*csn;
				return cost;
			}
			while(csn > 0){
				Depot d = dlist.get(i);
//				System.out.println(i+"++++++"+d.getDepotWareNum()+"+++"+d.getDepotWarePrice());
				csn = csn - d.getDepotWareNum();
				cost = cost + d.getDepotWareNum() * d.getDepotWarePrice();
				i++;
//				System.out.println(csn+"剩余数量"+cost+"花费");
			}
			Depot d2 = dlist.get(i-1);
			csn = csn + d2.getDepotWareNum();//回退csn
			cost = cost - d2.getDepotWareNum() * d2.getDepotWarePrice();//回退cost
			cost += csn * d2.getDepotWarePrice();
//			System.out.println(csn+"剩余数量2::"+cost+"花费2");
		return cost;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_mystock_search_3")
	public ModelAndView myStockSearch(MyStock ms, ServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MyStockPage");
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		String ename = user.getEmployeeName();

		ms.setEmployeeName(ename);
		List<MyStock> mslist = (List<MyStock>) mss.searchAll(ms);
		mav.addObject("mslist", mslist);

		return mav;
	}
}
