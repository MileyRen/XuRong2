package org.ecnu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.ecnu.dao.DepotDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.MoneyDao;
import org.ecnu.orm.Depot;
import org.ecnu.orm.Money;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("MoneyService")
@Transactional
public class MoneyService extends AbstractService {

	public MoneyService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.Money";
		idName = "moneyId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("moneyDao")
	public void setDao(InterfaceDao moneyDao) {
		// TODO Auto-generated method stub
		dao = moneyDao;
	}

	public List<Money> search(Money money, String ltime, String rtime, int pageNo) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		try {
			fieldName = ClassUtil.getAttributes(money);
			args=ClassUtil.getValues(money);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  ((MoneyDao) dao).getResult(Money.class, fieldName, args, ltime, rtime, pageNo);
	}
	
	public long countRows(Money money, String ltime, String rtime) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		try {
			fieldName = ClassUtil.getAttributes(money);
			args=ClassUtil.getValues(money);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ((MoneyDao) dao).readRowsCount(Money.class, fieldName, args, ltime, rtime, idName);
	}

	public List<Money> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		return ((MoneyDao) dao).searchAllByMonth(ename, yearmonth);
	}

	public void deleteByEName(String employeeName) {
		// TODO Auto-generated method stub
		((MoneyDao) dao).deleteByEName(employeeName);
	}

	public List<Money> searchAllByEName(String ename) {
		// TODO Auto-generated method stub
		return ((MoneyDao) dao).searchAllByEName(ename);
	}

}
