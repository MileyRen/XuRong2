package org.ecnu.controller;

import java.io.IOException;
import java.util.List;

import org.ecnu.orm.Role;
import org.ecnu.service.RoleService;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("roleController")
public class RoleController {
	@Autowired
	private RoleService roleService;
	//0编辑；1添加；2删除；3查找
	
	@RequestMapping("/to_role_page_3")
	public String rolePage()
	{
		return "RoleSearch";
	}
	
	@RequestMapping("/do_role_search_3")
	public ModelAndView RoleSearch()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoleSearch");
		mav.addObject("rolelist", roleService.searchAllRole());
		return mav;
	}
	
	@RequestMapping("/to_role_add_1")
	public String roleAdd()
	{
		return "RoleAdd";
	}
	
	@RequestMapping("/to_role_edit_0")
	public ModelAndView roleEdit(@RequestParam("id") long roleId)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoleEdit");
		mav.addObject("roleInfo", roleService.read(roleId));
		return mav;
	}
	
	@RequestMapping("/do_role_view_3")
	public ModelAndView roleView(@RequestParam("id") long roleId)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoleView");
		mav.addObject("roleInfo", roleService.read(roleId));
		return mav;
	}
	
	@RequestMapping("/do_role_delete_2")
	public ModelAndView roleDelete(@RequestParam("check") List<Long> mycheck)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoleSearch");
		roleService.deleteMoreByHql(mycheck);
		mav.addObject("rolelist", roleService.searchAllRole());
		return mav;
	}
	
	@RequestMapping("/do_role_add_1")
	public String roleInsert(Role role) throws IOException
	{
		ClassUtil.convertRole(role);
		roleService.insert(role);

//		response.setCharacterEncoding("utf-8");
//		response.setContentType("html/text");
//		PrintWriter out=response.getWriter();
//		out.print("<script language=javascript>alert('您所在的用户无权进行此操作！');location='Addrole.jsp';</script>");

		return "RoleAdd";
	}
	
	@RequestMapping("/do_role_update_0")
	public ModelAndView roleUpdate(Role role)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoleSearch");
		ClassUtil.convertRole(role);
		roleService.update(role);
		mav.addObject("rolelist", roleService.searchAllRole());
		return mav;
	}
}
