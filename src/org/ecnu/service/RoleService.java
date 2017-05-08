package org.ecnu.service;

import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.RoleDao;
import org.ecnu.orm.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleService extends AbstractService {

	public RoleService() {
		 tableName = "org.ecnu.orm.Role";
		 idName = "roleId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("roleDao")
	public void setDao(InterfaceDao roleDao) {
		// TODO Auto-generated method stub
		dao=roleDao;
	}

	public List<Role> searchAllRole() {
		// TODO Auto-generated method stub
		return ((RoleDao) dao).getAllRole();
	}

}
