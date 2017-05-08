package org.ecnu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.Users;
import org.ecnu.orm.Wares;
import org.ecnu.service.UserService;
import org.ecnu.service.WaresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("testController")
public class TestController {
	@Autowired
	private UserService us;
	
	@Autowired
	private WaresService ws;
	
	@RequestMapping("/do_test_jquery_0")
	public ModelAndView userSearch(HttpServletRequest request, @RequestParam("num") int num)
	{			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jQueryTable");
		
//		while(request.getParameterNames().nextElement() != null){
//			System.out.println(request.getParameterNames().nextElement());
//			System.out.println(request.getParameterValues(request.getParameterNames().nextElement()));
//		}
//		System.out.println(request.getParameter("i"));
		
		for(int i=1; i<=num; i++){
			System.out.println("desc"+i+"="+request.getParameter("desc"+i));
		}
		return mav;
	}
	
	@RequestMapping("/to_money_add2_1")
	public ModelAndView moneyAdd2()
	{			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyAdd2");
		
//		while(request.getParameterNames().nextElement() != null){
//			System.out.println(request.getParameterNames().nextElement());
//			System.out.println(request.getParameterValues(request.getParameterNames().nextElement()));
//		}
//		System.out.println(request.getParameter("i"));
		List<Users> users=us.searchAllEmp();//有效的搜索所有营业员
		for(int i=0;i<users.size();i++){
			System.out.println(users.get(i).getEmployeeName());
		}
		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping("/importcsvtest")
	public ModelAndView importcsvtest(@RequestParam("filepath") String filepath)
	{			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ImportCSV");
		
		System.out.println("filepath:"+filepath);
		return mav;
	}
	
	@RequestMapping("/do_test_combox_0")
	public ModelAndView comboxTest(HttpServletRequest request)
	{			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("WriteCombox");
		
		List<Wares> wares=ws.searchAllWare();
		mav.addObject("wares", wares);
		
		return mav;
	}
}
