package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.DepotHisDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.ShippingDao;
import org.ecnu.orm.DepotHis;
import org.ecnu.orm.Shipping;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("ShippingService")
@Transactional
public class ShippingService extends AbstractService {

	public ShippingService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.Shipping";
		idName = "id";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("shippingDao")
	public void setDao(InterfaceDao shippingDao) {
		// TODO Auto-generated method stub
		dao = shippingDao;
	}

	public List<Shipping> searchAllThisMonth(Shipping sp) {
		// TODO Auto-generated method stub
		return ((ShippingDao) dao).getAllThisMonth(sp);
	}

	public List<Shipping> search(Shipping ship, String ltime, String rtime, int pageNo) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		try {
			fieldName = ClassUtil.getAttributes(ship);
			args=ClassUtil.getValues(ship);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  (List<Shipping>) ((ShippingDao) dao).getResult(Shipping.class, fieldName, args, ltime, rtime, pageNo);
	}

	public long countRows(Shipping ship, String ltime, String rtime) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		try {
			fieldName = ClassUtil.getAttributes(ship);
			args=ClassUtil.getValues(ship);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ((ShippingDao) dao).readRowsCount(Shipping.class, fieldName, args, ltime, rtime, idName);
	}

	public Shipping searchTheLast() {
		// TODO Auto-generated method stub
		return ((ShippingDao) dao).searchTheLast();
	}

}
