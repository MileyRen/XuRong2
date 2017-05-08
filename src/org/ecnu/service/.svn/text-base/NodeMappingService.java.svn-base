package org.ecnu.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.InterfaceDao;
import org.ecnu.dao.NodeMappingDao;
import org.ecnu.orm.NodeMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("NodeMappingService")
@Transactional
public class NodeMappingService extends AbstractService {

	public NodeMappingService() {
		tableName = "org.ecnu.orm.NodeMapping";
		idName = "id";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("nodeMappingDao")
	public void setDao(InterfaceDao nodeMappingDao) {
		// TODO Auto-generated method stub
		dao = nodeMappingDao;

	}

	@SuppressWarnings({ "unchecked", "null" })
	public void insertMore(List<NodeMapping> nmps, int size) {
		// TODO Auto-generated method stub
		int i;
		List<Object>[] args =null;
		for(i=0;i<nmps.size();i++) {
			args[i] = (List<Object>) nmps.get(i);
		}
		dao.createMore(idName, args, size);
	}

	public boolean nodeMapIsExist(NodeMapping nmp) {
		// TODO Auto-generated method stub
		if(countRows(nmp)>0) return true;
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<NodeMapping> searchAllByEname(String employeeName) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		fieldName.add("employeeName");
		args.add(employeeName);
		Class<?> c = NodeMapping.class;
		return (List<NodeMapping>) dao.getAllResult(c, fieldName, args);
	}

	public List<String> searchAllUser() {
		// TODO Auto-generated method stub
		return ((NodeMappingDao) dao).getAllUser();
	}

}
