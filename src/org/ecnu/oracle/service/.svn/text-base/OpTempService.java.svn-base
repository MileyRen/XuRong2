package org.ecnu.oracle.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.orm.OpTemp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("OpTempService")
@Transactional
public class OpTempService extends OAbstractService{

	
	public OpTempService() {
		tableName="org.ecnu.oracle.orm.OpTemp";
		idName = "id";
//		System.out.println("OpTemp service constructor!");
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public OInterfaceDao getDao() {
		// TODO Auto-generated method stub
		return odao;
	}

	@Autowired
	@Qualifier("opTempDao")
	public void setDao(OInterfaceDao opTempDao) {
		// TODO Auto-generated method stub
		odao=opTempDao;
//		System.out.println("OPTemp Service set dao:"+odao);
	}
	@SuppressWarnings("unchecked")
	public List<Object[]> get() {
		return (List<Object[]>) odao.get(null);
	}
	
	public void response(List<BigDecimal> ids) {
		if(ids.size()>0)
			this.deleteMoreByHql(ids);
	}

	@SuppressWarnings("unchecked")
	public List<OpTemp> getAllResults() {
		// TODO Auto-generated method stub
		List<String>fieldName=new ArrayList<String>();
		List<Object> args=new ArrayList<Object>();
		return (List<OpTemp>) odao.getAllResult(OpTemp.class, fieldName, args);
	}
	
}
