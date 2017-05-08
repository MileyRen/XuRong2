package org.ecnu.dao;

import java.sql.SQLException;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("profitDao")
public class ProfitDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public int updateTurnOverCard(final String employeeName, final int aMount) {
		// TODO Auto-generated method stub
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "update profit set  turnOverCard = turnOverCard + "+aMount+" where employeeName = '"+employeeName+"'";
		Query query = session.createSQLQuery(sql);
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public int updateTurnOverCash(final String employeeName, final int aMount) {
		// TODO Auto-generated method stub
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
			
				Date now = new Date();
				String sql = "update profit set  turnOverCash = turnOverCash + "+aMount+" where employeeName = '"+employeeName+"'";
				Query query = session.createSQLQuery(sql);
				
			return query.executeUpdate();
			}
		});
	}
	
}
