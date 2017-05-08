package org.ecnu.oracle.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.dao.ONodeInfoDao;
import org.ecnu.oracle.orm.ONodeInfo;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ONodeInfoService extends OAbstractService{

	@Autowired
	private org.ecnu.service.NodeInfoService sqlNodeInfoService;
	
	public ONodeInfoService() {
		tableName="org.ecnu.oracle.orm.ONodeInfo";
		idName = "nodeId";
		System.out.println("oracleNodeInfo service constructor!");
	}
	
	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("oNodeInfoDao")
	public void setDao(OInterfaceDao oNodeInfoDao) {
		// TODO Auto-generated method stub
		odao=oNodeInfoDao;
	}

	/**
	 * 查询所有的单台售货机
	 * @param oni
	 * @return
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	@SuppressWarnings("unchecked")
	public List<ONodeInfo> searchNoPage(ONodeInfo oni) throws IllegalArgumentException, IllegalAccessException {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		fieldName=ClassUtil.getAttributes(oni);
		args = ClassUtil.getValues(oni);
		return (List<ONodeInfo>) odao.getAllResult(ONodeInfo.class, fieldName, args);
	}

	@SuppressWarnings("unchecked")
	public List<ONodeInfo> searchAllNode() {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		return (List<ONodeInfo>) odao.getAllResult(ONodeInfo.class, fieldName, args);
	}
}
