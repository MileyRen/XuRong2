package org.ecnu.service;

import org.ecnu.dao.InterfaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("SaleService")
@Transactional
public class SaleService extends AbstractService {

	public SaleService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.Sale";
		idName = "SaleId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("saleDao")
	public void setDao(InterfaceDao saleDao) {
		// TODO Auto-generated method stub
		dao = saleDao;
	}

}
