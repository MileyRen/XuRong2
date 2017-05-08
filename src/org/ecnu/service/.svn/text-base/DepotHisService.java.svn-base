package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.DepotDao;
import org.ecnu.dao.DepotHisDao;
import org.ecnu.dao.DepotHisDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.orm.Depot;
import org.ecnu.orm.DepotHis;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("DepotHisService")
@Transactional
public class DepotHisService extends AbstractService {

	public DepotHisService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.DepotHis";
		idName = "depotHisId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("depotHisDao")
	public void setDao(InterfaceDao depotHisDao) {
		// TODO Auto-generated method stub
		dao = depotHisDao;
	}

	public List<DepotHis> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		return ((DepotHisDao) dao).searchAllByMonth(ename, yearmonth);
	}

	public Object search(DepotHis depot, String ltime, String rtime, int pageNo) {
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
		return  ((DepotHisDao) dao).getResult(DepotHis.class, fieldName, args, ltime, rtime, pageNo);
	}

	public long countRows(DepotHis depot, String ltime, String rtime) {
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
		return ((DepotHisDao) dao).readRowsCount(DepotHis.class, fieldName, args, ltime, rtime, idName);
	}

//	public List<DepotHis> searchAllByShip(Long id) {
//		// TODO Auto-generated method stub
//		return ((DepotHisDao) dao).searchAllByShip(id);
//	}
}
