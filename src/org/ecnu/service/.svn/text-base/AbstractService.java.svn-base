package org.ecnu.service;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.ecnu.dao.*;
import org.ecnu.util.ClassUtil;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public abstract class AbstractService {
	protected InterfaceDao dao;
	protected String tableName;
	protected String idName;
	
	public abstract InterfaceDao getDao();

	public abstract void setDao(InterfaceDao dao);


	protected void test()
	{
		dao.create(null);
	}
	
	/**
	 *  向数据库中插入一个对象
	 * @param object 对象
	 * @return
	 */
	public Serializable insert(Object object){
		//object.getClass().getDeclaredField("usrId").
		return dao.create(object);
		}
	
	/**
	 * 非全字段插入操作
	 * @param tableName 表的映射类
	 * @param fieldNames 待插入的数据库字段名映射属性名集合
	 * @param values 待插入的数据库字段映射的属性值集合
	 * @return
	 */
	public int insertBySQL(final String tableName, final List<String> fieldNames, final List<Object> values){
		return dao.createBySql(tableName, fieldNames, values);
	}
	
	/**
	 * 非全字段插入
	 * @param object 对象
	 * @return 
	 */
	public int insertObjectBySql(Object object){
		 List<String> fieldNames = null;//保存字段对应的属性名的集合
		 List<Object> values = null;//保存属性值的集合
		try {
			fieldNames=ClassUtil.getAttributes(object);
			values=ClassUtil.getValues(object);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dao.createBySql(tableName, fieldNames, values);
		
	}
	
	/**
	 * 全字段插入
	 * @param tableName 类名
	 * @param object 对象
	 */
	public void insertByHql(String tableName, Object object){
		List<Object> args = null;
		try {
			args = ClassUtil.getValues(object);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int len = args.size();
		dao.createByHql(tableName, args, len);//(String name, final List<String> args, final int len);
	}
	
	public void insertMore( Object[] object, int len){
		//String name, final List<String> args[], final int len
		int i;
		List<Object>[] args =null;
		for(i=0;i<object.length;i++) {

			try {
				args[i]= ClassUtil.getValues(object[i]);
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		dao.createMore(tableName, args, len);
	}
	
	public Object read(Serializable id){
		//String entityName, Serializable id
		return dao.read(tableName, id);
		}
	
	//updateByhql(final String tableName, final String idName, final String id, final List<String> fieldNames, final List<?> values)
	public void update(Object object){
		dao.update(object);
	}
	
	public void update(final String id, final List<String> fieldNames, final List<Object> values){
		dao.updateByhql(tableName, idName, id, fieldNames, values);
	}
	
	public void delete(Object object){
		dao.delete(object);
	}
	
	public void deleteAll(){
		dao.deleteAll(tableName);
	}
	
	public Boolean deleteMoreByHql(List<?> ids){
		String hql = " DELETE FROM " + tableName +" WHERE " + idName+" IN ";
		String queryString=hql+"(";
		
		for(int i=0; i<ids.size(); i++)
    	{
			queryString+="?,";
    	}
		queryString=queryString.substring(0, queryString.length()-1)+")";
		try{
			dao.deleteMoreByHql(queryString, ids);
		}catch(DataAccessException e) {
			return false;
		}
		
		return true;
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

		return dao.getResult(c, fieldName, args, pageNo);
	}
	
	public List<?> searchAll(Object object) {

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
		return dao.getAllResult(c, fieldName, args);
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
		return dao.getResultByLike(c, fieldName, args, pageNo);
	}
	
	public long countRows(Object object)//Object: Class<?> c, List<String> fieldName, List<String> args
	{
		Class<?> c = null;
		List<String> fieldName = new ArrayList<String>();
		List<Object> args = new ArrayList<Object>();
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
//
//		System.out.println("fieldName.isEmpty()"+fieldName.isEmpty());
//		System.out.println("args.isEmpty()"+args.isEmpty());
//		System.out.println("I Got "+dao.readRowsCount(c, fieldName, args, idName));
		return dao.readRowsCount(c, fieldName, args, idName);
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
		return dao.readRowsCountByLike(c, fieldName, args, idName);
	}
	
	@SuppressWarnings("null")
	public int updateMore(Object[] object){
		//(final String tableName, final String idName, final List<String> ids, final List<String> fieldNames, final List<?> values) 	
		List<String> ids = null;
		List<String> fieldNames = null;
		List<Object>[] values = null;
		
		try {
			fieldNames = ClassUtil.getAttributes(object);

			for(int i=0;i<object.length;i++) {

				try {
					
					values[i] = ClassUtil.getValues(object[i]);
					
					ids.add((String) values[i].get(0));
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dao.updateMore(tableName, idName, ids, fieldNames, values);
	}
	
	//final String tableName, final String idName, final List<String> ids, final String fieldName, final Object value
	public int updateStates(List<?> ids, String fieldName, Object value){
		
		return dao.updateStates(tableName, idName, ids, fieldName, value);
	}
	
	public Object readByObject(String hql, Object[] object){
		
		return dao.readByObject(hql, object);
		
	}
}
