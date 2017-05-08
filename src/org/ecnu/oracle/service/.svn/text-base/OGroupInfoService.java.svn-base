package org.ecnu.oracle.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.dao.OGroupInfoDao;
import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.orm.GroupInfo;
import org.ecnu.oracle.orm.ONodeInfo;
import org.ecnu.orm.NodeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OGroupInfoService extends OAbstractService{

	public OGroupInfoService() {
		tableName="org.ecnu.oracle.orm.GroupInfo";
		idName = "groupId";
	}

	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("oGroupInfoDao")
	public void setDao(OInterfaceDao oGroupInfoDao) {
		// TODO Auto-generated method stub
		odao = oGroupInfoDao;
	}

	public List<GroupInfo> searchPvGi(GroupInfo groupInfo) {
		// TODO Auto-generated method stub
		List<GroupInfo> gilist = new ArrayList<GroupInfo>();
		gilist = ((OGroupInfoDao) odao).searchGroupInfoInParamVersion(groupInfo);
		return gilist;
	}

	public String searchNGNameByNodeId(String nodeId) {
		 return ((OGroupInfoDao) odao).searchGroupNameByNodeId(nodeId).get(0);
	}

	@SuppressWarnings("unchecked")
	public List<GroupInfo> searchAllGroup() {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		return (List<GroupInfo>) odao.getAllResult(GroupInfo.class, fieldName, args);
	}
}
