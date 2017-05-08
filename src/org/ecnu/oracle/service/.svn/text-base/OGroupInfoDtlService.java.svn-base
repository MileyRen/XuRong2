package org.ecnu.oracle.service;

import java.util.List;

import org.ecnu.oracle.dao.OGroupInfoDtlDao;
import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.dao.OParamVersionDao;
import org.ecnu.oracle.orm.GroupInfoDtl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OGroupInfoDtlService extends OAbstractService {

	public OGroupInfoDtlService() {
		tableName="org.ecnu.oracle.orm.GroupInfoDtl";
//		idName = "GroupInfoDtlId";//id双主键
	}

	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("oGroupInfoDtlDao")
	public void setDao(OInterfaceDao oGroupInfoDtlDao) {
		// TODO Auto-generated method stub
		odao=oGroupInfoDtlDao;
	}

//	public List<String> getAllNodeInfo(String groupId) {
//		// TODO Auto-generated method stub
//		return ((OGroupInfoDtlDao) odao).getAllNodeIdByGroupId(groupId);
//	}

	public List<String> getAllNodeIdByGroupId(String groupId) {
		// TODO Auto-generated method stub
		return ((OGroupInfoDtlDao) odao).searchAllNodeIdByGroupId(groupId);
	}

	public String getGroupIdByNodeId(String nodeId) {
		// TODO Auto-generated method stub
		return ((OGroupInfoDtlDao) odao).searchGroupIdByNodeId(nodeId);
	}

	public boolean nodeIdExist(String nodeId) {
		// TODO Auto-generated method stub
//		GroupInfoDtl gid = new GroupInfoDtl();
//		odao.getAllResult(GroupInfoDtl.class, fieldName, args)
		if(((OGroupInfoDtlDao) odao).nodeIdIsExist(nodeId))return true;
		return false;
	}
}
