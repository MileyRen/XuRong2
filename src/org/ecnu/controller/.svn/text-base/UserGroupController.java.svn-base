package org.ecnu.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ecnu.orm.Role;
import org.ecnu.orm.UserGroup;
import org.ecnu.orm.Users;
import org.ecnu.service.UserGroupService;
import org.ecnu.service.UserService;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("groupController")
public class UserGroupController {
	@Autowired
	private UserGroupService userGroupService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/to_group_page_3")
	public String groupPage()
	{
		return "UserGroupSearch";
	}
	
	@RequestMapping("/do_group_search_3")
	public ModelAndView groupSearch(@RequestParam("PageNo")int pageNo, UserGroup group)
	{			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserGroupSearch");
		mav.addObject("grouplist", userGroupService.search(group, pageNo));
		long rows = userGroupService.countRows(group);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("ug", group);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/to_group_add_1")
	public ModelAndView groupAdd()
	{
		ModelAndView mav =  new ModelAndView();
		mav.setViewName("UserGroupAdd");
		Users u = new Users();
		List<Users> empNames = (List<Users>) userService.searchAll(u);//userService.searchAllEmp();
		mav.addObject("empNames", empNames);
		List<UserGroup> groups = userGroupService.searchAllGroup();
		mav.addObject("groups", groups);
		return mav;
	}
	
	@RequestMapping("/to_group_edit_0")
	public ModelAndView groupEdit(@RequestParam("id")long usrid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserGroupEdit");
		mav.addObject("Member", userGroupService.read(usrid));
		List<UserGroup> groups=userGroupService.searchAllGroup();
		mav.addObject("groups", groups);
		return mav;
	}

	@RequestMapping("/do_group_view_3")
	public ModelAndView groupView(@RequestParam("id")long usrid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserGroupView");
		mav.addObject("Member", userGroupService.read(usrid));
		return mav;
	}

	@RequestMapping("/do_group_delete_2")
	public String groupDelete(@RequestParam("check") List<Long> mycheck)
	{
		userGroupService.deleteMoreByHql(mycheck);
		return "UserGroupSearch";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/do_group_add_1")
	public ModelAndView groupInsert(UserGroup group) throws IOException
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserGroupAdd");
		Users u = new Users();
		List<Users> empNames = (List<Users>) userService.searchAll(u);//userService.searchAllEmp();
		mav.addObject("empNames", empNames);
		List<UserGroup> groups = userGroupService.searchAllGroup();
		mav.addObject("groups", groups);
		
		userGroupService.insert(group);
		return mav;
	}
	
	@RequestMapping("/do_group_update_0")
	public ModelAndView roleUpdate(UserGroup ug)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserGroupSearch");
		userGroupService.update(ug);
		return mav;
	}
	
	
	//use JSON
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/do_group_find_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> groupfind(@RequestBody Map<String, String> model)
	{
		Map<String, String> map = new HashMap<String, String>(1);  
		UserGroup group = new UserGroup();
		group.setGroupName(model.get("groupName"));
		if(userGroupService.findGroupByGroupName(group)<=0)
		{
			map.put("success", "true");  
		}
		else 
		{
			map.put("success", "false");  
		}
		return map;
	}
}
