package org.ecnu.oracle.service;

import java.util.List;

import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.dao.OPWareInfoDao;
import org.ecnu.oracle.orm.PWareInfo;
import org.ecnu.oracle.orm.PWareInfoId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("OPWareInfoService")
@Transactional
public class OPWareInfoService extends OAbstractService {

	public OPWareInfoService() {
		tableName="org.ecnu.oracle.orm.PWareInfo";
//		idName="id";//PWareInfoId 双主键
	}

	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("oPWareInfoDao")
	public void setDao(OInterfaceDao oPWareInfoDao) {
		// TODO Auto-generated method stub
		odao = oPWareInfoDao;
	}

	public List<PWareInfo> searchAllPWareInfoByCurVersionNo(long curVersionNo) {
		// TODO Auto-generated method stub
		return ((OPWareInfoDao) odao).searchAllChannel(curVersionNo);
	}

}
