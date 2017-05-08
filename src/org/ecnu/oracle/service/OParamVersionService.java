package org.ecnu.oracle.service;

import java.util.List;

import org.ecnu.oracle.dao.OGroupInfoDtlDao;
import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.dao.OParamVersionDao;
import org.ecnu.oracle.orm.GroupInfo;
import org.ecnu.oracle.orm.ParamVersion;
import org.ecnu.oracle.orm.ParamVersionId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OParamVersionService extends OAbstractService {

	public OParamVersionService() {
		tableName = "org.ecnu.oracle.orm.ParamVersion";
//		idName = "";
		System.out.println("oracle ParamVersion service constructor!");
	}

	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("oParamVersionDao")
	public void setDao(OInterfaceDao oParamVersionDao) {
		// TODO Auto-generated method stub
		odao = oParamVersionDao;
	}
	
	public List<ParamVersion> searchAll() {
		// TODO Auto-generated method stub
		return ((OParamVersionDao) odao).getAllParamVersion();
	}
	
	public ParamVersion readByNodeId(String nodeId, String paramTag) {
		// TODO Auto-generated method stub
//		return ((OParamVersionDao) odao).readByCriteria(nodeId, paramTag);
		return ((OParamVersionDao) odao).readByNodeId(nodeId, paramTag);
	}

	public boolean nodeIdIsExist(String nodeId, String paramTag) {
		// TODO Auto-generated method stub
		if(((OParamVersionDao) odao).nodeIdIsExist(nodeId, paramTag))return true;
		return false;
	}
}
