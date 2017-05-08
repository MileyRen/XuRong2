package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.UserDao;
import org.ecnu.orm.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService extends AbstractService {
	
	public UserService() {
		 tableName = "org.ecnu.orm.Users";
		 idName = "userId";
	}
	
	
	@Autowired
	@Qualifier("userDao")
	public void setDao(InterfaceDao userDao)
	{
		dao=userDao;
	}


	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	public long findUserByUserName(Users user){
		return countRows(user);
	}


	public void updatepasswd(Long userid, String npd) {
		// TODO Auto-generated method stub
		String id = Long.toString(userid);
		List<String> fname = new ArrayList<String>();
		List<Object> val = new ArrayList<Object>();
		fname.add("passWord");
		val.add(npd);
		dao.updateByhql(tableName, idName, id, fname, val);
	}
	
	public Users findUsersByEmpName(String employeeName)
	{
		List<String> fname = new ArrayList<String>();
		List<Object> val = new ArrayList<Object>();
		fname.add("employeeName");
		val.add(employeeName);
		@SuppressWarnings("unchecked")
		List<Users> users=(List<Users>) dao.getAllResult(Users.class, fname, val);
		return users.get(0);
	}

	public List<Users> searchAllEmp() {
		// TODO Auto-generated method stub
		return ((UserDao) dao).getAllAssists();
	}
}
