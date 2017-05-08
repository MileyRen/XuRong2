package org.ecnu.service;

import java.util.List;

import org.ecnu.dao.ChannelGroupDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.orm.ChannelGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("ChannelGroupService")
@Transactional
public class ChannelGroupService extends AbstractService {

	public ChannelGroupService() {
		// TODO Auto-generated constructor stub
		tableName = "org.ecnu.orm.ChannelGroup";
		idName = "id";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("channelGroupDao")
	public void setDao(InterfaceDao channelGroupDao) {
		// TODO Auto-generated method stub
		dao = channelGroupDao;
	}

//	public List<ChannelGroup> searchAllVersion() {
//		// TODO Auto-generated method stub
//		return ((ChannelGroupDao) dao).searchAllVersion();
//	}
	
	public List<String> searchAllVersion2() {
		// TODO Auto-generated method stub
		return ((ChannelGroupDao) dao).searchAllVersion2();
	}

}
