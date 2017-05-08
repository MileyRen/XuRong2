package org.ecnu.oracle.dao;

import java.io.Serializable;
import java.util.List;

import org.ecnu.oracle.orm.ParamVersion;

public interface OInterfaceDao {
	public Object read(Class c);
	public Object read(String entityName, Serializable id);
	public List<?> getResults(Class<?> c, List<String> fieldName, List<Object> args, int pageNo);
	public List<?> getAllResult(Class<?> c, List<String> fieldName, List<Object> args);
	public long readRowsCount(Class<?> c, List<String> fieldName, List<Object> args, String idName);
	public void delete(Object persistentObject);
	public void deleteMoreByHql(final String hql, final List<?> ids);
	public void deleteAll(String name);
	public List<?> get(final String id);
	public int deleteMoreByHql(String tableName, String idName, List<?> ids);
	public List<?> getResultsByLike(Class<?> c, List<String> fieldName,	List<Object> args, int pageNo);
	public long readRowsCountByLike(Class<?> c, List<String> fieldName, List<Object> args, String idName);
}
