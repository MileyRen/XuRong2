package org.ecnu.service;

import org.ecnu.dao.InterfaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("ProfitService")
@Transactional
public class ProfitService extends AbstractService {

	public ProfitService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.Profit";
		idName = "profitId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("profitDao")
	public void setDao(InterfaceDao profitDao) {
		// TODO Auto-generated method stub
		dao = profitDao;
	}

}
