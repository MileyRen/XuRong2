package org.ecnu.service;

import org.ecnu.dao.InterfaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WareInfoService extends AbstractService {

	public WareInfoService() {
		tableName = "org.ecnu.orm.WareInfo";
		idName = "wareId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("wareInfoDao")
	public void setDao(InterfaceDao wareInfoDao) {
		// TODO Auto-generated method stub
		dao = wareInfoDao;
	}

}
