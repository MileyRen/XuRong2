package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.NodeInfoDao;
import org.ecnu.oracle.dao.OGroupInfoDtlDao;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.Users;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("NodeInfoService")
@Transactional
public class NodeInfoService extends AbstractService {

	public NodeInfoService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.NodeInfo";
		idName = "nodeId";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("nodeInfoDao")
	public void setDao(InterfaceDao nodeInfoDao) {
		// TODO Auto-generated method stub
		dao = nodeInfoDao;
	}

	public String searchNGNameByNodeId(String nodeId) {
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		fieldName.add("nodeId");
		args.add(nodeId);
		System.out.println("nodeId:"+nodeId);
		String ngName = null;
		NodeInfo ni = new NodeInfo();
		// TODO Auto-generated method stub
		ni = (NodeInfo) dao.getResult(NodeInfo.class, fieldName, args, 0).get(0);
		ngName = ni.getNodeGroupInfo().getNodeGroupName();
		System.out.println("getNodeGroupName"+ngName);
		 return ngName;
	}

	@SuppressWarnings("unchecked")
	public List<NodeInfo> searchAllNode() {
		// TODO Auto-generated method stub
		List<String> fName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		return (List<NodeInfo>) dao.getAllResult(NodeInfo.class, fName, args);
	}
	
	public boolean nodeIsExist(String nodeId){
		NodeInfo ni = new NodeInfo();
		ni.setNodeId(nodeId);
		if(countRows(ni)>0) return true;
		return false;
	}

	public List<String> searchAllType() {
		// TODO Auto-generated method stub
		return ((NodeInfoDao) dao).searchAllNodeType();
	}

	public void updateIsAssign(String nodeId, String state) {
		// TODO Auto-generated method stub
		((NodeInfoDao) dao).updateAssign(nodeId, state);
	}

	public List<NodeInfo> getAllNodeIdByGroupId(String groupId) {
		// TODO Auto-generated method stub
//		List<NodeInfo> nilist = new ArrayList<NodeInfo>();
//		List<String> nids = new ArrayList<String>();
//		for(int i=0; i< nilist.size(); i++){
//			nids.add(nilist.get(i).getNodeId());
//		}
		return ((NodeInfoDao) dao).searchAllNodeIdByGroupId(groupId);
	}

	public void create(NodeInfo ni) {
		// TODO Auto-generated method stub
//		List<String> fieldNames = new ArrayList<String>();
//		List<Object> values = new ArrayList<Object>();
//		try {
//			fieldNames = ClassUtil.getAttributes(ni);
//			values = ClassUtil.getValues(ni);
//		} catch (IllegalArgumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		((NodeInfoDao) dao).createNode(ni);
	}
}
