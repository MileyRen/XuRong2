package org.ecnu.oracle.service;

import org.ecnu.oracle.dao.OInterfaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OPWareInfoVersionService extends OAbstractService {

	public OPWareInfoVersionService() {
		tableName="org.ecnu.oracle.orm.PWareInfoVersion";
		idName="versionNo";
	}

	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("oPWareInfoVersionDao")
	public void setDao(OInterfaceDao oPWareInfoVersionDao) {
		// TODO Auto-generated method stub
		odao = oPWareInfoVersionDao;
	}

}
