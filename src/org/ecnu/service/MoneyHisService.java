package org.ecnu.service;

import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.MoneyDao;
import org.ecnu.dao.MoneyHisDao;
import org.ecnu.orm.Money;
import org.ecnu.orm.MoneyHis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("MoneyHisService")
@Transactional
public class MoneyHisService extends AbstractService {

	public MoneyHisService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.MoneyHis";
		idName = "moneyHisId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("moneyHisDao")
	public void setDao(InterfaceDao moneyHisDao) {
		// TODO Auto-generated method stub
		dao = moneyHisDao;
	}

	public List<MoneyHis> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		return ((MoneyHisDao) dao).searchAllByMonth(ename, yearmonth);
	}

}
