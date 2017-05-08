package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.WaresDao;
import org.ecnu.orm.Users;
import org.ecnu.orm.Wares;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("WaresService")
@Transactional
public class WaresService extends AbstractService {

	public WaresService() {
		tableName = "org.ecnu.orm.Wares";
		idName = "wareId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("waresDao")
	public void setDao(InterfaceDao waresDao) {
		// TODO Auto-generated method stub
		dao = waresDao;
	}

	@SuppressWarnings("unchecked")
	public List<Wares> searchAllWare() {
		// TODO Auto-generated method stub
		List<String> fName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		fName.add("wareStatus");
		args.add("1");
		return (List<Wares>) dao.getAllResult(Wares.class, fName, args);
	}

	public long findWareByWareName(Wares w) {
		return countRows(w);
	}

	public void updateActivity(Long wareId) {
		// TODO Auto-generated method stub
		((WaresDao) dao).updateCount(wareId);
	}
}
