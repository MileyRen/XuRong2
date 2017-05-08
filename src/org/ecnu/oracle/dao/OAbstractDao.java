package org.ecnu.oracle.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class OAbstractDao extends HibernateDaoSupport implements OInterfaceDao{
	
	public HibernateTemplate hibertemplate;
	
	@Resource(name = "orasessionFactory")//注入sessionFactory
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
        hibertemplate=getHibernateTemplate();
    }
	
	//在数据库中根据ID，读取一个对象
	public Object read(Class c) {
		// TODO Auto-generated method stub
		System.out.println("read!");
		DetachedCriteria dc = DetachedCriteria.forClass(c);
		CountProjection p = Projections.count("nodeId");
		dc.setProjection(p);
		return hibertemplate.findByCriteria(dc);
	}
	
	public Object read(String entityName, Serializable id) {
		// TODO Auto-generated method stub
//		System.out.println("OAbstractDao read entityName! "+entityName.toString());
//		System.out.println("OAbstractDao read Serializable id! "+id.toString());
		return hibertemplate.get(entityName, id);
	}
	
	@SuppressWarnings("rawtypes")
	public List<?> getResults(Class<?> c, List<String> fieldName, List<Object> args, int pageNo)
	{
//		System.out.println("OAbstractDao getResult");
		List results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		System.out.println("OAbstract DAO run");
		for(int i=0; i<args.size(); i++)
		{
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
//		System.out.println("optemp getResults crit:"+crit);
		results=hibertemplate.findByCriteria(crit, pageNo*10, 10);
		return results;
	}
	
	@Override
	public List<?> getResultsByLike(Class<?> c, List<String> fieldName, List<Object> args, int pageNo) {
		// TODO Auto-generated method stub
		List<?> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
			System.out.println(fieldName.get(i)+"++"+i+"++"+args.get(i));
//			System.out.println("args.get(i).getClass():"+args.get(i).getClass().toString());
			if(args.get(i).getClass().toString().contains("String")){
				crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}
			else crit.add(Restrictions.eq(fieldName.get(i), "'"+args.get(i)+"'"));
		}
		results=hibertemplate.findByCriteria(crit, pageNo*10, 10);
		return results;
	}
	
	public List<?> getAllResult(Class<?> c, List<String> fieldName, List<Object> args)
	{
		List<?> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		results=hibertemplate.findByCriteria(crit);
		return results;
	}
	
	@SuppressWarnings("unchecked")
	public long readRowsCount(Class<?> c, List<String> fieldName, List<Object> args, String idName)
	{
		List<Long> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			
		CountProjection proj=Projections.count(idName);
		crit.setProjection(proj);
		
		System.out.println("optemp readRowsCount crit:"+crit);
		results=hibertemplate.findByCriteria(crit);

		return results.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public long readRowsCountByLike(Class<?> c, List<String> fieldName, List<Object> args, String idName)
	{
		List<Long> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
			if(args.get(i).getClass().toString().contains("String")){
				crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}
			else crit.add(Restrictions.eq(fieldName.get(i), "'"+args.get(i)+"'"));
		}
		CountProjection proj=Projections.count(idName);
		crit.setProjection(proj);
		results=hibertemplate.findByCriteria(crit);
		return results.get(0);
	}
	
	//在数据库删除一个对象
	public void delete(Object persistentObject) {
		// TODO Auto-generated method stub
		hibertemplate.delete(persistentObject);
	}
	
	
	@SuppressWarnings("unchecked")
	public void deleteMoreByHql(final String hql, final List<?> ids) {
		// TODO Auto-generated method stub
		//System.out.println("hhhhh"+hql);
		hibertemplate.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(hql);
                for(int i=0; i<ids.size(); i++)
            	{
                	query.setParameter(i, ids.get(i));
                	//System.out.println("ids: "+ids.get(i));
            	}
                return query.executeUpdate();
            }
        });
	}
	
	@SuppressWarnings("unchecked")
	public int deleteMoreByHql(final String tableName, final String idName, final List<?> ids) {
		// TODO Auto-generated method stub
		//System.out.println("hhhhh"+hql);
		String hql = " DELETE FROM " + tableName +" WHERE " + idName+" IN ";
		String queryString=hql+"(";
		
		for(int i=0; i<ids.size(); i++)
		{
			queryString+="?,";
		}
		queryString=queryString.substring(0, queryString.length()-1)+")";
		final String fhql = queryString;
		int count = 0;
		count=hibertemplate.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(fhql);
                for(int i=0; i<ids.size(); i++)
            	{
                	query.setParameter(i, ids.get(i));
                	//System.out.println("ids: "+ids.get(i));
            	}
                return query.executeUpdate();
            }
        });
		return count;
	}
	
	//删除表中所有记录
	@SuppressWarnings("unchecked")
	public void deleteAll(String name)
	{
		final String m_hql=" delete from "+name;
		hibertemplate.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(m_hql);
                return query.executeUpdate();
            }
        });
	}
	
	@SuppressWarnings("unchecked")
	public List<?> get(final String id) {
		return null;
	}
	
//	
//	@SuppressWarnings("unchecked")
//	public List<Object> get(final String tableName,final String fieldName,final String fieldValue) {
//		return hibertemplate.execute(new HibernateCallback() {
//
//			@Override
//			public List<Object> doInHibernate(Session session) throws HibernateException, SQLException {
//				// TODO Auto-generated method stub
//				String sql = "SELECT * FROM "+tableName;
//				int i=0;
//				String[] names =null;
//				String[] values = null;
//				
//				if(fieldName!=null) {
//					sql +=" WHERE ";
//					if(fieldName.contains("_")) {
//						names = fieldName.split("_");
//						for(;i<names.length-1;i++) 
//							sql += names[i]+"= ?,";						
//					}
//					sql += names[i]+"= ?";
//				}
//				SQLQuery q = session.createSQLQuery(sql);
//				
//				if(fieldValue!=null) {
//					values = fieldValue.split("_");
//					for(i=0;i<values.length;i++)
//						q.setParameter(i+1,values[i]);	
//				}
//				return q.list();
//			}
//			
//		});
//	}
	

	
	public void delete(String tableName,String id) {
		
	}
}
