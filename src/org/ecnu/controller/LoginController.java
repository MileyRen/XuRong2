package org.ecnu.controller;

import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.Users;
import org.ecnu.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
//import javax.servlet.http.HttpSession;

@Controller("loginController")
@SessionAttributes({"userinfo"})
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/login")
	public String loginPage(HttpServletRequest request)
	{
		//未登陆过则跳到Login.jsp
		if(request.getSession().getAttribute("userinfo") ==null){
		return "Login";
		}
		//登陆过则直接跳到Welcome.jsp
		else return "Welcome";
	}
	
	/**
	 * 验证登陆时的用户名和密码
	 * @param request 
	 * @param userCommand 封装来自login.jsp页面的信息
	 * @return 用户名和密码错误则重新跳到Login.jsp,成功则跳到Welcome.jsp页面
	 */
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(HttpServletRequest request,Users userCommand){

		boolean isValidUser = loginService.hasMatchUser(userCommand);
		if (!isValidUser) {
			return new ModelAndView("Login", "error", "用户名或密码错误！");
		} else {
			String hql = "from Users where userName =?";
			Users user = (Users) loginService.readByObject(hql, new Object[]{userCommand.getUserName()});
			request.getSession().setAttribute("userinfo", user);
			request.getSession().setAttribute("mrname", user.getRole().getRoleName());
			ModelAndView mav = new ModelAndView();
			mav.setViewName("Welcome");
			return mav;
		}
	}

	/**
	 * 退出系统
	 * @param SessionStatus 
	 * @return 注销掉当前session后，返回Logout.jsp页面
	 */
	@RequestMapping("/logoutCheck")
	public ModelAndView logoutCheck(SessionStatus status){
		status.setComplete();
//		request.getSession().invalidate();//request被hibernate托管，所以该方法不能正常使用
		return new ModelAndView("Logout");
	}
	
	@RequestMapping("/noauthor")
	public String noAuthor(HttpServletRequest request){
		return "NoAuthor";
	}
	
	/**
	 * 验证登陆时的用户名和密码
	 * 用于Flex客户端
	 * @param request 
	 * @param userCommand 封装来自login.jsp页面的信息
	 * @return 用户名和密码错误则重新跳到Login.jsp,成功则跳到Welcome.jsp页面
	 */
	@RequestMapping("/floginCheck")
	@ResponseBody
	public String floginCheck(HttpServletRequest request,Users userCommand){
			
		boolean isValidUser = loginService.hasMatchUser(userCommand);
		if (!isValidUser) {
			return "Error";
		} else {
			
			String hql = "from Users where userName =?";
			Users user = (Users) loginService.readByObject(hql, new Object[]{userCommand.getUserName()});
//			System.out.println(user.getUserName());
			request.getSession().setAttribute("userinfo", user);
			return "Success";
		}
	}
}
