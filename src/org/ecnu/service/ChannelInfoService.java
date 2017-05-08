package org.ecnu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.ecnu.dao.ChannelInfoDao;
import org.ecnu.dao.InterfaceDao;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.util.ClassUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("ChannelInfoService")
@Transactional
public class ChannelInfoService extends AbstractService {

	public ChannelInfoService() {
		 tableName = "org.ecnu.orm.ChannelInfo";
		 idName = "id";
	}

	@Override
	public InterfaceDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Autowired
	@Qualifier("channelInfoDao")
	public void setDao(InterfaceDao channelInfoDao) {
		// TODO Auto-generated method stub
		dao = channelInfoDao;
	}

	public int updatebyincr(List<String> ids, List<Integer> incs, List<String> wareNames) {
		// TODO Auto-generated method stub
		return ((ChannelInfoDao) dao).updateByInc(tableName, ids, incs, wareNames);//传递售货机铭牌号和添加量
	}

	@SuppressWarnings("unchecked")
	public List<ChannelInfo> searchall(ChannelInfo channelInfo) {

		Class<?> c = null;
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
		c = channelInfo.getClass();
		try {
			fieldName = ClassUtil.getAttributes(channelInfo);
			args=ClassUtil.getValues(channelInfo);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return (List<ChannelInfo>) dao.getAllResult(c, fieldName, args);
	}

	public int editNormalStock(List<String> ids, List<Integer> nors) {
		// TODO Auto-generated method stub
		return ((ChannelInfoDao) dao).editNormalStock(tableName, ids, nors);
	}

	public int updateStock(String nodeId, String channelId, int outNum) {
		// TODO Auto-generated method stub
		return ((ChannelInfoDao) dao).updateCurrentNumber(tableName, nodeId, channelId, outNum);
	}

	public Object searchByLike(ChannelInfo ci, Date ltime, Date rtime, int pageNo) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
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
		return ((ChannelInfoDao) dao).getResultByLike2(ChannelInfo.class, fieldName, args, ltime, rtime, pageNo);
	}

	public long countRowsByLike(ChannelInfo ci, Date ltime, Date rtime) {
		// TODO Auto-generated method stub
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
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
		return ((ChannelInfoDao) dao).readRowsCountByLike2(ChannelInfo.class, fieldName, args, ltime, rtime, idName);
	}

	public boolean channelIsExist(String nodeId, String channelId) {
		// TODO Auto-generated method stub
		return ((ChannelInfoDao) dao).channelIsExist(nodeId,channelId);
	}

	public List<ChannelInfo> searchAllByNodeId(String nodeid) {
		// TODO Auto-generated method stub
		return ((ChannelInfoDao) dao).searchAllByNodeId(nodeid);
	}

	public void deleteByNodeId(String nodeId) {
		// TODO Auto-generated method stub
		((ChannelInfoDao) dao).deleteMoreByNodeId(nodeId);
	}

	public void changeIsSpecial(Long id) {
		// TODO Auto-generated method stub
		((ChannelInfoDao) dao).changeIsSpecial(id);
	}
}
