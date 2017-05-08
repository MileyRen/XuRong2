package org.ecnu.service;

import org.ecnu.dao.*;
import org.ecnu.orm.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginService extends AbstractService{
	
	public LoginService() {
		 tableName = "org.ecnu.orm.Users";
		 idName = "userId";
		 System.out.println("LoginService");
	}
	
	
	@Autowired
	@Qualifier("userDao")
	public void setDao(InterfaceDao userDao)
	{
		System.out.println("set user dao: "+userDao);
		dao=userDao;
	}


	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	public void Hello()
	{
		((UserDao) dao).HelloUser();
	}
	
//	public long findUserByUserName(String userName){
//		return countRows(userName);
//	}
	
//	public boolean hasMatchUser(String userName, String password){
//		Users user = new Users();
//		user.
//		return ((LoginService) dao).countRows(user) > 0 ;
//	}
	
	public boolean hasMatchUser(Users user){
		System.out.println("User:"+user.getUserName());

		return countRows(user) > 0 ;
	}
}
