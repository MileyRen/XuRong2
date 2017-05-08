package org.ecnu.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.Profit;
import org.ecnu.orm.Role;
import org.ecnu.orm.UserGroup;
import org.ecnu.orm.Users;
import org.ecnu.service.ProfitService;
import org.ecnu.service.RoleService;
import org.ecnu.service.UserGroupService;
import org.ecnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller("userController")
@SessionAttributes({"userinfo"})
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleServcie;
	
	@Autowired
	private UserGroupService userGroupService;
	
	@Autowired
	private ProfitService ps;
	
	//响应单击用户管理按钮事件，跳到SearchUser.jsp
	@RequestMapping("/to_user_page_3")
	public String userPage()
	{
		return "UserSearch";
	}
	
	/**
	 * 用户搜索
	 * @param pageNo 页号
	 * @param user 封装来自SearchUser.jsp页面的信息
	 * @return 返回SearchUser.jsp,显示搜索得到的用户信息
	 */
	@RequestMapping("/do_user_search_3")
	public ModelAndView userSearch(@RequestParam("PageNo") int pageNo, Users user)
	{			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserSearch");
		
		@SuppressWarnings("unchecked")
		List<Users> users=(List<Users>) userService.search(user, pageNo);
		long rows=userService.countRowsByLike(user);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("userlist", users);
		mav.addObject("PageNo", pageNo);
		mav.addObject("u", user);
		return mav;
	}
	
	//响应在SearchUser.jsp页面单击新建用户按钮事件，跳到AddUser.jsp,输入将添加的用户信息
	@RequestMapping("/to_user_add_1")
	public ModelAndView userAdd()
	{
		ModelAndView mav = new ModelAndView();
		List<Role> roles=roleServcie.searchAllRole();
		mav.addObject("roles", roles);
		
		List<UserGroup> groups=userGroupService.searchAllGroup();
		mav.addObject("groups", groups);
		mav.setViewName("UserAdd");
		
		return mav;
	}
	
	
	/**
	 * 跳转至用户信息编辑页面
	 * @param usrid 用户id
	 * @return 返回EditUser页面, 显示该用户基本信息
	 */
	@RequestMapping("/to_user_edit_0")
	public ModelAndView userEdit(@RequestParam("id") long usrid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserEdit");
		mav.addObject("Member", userService.read(usrid));
		List<Role> roles=roleServcie.searchAllRole();
		mav.addObject("roles", roles);
		
		List<UserGroup> groups=userGroupService.searchAllGroup();
		mav.addObject("groups", groups);
		return mav;
	}
	
	/**
	 * 查看用户详细信息
	 * @param usrid 用户id
	 * @return 返回ViewUser.jsp,显示用户详细信息
	 */
	@RequestMapping("/do_user_view_3")
	public ModelAndView userView(@RequestParam("id") long usrid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UserView");
		mav.addObject("Member", userService.read(usrid));
		return mav;
	}
	
	
	/**
	 * 删除用户
	 * @param mycheck  SearchUser.jsp页面所有被选中的用户id的集合
	 * @return 返回SearchUser.jsp
	 */
	@RequestMapping("/do_user_delete_2")
	public String userDelete(@RequestParam("check") List<Long> mycheck)
	{
		userService.deleteMoreByHql(mycheck);
		return "UserSearch";
	}
	
	
	/**
	 * 添加用户
	 * @param response
	 * @param user 封装AddUser.jsp页面填写的用户信息
	 * @return 返回AddUser.jsp页面
	 * @throws IOException
	 */
	@RequestMapping("/do_user_add_1")
	public ModelAndView userInsert(Users user) throws IOException
	{
		ModelAndView mav = new ModelAndView();
		//获取groupId
		long groupId=user.getUserGroup().getGroupId();
		//根据groupId获取group信息
		UserGroup group=(UserGroup) userGroupService.read(groupId);
		Users u=userService.findUsersByEmpName(group.getGroupLeader());
		user.setLeaderId(u.getUserId());
		user.setUserStatus("1");//20130410添加账户的状态
		userService.insert(user);
		
		if(user.getRole().getRoleId()==28){//营业员角色编号为28
			//如果是营业员的话，添加用户时在profit表中建立一条新纪录
			Profit p = new Profit();
			p.setEmployeeName(user.getEmployeeName());
			p.setType("1");
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			Date now=new Date();
			
			if(ps.searchAll(p).size()==0){//不存在记录
				p.setYear(sdf.format(now).substring(0, 4));
				p.setMonth(sdf.format(now).substring(4, 6));
				p.setMoneyCount(0);
				p.setTurnOverCard(0);
				p.setTurnOverCash(0);
				
				ps.insert(p);
			}
		}
		List<Role> roles=roleServcie.searchAllRole();
		mav.addObject("roles", roles);
		
		List<UserGroup> groups=userGroupService.searchAllGroup();
		mav.addObject("groups", groups);
		mav.setViewName("UserAdd");
		
		return mav;
	}
	
	/**
	 * 删除用户
	 * @param user 封装EditUser.jsp的表单信息
	 * @return 返回SearchUser.jsp页面
	 */
	@RequestMapping("/do_user_update_0")
	public String userUpdate(Users user, ModelMap model)
	{
		userService.update(user);
		Users u=(Users) model.get("userinfo");
		if(user.getUserId().equals(u.getUserId()))
		{
			Users newUser=(Users) userService.read(user.getUserId());
			model.addAttribute("userinfo", newUser);
		}
		return "UserSearch";
	}
	
	
	/**
	 * 跳转到修改密码界面
	 * @return 
	 */
	@RequestMapping("/to_pwd_page_0")
	public String pwdPage()
	{
		return "UpdatePasswd";
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param user 封装用户信息
	 * @param npd 新密码
	 * @return 返回UpdatePasswd.jsp
	 */
	@RequestMapping("/do_pwd_update_0")
	public ModelAndView userUpdatePwd(HttpServletRequest request, Users user, @RequestParam("npd") String npd)
	{
		ModelAndView mav = new ModelAndView();
		Long userid = user.getUserId();
		userService.updatepasswd(userid,npd);
		mav.addObject("infomation", "密码修改成功");
		mav.setViewName("UpdatePasswd");
		return mav;
	}
	
	//use JSON
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/do_user_find_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> userfind(@RequestBody Map<String, String> model)
	{
		Map<String, String> map = new HashMap<String, String>(1);  
		Users user = new Users();
		user.setUserName(model.get("userName"));
		if(userService.findUserByUserName(user)<=0)
		{
			map.put("success", "true");  
		}
		else 
		{
			map.put("success", "false");  
		}
		return map;
	}
	
	//use JSON
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/do_user_findename_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> enamefind(@RequestBody Map<String, String> model)
	{
		Map<String, String> map = new HashMap<String, String>(1);  
		Users user = new Users();
		user.setEmployeeName(model.get("employeeName"));
		if(userService.findUserByUserName(user)<=0)
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
