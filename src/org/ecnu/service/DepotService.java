package org.ecnu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.ecnu.dao.ChannelInfoDao;
import org.ecnu.dao.DepotDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.MoneyDao;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.Depot;
import org.ecnu.orm.Money;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("DepotService")
@Transactional
public class DepotService extends AbstractService {

	public DepotService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.Depot";
		idName = "depotId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("depotDao")
	public void setDao(InterfaceDao depotDao) {
		// TODO Auto-generated method stub
		dao = depotDao;
	}

	public Object search(Depot depot, String ltime, String rtime, int pageNo) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		try {
			fieldName = ClassUtil.getAttributes(depot);
			args=ClassUtil.getValues(depot);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  ((DepotDao) dao).getResult(Depot.class, fieldName, args, ltime, rtime, pageNo);
	}

	public long countRows(Depot depot, String ltime, String rtime) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		try {
			fieldName = ClassUtil.getAttributes(depot);
			args=ClassUtil.getValues(depot);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ((DepotDao) dao).readRowsCount(Depot.class, fieldName, args, ltime, rtime, idName);
	}

	public List<Depot> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		return ((DepotDao) dao).searchAllByMonth(ename, yearmonth);
	}
	
	@SuppressWarnings("rawtypes" )
	public List searchByEmployeeName(String eName) {
		return ((DepotDao)dao).searchAllByEName(eName);
	}
	
	@SuppressWarnings("unchecked")
	public Depot getLastest(Depot d) {
		return ((List<Depot>)search(d, "", "", 0)).get(0);
	}
	
	public List searchAllEName () {
		return ((DepotDao)dao).searchAllEName();
	}
	public List<Depot> searchThisMonthByWNameEName(String ename, String wname, String strym) {
		// TODO Auto-generated method stub
		return ((DepotDao) dao).searchThisMonthByWNameEName(ename, wname, strym);
	}

	public void deleteOnesEW(String ename, String wname) {
		// TODO Auto-generated method stub
		((DepotDao)dao).deleteOnesEW(ename, wname);
	}

	public List<Depot> searchAllByShip(Long id) {
		// TODO Auto-generated method stub
		return ((DepotDao) dao).searchAllByShip(id);
	}
}
