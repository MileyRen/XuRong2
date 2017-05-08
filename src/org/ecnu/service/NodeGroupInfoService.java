package org.ecnu.service;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.orm.NodeGroupInfo;
import org.ecnu.orm.NodeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("NodeGroupInfoService")
@Transactional
public class NodeGroupInfoService extends AbstractService {

	public NodeGroupInfoService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.NodeGroupInfo";
		idName = "nodeGroupId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("nodeGroupInfoDao")
	public void setDao(InterfaceDao nodeGroupInfoDao) {
		// TODO Auto-generated method stub
		dao = nodeGroupInfoDao;
	}

	public boolean groupIsExist(String gid) {
		// TODO Auto-generated method stub
		NodeGroupInfo ngi = new NodeGroupInfo();
		ngi.setNodeGroupId(gid);
		if(countRows(ngi)>0) return true;
		return false;
	}
}
