package org.ecnu.oracle.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.orm.RptTxnDtl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OTXNService  extends OAbstractService implements InterfaceService {
	
//	@Autowired
//	private org.ecnu.service.TxnService sqlTXNService;
	
	private org.ecnu.orm.WareInfo tGood;
	public OTXNService() {
		// TODO Auto-generated constructor stub
		tableName="org.ecnu.oracle.orm.NodeInfo";
		//idName = "id";
		System.out.println("oracle Txn service constructor!");
	}

	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		System.out.println("oracle get otxn dao");
		return odao;
	}

	@Autowired
	@Qualifier("oTxnDtlDao")
	public void setDao(OInterfaceDao oTxnDtlDao) {
		// TODO Auto-generated method stub
		System.out.println("oracle set otxn dao");
		odao=oTxnDtlDao;
	}
	
	@Override
	public Boolean insert(String id) {
		try {
			odao.get(id);
		}catch(DataAccessException e) {
			return false;
		}
		return true;
	}

	@Override
	public Boolean update(String id) {
		try {
			odao.get(id);
		}catch(DataAccessException e) {
			return false;
		}
		return true;
	}

	@Override
	public Boolean delete(String id) {
		try {
			List<String> ids =new ArrayList<String>();
			ids.add(id);
//			sqlTXNService.deleteMoreByHql(ids);
		}catch(DataAccessException e) {
			return false;
		}
		return true;
	}

	@Override
	public Object convert(String id,Object obj) {
		new RptTxnDtl();
id.split("_");
		
		if(tGood==null) {
//			tGood.setWareId(ids[5]);
//			tGood = (PGoodsInfo) sqlPGoodsService.search(tGood, 0).get(0);
//			tChannel.setChannelId(ids[4]);
//			tChannel = (PChannelInfo) sqlPChannelService.search(tChannel, 0).get(0);
//			tLocation.setLocationId(Integer.valueOf(ids[2]));
//			tLocation = (LocationInfo) sqlLocationService.search(tLocation, 0).get(0);
		}
//		txnId.setNchann(ids[4]);
//		txnId.setSalesId(ids[5]);
//		txnId.setLocationId(Integer.valueOf(oldTXN.getLastTime()));
		
		new SimpleDateFormat("yyyyMMddHHmmss");
		
//		try {
////			txnId.setLastTime(sdf.parse(ids[0]));
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		newTXN.setId(txnId);
//		newTXN.setPGoodsInfo(tGood);
//		newTXN.setPChannelInfo(tChannel);
//		newTXN.setLocationInfo(tLocation);
//		newTXN.setWorkDate(ids[0]);
//		newTXN.setBatchNo(Integer.valueOf(ids[1]));
//		newTXN.setTxnEventCode(ids[3]);
//		newTXN.setOutNum(oldTXN.getOutNum().intValue());
//		newTXN.setAdverClick(oldTXN.getAdverClick().intValue());
//		newTXN.setAmout(oldTXN.getAmout().intValue());
//		newTXN.setInsertAmount(oldTXN.getInsertAmount().intValue());
//		newTXN.setChangeAmount(oldTXN.getChangeAmount().intValue());
//		newTXN.setBelongTo(oldTXN.getBelongTo());
		return null;
	}
}
