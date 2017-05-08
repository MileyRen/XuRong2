package org.ecnu.service;

import java.util.List;

import org.ecnu.dao.DepotHisDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.MyStockDao;
import org.ecnu.orm.MyStock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("MyStockService")
@Transactional
public class MyStockService extends AbstractService {

	public MyStockService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.MyStock";
		idName = "stockId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("myStockDao")
	public void setDao(InterfaceDao myStockDao) {
		// TODO Auto-generated method stub
		dao = myStockDao;
	}

	public List<MyStock> searchAllByEmp(String eName) {
		// TODO Auto-generated method stub
		return ((MyStockDao) dao).searchAllByEmp(eName);
	}

	public void creatNextMonth(String ename, String wname, int csn, int wareCost, String stry, String strm, String lastTime) {
		// TODO Auto-generated method stub
		((MyStockDao) dao).creatNextMonth(ename, wname, csn, wareCost, stry, strm, lastTime);
	}

	public void updateStoreNum(Long sid, int csn, int wareCost) {
		// TODO Auto-generated method stub
		((MyStockDao) dao).updateStoreNum(sid, csn, wareCost);
	}

	public List<MyStock> searchThisMonthByWName(String ename, String wname, String stry, String strm) {
		// TODO Auto-generated method stub
		
		return ((MyStockDao) dao).searchThisMonthByWName(ename, wname, stry, strm);
	}

	public List<MyStock> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		return ((MyStockDao) dao).searchAllByMonth(ename, yearmonth);
	}

}
