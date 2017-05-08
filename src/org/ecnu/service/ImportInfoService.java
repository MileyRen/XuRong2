package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.orm.ImportInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ImportInfoService extends AbstractService {

	public ImportInfoService() {
		 tableName = "org.ecnu.orm.ImportInfo";
		 idName = "id";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("importInfoDao")
	public void setDao(InterfaceDao importInfoDao) {
		// TODO Auto-generated method stub
		dao=importInfoDao;
	}

	@SuppressWarnings("unchecked")
	public List<ImportInfo> getAllResult() {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		return (List<ImportInfo>) dao.getAllResult(ImportInfo.class, fieldName, args);
	}
}
