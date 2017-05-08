package org.ecnu.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import org.ecnu.orm.Role;
import org.ecnu.orm.Users;

public class AuthorizeInterceptor implements Filter {
	
	private static Logger logger=Logger.getLogger(AuthorizeInterceptor.class);


	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String toUrl = httpRequest.getRequestURL().toString();
		logger.info("Request URL: "+toUrl);
		if(toUrl.contains("log")||toUrl.contains("register")||toUrl.contains(".")||toUrl.contains("test")||toUrl.contains("noauthor"))
		{
			chain.doFilter(request, response);
			return;
		}
		
		//获取session中的用户登录信息
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		
		//若无信息，表示未登录，返回登录页面
		if(user==null)
		{
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.print("<script language=javascript>alert('登陆失效或未登录！');window.top.location='login';</script>");
			out.flush();
			out.close();
			return;
		}
		else if(user.getRole().getRoleName()=="营业员"||user.getRole().getRoleName()=="仓库管理员"||user.getRole().getRoleName()=="财务管理员"){
			chain.doFilter(request, response);
			System.out.println(user.getRole().getRoleName()+"login operator");
			return;
		}
		
		//根据请求的页面，判断权限。请求由4部分组成，之间使用'_'分割
		//第一部分为执行(do)或跳转(to)，在这边
		else
		{
			if(toUrl.contains("select")||toUrl.contains("pwd")||toUrl.contains("find")||toUrl.contains("import")||toUrl.contains("my")||toUrl.contains("JSon")||toUrl.contains("stock")||toUrl.contains("ship")){//||toUrl.contains("do")&&!toUrl.contains("delete")||toUrl.contains("do")&&!toUrl.contains("verify")
						//编辑点位和货道时的选择，以及更改密码，ajax的find， 除删除和审核外的do 是不判权限的
				chain.doFilter(request, response);
				return;
			}
			String toUrlArr[]=toUrl.split("/");
			logger.info("Request Action Name: "+toUrlArr[toUrlArr.length-1]);

			String actionName[]=toUrlArr[toUrlArr.length-1].split("_");
			if(actionName.length>1)
			{
				String modleName=actionName[1];
				String opNum=actionName[3];
				if(!checkAuthorize(user, modleName, opNum))
				{
					//request.getRequestDispatcher("/login").forward(request, response);
					
					response.setCharacterEncoding("utf-8");
					response.setContentType("text/html");
					PrintWriter out=response.getWriter();
					out.print("<script language=javascript>alert('你无权限做此操作！');javascript:history.go(-1);</script>");
					return;
				}
			}

		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	

	private boolean checkAuthorize(Users user,String modelName, String opNum) {
		String roleName = "";
		if(modelName.equals("user")||modelName.equals("group"))roleName = "userRole";
		else if(modelName.equals("node")||modelName.equals("nodehis"))roleName = "nodeRole";
		else if(modelName.equals("channel")||modelName.equals("channelgroup")||modelName.equals("channelhis")||modelName.equals("prochannel"))roleName = "channelRole";
		else if(modelName.equals("goods")||modelName.equals("ware"))roleName = "wareRole";
		else if(modelName.equals("money")||modelName.equals("moneyhis"))roleName = "moneyRole";
		else if(modelName.equals("profit")||modelName.equals("finance"))roleName = "profitRole";
		else roleName = modelName + "Role";
		
		int i = Integer.parseInt(opNum);
		
		String role = new String();

		System.out.println("模块权限: "+roleName+"_"+i);
		try {
			Role r=user.getRole();
			Field field = r.getClass().getDeclaredField(roleName);
			field.setAccessible(true);
			role = (String) field.get(r);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return role.charAt(i) == '1';
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
