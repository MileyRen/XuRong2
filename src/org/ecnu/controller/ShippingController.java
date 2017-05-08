package org.ecnu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.ecnu.orm.Depot;
import org.ecnu.orm.DepotHis;
import org.ecnu.orm.Shipping;
import org.ecnu.orm.Users;
import org.ecnu.orm.Wares;
import org.ecnu.service.DepotService;
import org.ecnu.service.ShippingService;
import org.ecnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("shippingController")
public class ShippingController {
	@Autowired
	private ShippingService ss;
	
	@Autowired
	private DepotService ds;
	
	@Autowired
	private UserService us;
	
	@RequestMapping("/to_ship_page_3")
	public ModelAndView shipPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ShippingSearch");
		
		List<Users> users=us.searchAllEmp();//有效的搜索所有营业员
		mav.addObject("users", users);

		return mav;
	}
	
	@RequestMapping("/do_ship_search_3")
	public ModelAndView shipSearch(@RequestParam("PageNo") int pageNo, Shipping ship, @RequestParam("mintime") String mint, @RequestParam("maxtime") String maxt)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ShippingSearch");
		
		List<Users> users=us.searchAllEmp();//有效的搜索所有营业员
		mav.addObject("users", users);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		
		String ltime, rtime;
		if(mint.trim().equals("")||mint.trim().length()==0)ltime="20130415000001";
		else ltime=mint+"000001";
		if(maxt.trim().equals("")||maxt.trim().length()==0)rtime=sdf.format(now);
		else rtime=maxt+"235959";

		mav.addObject("shiplist", ss.search(ship, ltime, rtime, pageNo));
		long rows = ss.countRows(ship, ltime, rtime);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("d", ship);
		mav.addObject("ltime",mint);
		mav.addObject("rtime",maxt);
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_ship_view_3")
	public ModelAndView depotPage(@RequestParam("id") long id)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ShippingViewPrint");
		
		Shipping sp = (Shipping) ss.read(id);
		List<Depot> dlist = new ArrayList<Depot>();
		Depot d = new Depot();
		d.setShipping(sp);
//		d.setEmployeeName(sp.getEmployeeName());
		dlist = (List<Depot>) ds.searchAllByShip(sp.getId());
		
//		List<DepotHis> dlist = new ArrayList<DepotHis>();//his的信息不够全面
//		DepotHis d = new DepotHis();
//		d.setShippingId(sp.getShippingId());//his
//		dlist = (List<DepotHis>) dhs.searchAll(d);
		
		mav.addObject("shipinfo", sp);
		mav.addObject("dlist", dlist);
		return mav;
	}
}
