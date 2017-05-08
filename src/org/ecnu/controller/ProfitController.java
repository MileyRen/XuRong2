package org.ecnu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ecnu.orm.Depot;
import org.ecnu.orm.Money;
import org.ecnu.orm.MyStock;
import org.ecnu.orm.Profit;
import org.ecnu.orm.Shipping;
import org.ecnu.orm.Users;
import org.ecnu.service.MoneyService;
import org.ecnu.service.ProfitService;
import org.ecnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@SuppressWarnings("unused")
@Controller("profitController")
public class ProfitController {
	@Autowired
	private MoneyService ms;
	
	@Autowired
	private UserService us;
	
	@Autowired
	private ProfitService ps;

	@RequestMapping("/to_finance_checkpage_3")
	public ModelAndView financecheckPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("FinanceCheck");
		List<Users> users=us.searchAllEmp();//搜索所有有效的营业员
		mav.addObject("users", users);
		
		return mav;
	}
	
	@RequestMapping("/do_finance_check_3")
	public ModelAndView financecheck(Profit p)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("FinanceCheck");

		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat df=new SimpleDateFormat("yyyyMM"); //制定日期格式
		Calendar c=Calendar.getInstance();
		Date now=new Date();
		c.setTime(now);
		c.add(Calendar.MONTH,1); //将当前日期加一个月
		String validityDate=df.format(c.getTime());
		
		String lastTime = sdf.format(now);
		
		//插入下个月的记录
		Profit pnext = new Profit();
		pnext.setType("1");
		pnext.setEmployeeName(p.getEmployeeName());
		pnext.setYear(validityDate.substring(0, 4));
		pnext.setMonth(validityDate.substring(4, 6));
		ps.insert(pnext);
		
		//更新当月值
		p.setLastTime(lastTime);
		p.setType("2");
		p.setYear(lastTime.substring(0, 4));
		p.setMonth(lastTime.substring(4, 6));
		p.setProfit(p.getTurnOverCard()+p.getMoneyCount()+p.getLoactionAllowance()-p.getWareCost()-p.getCarGasCost()-p.getCarRepaireCost()-p.getCost1()-p.getCost3()-p.getCost4()-p.getCost5()-p.getCost6()-p.getInsurances()-p.getLocationCost()-p.getManageCost()-p.getWages());
		ps.update(p);
		
		//删除money表中ename的数据
		ms.deleteByEName(p.getEmployeeName());
		
		List<Users> users=us.searchAllEmp();//搜索所有有效的营业员
		mav.addObject("users", users);
		
		return mav;
	}
	
	@RequestMapping("/to_profit_page_3")
	public ModelAndView profitPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ProfitSearch");

		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_profit_search_3")
	public ModelAndView profitSearch(@RequestParam("PageNo") int pageNo, Profit pf)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ProfitSearch");
		
//		List<Profit> plist = new ArrayList<Profit>();
//		plist = (List<Profit>) ps.search(pf, pageNo);
		mav.addObject("plist", (List<Profit>) ps.searchByLike(pf, pageNo));
		long rows=ps.countRowsByLike(pf);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("pinfo", pf);
		
		return mav;
	}
	
	@RequestMapping("/do_profit_view_3")
	public ModelAndView userView(@RequestParam("pid") long profitid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ProfitView");
		mav.addObject("pinfo", ps.read(profitid));
		return mav;
	}
	
	//use JSON
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/do_profit_find_3", method=RequestMethod.POST)
	@ResponseBody
//	public Profit profitfind(@RequestBody Map<String, String> model)
	public Map<String, Object> profitfind(@RequestBody Map<String, String> model)
	{
		Map<String, Object> map = new HashMap<String, Object>(1);
		
		Profit p = new Profit();  
		Profit p2 = new Profit();
		p2.setEmployeeName(model.get("employeeName"));
		p2.setType("1");
		
		List<Money> mlist = new ArrayList<Money>();
		Money m2 = new Money();
//		m2.setEmployeeName(model.get("employeeName"));
		mlist = (List<Money>) ms.searchAllByEName(model.get("employeeName"));
		System.out.println("mlist.size()"+mlist.size());
		int mc = 0;
		for(int i=0; i<mlist.size(); i++){
			System.out.println(mlist.get(i).getMoneyIn()+"+++"+mlist.get(i).getLastTime());
			mc += mlist.get(i).getMoneyIn();
		}
		System.out.println("moneyCount"+mc);
		if(ps.searchAll(p2).size()!=0){
			p = (Profit) ps.searchAll(p2).get(0);
			
			map.put("success", "true");
			map.put("profit", p);
			map.put("moneyCount", mc);
		}else{
			map.put("success", "false");
		}
		
		return map;
	}
}
