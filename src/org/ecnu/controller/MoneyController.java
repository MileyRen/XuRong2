package org.ecnu.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.Depot;
import org.ecnu.orm.Money;
import org.ecnu.orm.MoneyHis;
import org.ecnu.orm.Shipping;
import org.ecnu.orm.Users;
import org.ecnu.orm.Wares;
import org.ecnu.service.DepotService;
import org.ecnu.service.MoneyHisService;
import org.ecnu.service.MoneyService;
import org.ecnu.service.NodeMappingService;
import org.ecnu.service.ShippingService;
import org.ecnu.service.UserService;
import org.ecnu.service.WaresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("moneyController")
public class MoneyController {
	@Autowired
	private MoneyService ms;
	
	@Autowired
	private DepotService ds;
	
	@Autowired
	private ShippingService ss;
	
	@Autowired
	private MoneyHisService mhs;
	
	@Autowired
	private UserService us;
	
	@Autowired
	private NodeMappingService nms;
	/**
	 * 
	 * @return
	 */	
	@RequestMapping("/to_money_page_3")
	public ModelAndView moneyPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneySearch");
		
		List<Users> users=us.searchAllEmp();//搜索所有有效的营业员
		mav.addObject("users", users);

		return mav;
	}
	
	@RequestMapping("/do_money_search_3")
	public ModelAndView moneySearch(@RequestParam("PageNo") int pageNo, Money money, @RequestParam("mintime") String mint, @RequestParam("maxtime") String maxt)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneySearch");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		
		String ltime, rtime;
		if(mint.trim().equals("")||mint.trim().length()==0)ltime="20130415000001";
		else ltime=mint+"000001";
		if(maxt.trim().equals("")||maxt.trim().length()==0)rtime=sdf.format(now);
		else rtime=maxt+"235959";

		mav.addObject("moneylist", ms.search(money, ltime, rtime, pageNo));
		long rows = ms.countRows(money, ltime, rtime);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("users", us.searchAllEmp());
		mav.addObject("d", money);
		mav.addObject("ltime",mint);
		mav.addObject("rtime",maxt);
		
		return mav;
	}
	
	/*
	 //单次循环操作暂时不使用
	@RequestMapping("/to_money_add_1")
	public ModelAndView moneyAdd()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyAdd");
		
		List<Users> users = us.searchAllEmp();
		mav.addObject("users", users);
		
		return mav;
	}
	*/
	@RequestMapping("/do_money_add_1")
	public ModelAndView moneyInsert(Money money, ServletRequest request) throws IOException
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyAddU");

		//获得操作人
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		money.setMoneyOperator(user.getUserName());
		//获得操作时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		money.setLastTime(sdf.format(now));
		
		money.setType("2");//暂定1为每台售货机的上缴；2为不分机器总的上缴；3为每月清算总额
		ms.insert(money);
		
		MoneyHis mh = MoneyToHis(money);
		mhs.insert(mh);
		
		mav.addObject("users", nms.searchAllUser());
		return mav;
	}

	@RequestMapping("/do_money_delete_2")
	public String moneyDelete(@RequestParam("check") List<Long> mycheck)
	{
		ms.deleteMoreByHql(mycheck);
		return "MoneySearch";
	}
	
	@RequestMapping("/to_money_edit_0")
	public ModelAndView moneyEdit(@RequestParam("id") long moneyid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyEdit");

		mav.addObject("m", (Money) ms.read(moneyid));
		return mav;
	}
	
	@RequestMapping("/do_money_update_0")
	public String moneyUpdate(Money money, ServletRequest request)
	{
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		money.setMoneyOperator(user.getUserName());
		//获得操作时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		money.setLastTime(sdf.format(now));

		ms.update(money);
		
		//货币历史是否也要更新？还是再插一条记录？
		MoneyHis mh = MoneyToHis(money);
		mhs.insert(mh);
		
		return "MoneySearch";
	}
	
