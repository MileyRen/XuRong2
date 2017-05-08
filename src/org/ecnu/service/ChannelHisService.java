package org.ecnu.service;

import java.util.Date;
import java.util.List;

import org.ecnu.dao.ChannelHisDao;
import org.ecnu.dao.ChannelInfoDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.orm.ChannelHis;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ChannelHisService extends AbstractService {

	public ChannelHisService() {
		tableName = "org.ecnu.orm.ChannelHis";
		idName = "id";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("channelHisDao")
	public void setDao(InterfaceDao channelHisDao) {
		// TODO Auto-generated method stub
		dao = channelHisDao;
	}

	public Object searchByLike(ChannelHis ci, Date ltime, Date rtime, int pageNo) {
		// TODO Auto-generated method stub
		List<String> fieldName = null;
		List<Object> args = null;
		try {
			fieldName = ClassUtil.getAttributes(ci);
			args=ClassUtil.getValues(ci);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ((ChannelHisDao) dao).getResultByLike(ChannelHis.class, fieldName, args, ltime, rtime, pageNo);
	}

	public long countRowsByLike(ChannelHis ci, Date ltime, Date rtime) {
		// TODO Auto-generated method stub
		List<String> fieldName = null;
		List<Object> args = null;
		try {
			fieldName = ClassUtil.getAttributes(ci);
			args=ClassUtil.getValues(ci);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ((ChannelHisDao) dao).readRowsCountByLike(ChannelHis.class, fieldName, args, ltime, rtime, idName);
	}

}
