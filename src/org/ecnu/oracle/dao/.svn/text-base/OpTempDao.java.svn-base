package org.ecnu.oracle.dao;

import java.sql.SQLException;
import java.util.List;

import org.ecnu.oracle.orm.OpTemp;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("opTempDao")
public class OpTempDao extends OAbstractDao {

	@SuppressWarnings("unchecked")
	public List<Object[]> get(final String id) {
		return hibertemplate.execute(new HibernateCallback() {

			@Override
			public List<Object[]> doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String sql = "SELECT * FROM OP_TEMP";
									
				SQLQuery q = session.createSQLQuery(sql);				
				
				return q.list();
				
			}
			
		});
	}
	
	@SuppressWarnings("unchecked")
	public List<OpTemp> getAllResult()
	{
		return (List<OpTemp>)hibertemplate.execute(new HibernateCallback() {
			public List<OpTemp> doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String sql = "SELECT * FROM OP_TEMP";

				SQLQuery q = session.createSQLQuery(sql).addEntity(OpTemp.class);				

				return q.list();
			}
			
		});
	}
}
