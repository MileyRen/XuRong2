package org.ecnu.oracle.service;

import java.io.Serializable;
import java.util.List;

import org.ecnu.oracle.dao.OAbstractDao;
import org.ecnu.oracle.dao.OInterfaceDao;
import org.ecnu.oracle.dao.OpTempDao;
import org.ecnu.util.ClassUtil;

public abstract class OAbstractService{
	protected OInterfaceDao odao;
	protected String tableName;
	protected String idName;
	
	public abstract OInterfaceDao getDao();

	public abstract void setDao(OInterfaceDao odao);
	
	public Object read(Serializable id){
		//String entityName, Serializable id
		System.out.println("OAbstractService read serializable id: "+id);
		return odao.read(tableName, id);
		}
	
	public List<?> search(Object object, int pageNo) {
		Class<?> c = null;
		List<String> fieldName = null;
		List<Object> args = null;
		c = object.getClass();
		try {
			fieldName = ClassUtil.getAttributes(object);
			args=ClassUtil.getValues(object);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return odao.getResults(c, fieldName, args, pageNo);
	}

	public List<?> searchByLike(Object object, int pageNo) {
		Class<?> c = null;
		List<String> fieldName = null;
		List<Object> args = null;
		c = object.getClass();
		try {
			fieldName = ClassUtil.getAttributes(object);
			args=ClassUtil.getValues(object);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return odao.getResultsByLike(c, fieldName, args, pageNo);
	}
	
	public long countRows(Object object)//Object: Class<?> c, List<String> fieldName, List<String> args
	{
		
		Class<?> c = null;
		List<String> fieldName = null;
		List<Object> args = null;
		c = object.getClass();
		try {
			fieldName = ClassUtil.getAttributes(object);
			args=ClassUtil.getValues(object);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return odao.readRowsCount(c, fieldName, args, idName);
	}
	
	public long countRowsByLike(Object object)//Object: Class<?> c, List<String> fieldName, List<String> args
	{
		Class<?> c = null;
		List<String> fieldName = null;
		List<Object> args = null;
		c = object.getClass();
		try {
			fieldName = ClassUtil.getAttributes(object);
			args=ClassUtil.getValues(object);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return odao.readRowsCountByLike(c, fieldName, args, idName);
	}
	
	
	public void delete(Object object){
		odao.delete(object);
	}
	
	public void deleteAll(){
		odao.deleteAll(tableName);
	}
	
//	public void deleteMoreByHql(List<?> ids){
//		String hql = " DELETE FROM " + tableName +" WHERE " + idName+" IN ";
//		String queryString=hql+"(";
//		
//		for(int i=0; i<ids.size(); i++)
//    	{
//			queryString+="?,";
//    	}
//		queryString=queryString.substring(0, queryString.length()-1)+")";
//		odao.deleteMoreByHql(queryString, ids);
//	}

	public int deleteMoreByHql(List<?> ids){
		return odao.deleteMoreByHql(tableName, idName, ids);
	}
	
	public void update(Object object) {
		// TODO Auto-generated method stub
		
	}
}
