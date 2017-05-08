package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.orm.UserGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserGroupService extends AbstractService {

	public UserGroupService() {
		 tableName = "org.ecnu.orm.UserGroup";
		 idName = "groupId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("userGroupDao")
	public void setDao(InterfaceDao userGroupDao) {
		// TODO Auto-generated method stub
		dao = userGroupDao;
	}

	public long findGroupByGroupName(UserGroup group) {
		// TODO Auto-generated method stub
		return countRows(group);
	}
	
	@SuppressWarnings("unchecked")
	public List<UserGroup> searchAllGroup()
	{
		List<String> fName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		return (List<UserGroup>) dao.getAllResult(UserGroup.class, fName, args);
	}

}
