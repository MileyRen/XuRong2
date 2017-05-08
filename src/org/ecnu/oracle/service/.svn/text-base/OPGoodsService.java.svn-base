package org.ecnu.oracle.service;

import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.orm.PGoodsInfo;
import org.ecnu.orm.WareInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OPGoodsService extends OAbstractService implements InterfaceService {
	@Autowired
	private org.ecnu.service.WareInfoService sqlWIService;
	

	
	public OPGoodsService() {
		tableName="org.ecnu.oracle.orm.PGoodsInfoDao";
		idName = "VersionNo";
		System.out.println("oracle PGoodsInfo service constructor!");
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("oPGoodsInfoDao")
	public void setDao(OInterfaceDao opGoodsInfoDao) {
		// TODO Auto-generated method stub
		odao=opGoodsInfoDao;
	}
	
	@Override
	public Boolean insert(String id) {
		try {
			PGoodsInfo good = (PGoodsInfo)odao.get(id);
			sqlWIService.insert(convert(null,good));
		}catch(DataAccessException e) {
			return false;
		}
		return true;
	}

	@Override
	public Boolean update(String id) {
		try {
			PGoodsInfo good = (PGoodsInfo)odao.get(id);
			sqlWIService.update(convert(null,good));
		}catch(DataAccessException e) {
			return false;
		}
		return true;
	}

	@Override
	public Boolean delete(String id) {
		try {
			List<Object> ids = new ArrayList<Object>();
			ids.add(id);
			sqlWIService.deleteMoreByHql(ids);
		}catch(DataAccessException e) {
			return false;
		}
		return true;
	}

	@Override
	public Object convert(String id,Object obj) {
		PGoodsInfo oldGoods = (PGoodsInfo)obj;
		WareInfo newGoods = new WareInfo();
		
		newGoods.setWareId(oldGoods.getWareId());
		newGoods.setWareName(oldGoods.getWareName());
		newGoods.setWareDesc(oldGoods.getWareDesc());
		
		return null;
	}

}