//	@RequestMapping("/to_mymoney_page_3")
//	public ModelAndView mymoneyPage(@RequestParam("year") String y, @RequestParam("month") String m, ServletRequest request)
//	{
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("MyMoneyPage");
//		
//		HttpServletRequest httpRequest = (HttpServletRequest) request;
//		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
//		String ename = user.getEmployeeName();
//		String yearmonth = y.concat(m);
//		
//		mav.addObject("moneylist", ms.searchAllByMonth(ename, yearmonth));
//		return mav;
//	}
	
	@RequestMapping("/do_mymoney_search_3")
	public ModelAndView mymoneySearch(@RequestParam("year") String y, @RequestParam("month") String m, ServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MyMoneyPage");
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		String ename = user.getEmployeeName();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		Date now = new Date();

		String yearmonth = new String();
		if(y.equals("")||m.equals(""))yearmonth=sdf.format(now);
		else yearmonth = y.concat(m);

		List<MoneyHis> mlist = mhs.searchAllByMonth(ename, yearmonth);
		mav.addObject("moneylist", mlist);
		
		int mcount=0;
		for(int i=0; i<mlist.size(); i++){
			mcount+=mlist.get(i).getMoneyIn();
		}
		mav.addObject("count",mcount);
		return mav;
	}
	
	@RequestMapping("/to_moneyhis_page_3")
	public ModelAndView moneyHisPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyHisSearch");
		
		List<Users> users=us.searchAllEmp();//搜索所有有效的营业员
		mav.addObject("users", users);

		return mav;
	}
	
	@RequestMapping("/do_moneyhis_search_3")
	public ModelAndView moneyHisSearch(@RequestParam("employeeName") String ename, @RequestParam("year") String y, @RequestParam("month") String m, ServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyHisSearch");

		String yearmonth = new String();
		yearmonth = y.concat(m);

		List<MoneyHis> mlist = mhs.searchAllByMonth(ename, yearmonth);
		mav.addObject("moneylist", mlist);
		
		int mcount=0;
		for(int i=0; i<mlist.size(); i++){
			mcount+=mlist.get(i).getMoneyIn();
		}
		
		List<Users> users=us.searchAllEmp();//搜索所有有效的营业员
		mav.addObject("users", users);
		
		mav.addObject("count",mcount);
		return mav;
	}
	
	public MoneyHis MoneyToHis(Money m){
		MoneyHis mh = new MoneyHis();
		mh.setEmployeeName(m.getEmployeeName());
		mh.setMoneyIn(m.getMoneyIn());
		mh.setMoneyOperator(m.getMoneyOperator());
		mh.setNodeName(m.getNodeName());
		mh.setLastTime(m.getLastTime());
		mh.setRemark(m.getRemark());
		mh.setType(m.getType());
		mh.setMoneyCount(m.getMoneyCount());
		return mh;
	}
	
	
	@RequestMapping("/to_money_AddUN_0")
	public ModelAndView tomoneyAddUser()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyAddU");
		mav.addObject("users", nms.searchAllUser());
		return mav;
	}
	
	@RequestMapping("/do_money_AddUN_0")
	public ModelAndView domoneyAddUser(ServletRequest request, @RequestParam("ename") String ename, @RequestParam("nodeName") List<String> nns, @RequestParam("moneyIn") List<Integer> mis)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyAddU");
		mav.addObject("users", nms.searchAllUser());
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		
		for(int i=0; i<nns.size(); i++){
			if(mis.get(i)!=0){
				Money m = new Money();
				m.setEmployeeName(ename);
				m.setMoneyIn(mis.get(i));
				m.setNodeName(nns.get(i));
				
				m.setLastTime(sdf.format(now));
				m.setMoneyOperator(user.getUserName());
				m.setType("1");//暂定1为每台售货机的上缴；2为不分机器总的上缴；3为每月清算总额
				m.setRemark("分售货机上缴");
				
				ms.insert(m);
				
				MoneyHis mh =  MoneyToHis(m);
				mhs.insert(mh);
			}
		}
		return mav;
	}
	
	//use JSON
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/do_money_find_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> nodefind(@RequestBody Map<String, String> model)
	{
		Map<String, Object> map = new HashMap<String, Object>(1);  

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();
		String yearmonth = sdf.format(now);
		
		//从shipping表中取出历来取货金额,不用历史表，直接用更新时间区分
		Shipping sp = new Shipping();
		sp.setEmployeeName(model.get("employeeName"));
		sp.setLastTime(sdf.format(now));
		List <Shipping> splist = new ArrayList<Shipping>();
		splist = (List<Shipping>) ss.searchAllThisMonth(sp);
		int moneyall = 0;

		for(int i=0; i<splist.size();i++){
			moneyall +=  splist.get(i).getMoneyThis();
		}
		
		List<Money> mlist = new ArrayList<Money>();
		mlist = ms.searchAllByMonth(model.get("employeeName"), yearmonth);
		Money m = new Money();
		int moneyIn = 0;
		int moneyCount = 0;
		for(int i=0; i<mlist.size(); i++){
			m = mlist.get(i);
			if(m.getLastTime().substring(0, 8).equals(sdf2.format(now))){//当天累加
				moneyIn += m.getMoneyIn();//因为分机器上缴营业额，累加
				}
			moneyCount += m.getMoneyIn();
		}

		map.put("success", "true");
		map.put("moneyIn", moneyIn);
		map.put("moneyAll", moneyall);//当月取货金额
		map.put("moneyCount", moneyCount-moneyall);//上缴总钱数 - 取货总钱数
		return map;
	}
}
