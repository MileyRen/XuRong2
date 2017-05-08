package org.ecnu.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public interface InterfaceDao {
	public Serializable create(Object newInstance);
	public int createBySql(final String tableName, final List<String> fieldNames, final List<Object> values);
	public void createByHql(String name, final List<Object> args, final int len);
	public void createMore(String name, final List<Object> args[], final int len);
	public int creatNodeFaultByHQL(String nodeId, String reportPerson,String finish, String problem);
	//public void creat(LocationInfo li);//many locationInfoDao
	
	public Object read(String entityName, Serializable id);
	public List<?> getResult(Class<?> c, List<String> fieldName, List<Object> args, int pageNo);
	public List<?> getResultByLike(Class<?> c, List<String> fieldName, List<Object> args, int pageNo);
	public long readRowsCount(Class<?> c, List<String> fieldName, List<Object> args, String idName);
	public long readRowsCountByLike(Class<?> c, List<String> fieldName, List<Object> args, String idName);
//	public long countRows(List<String> fieldNames,List<Object> values,List<Date> times,int pageNo);
	
	public Object readByObject(String hql, Object[] object);//???
	public List<Object> getResult(List<String> f,List<Object> v,List<Date> t,int p);
	public List<?> getAllResult(Class<?> c, List<String> fieldName, List<Object> args);
	public Boolean checkInIds(Class c,List<?> ids);
	
	public void update(Object transientObject);
	public int updateMore(final String tableName, final String idName, final List<String> ids, final List<String> fieldNames, final List<Object>[] values);
	public int updateStateMore(final String tableName, final String idName, final List<String> ids, final List<String> fieldNames, final List<String> values);
	public int updateStates(String tableName, String idName, List<?> ids, String fieldName, Object value);
	public int updateByhql(final String tableName, final String idName, final String id, final List<String> fieldNames, final List<Object> values);
	
	public void delete(Object persistentObject);
	public void deleteMoreByHql(final String hql, final List<?> ids);
	public void deleteAll(String name);
		
	//public int updateState(final List<String> ids,final String fName,final String fValue);//many
	//public List<PGoodsInfo> readByCriteria(List<String> fName, List<String> fValue, int pageNo);//many
	//public List<LocationGroup> getAll();//many   locationGroupDao
	//public List<Object> getResults(List<String> fName,List<Object> fValue,int gId,int pageNo);//many locationInfoDao
	//public int getIdByName(final String name);//many   locationGroupDao
	//public int readRowsCount(String nodeId);//为了检测当前要保修的机器是否正在维修中  nodeFaultDao

	
	//public List<NodeFault> readByCriteria(String nodeId, String reportPerson,String beginReportTime, String endReportTime, String finish,String repairPerson, String beginRepairTime, String endRepairTime,	int first);//nodeFaultDao
	//public Long readRowsCount(String nodeId, String reportPerson,String beginReportTime, String endReportTime, String finish,String repairPerson, String beginRepairTime, String endRepairTime);//nodeFaultDao

	
	//public void updateStates(List<String> ids);
	
	

	//public Object readByCriteria(String nodeId);
	
	
	//public Object readByCriteria(Object nodeId);//many nodeFalutDao
	
	//public List<?> getResult(Class<?> c, List<String> fName, List<Object> fValue, int pageNo);//many channelInfoDao
	
}
