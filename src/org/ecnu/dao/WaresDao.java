package org.ecnu.dao;

import java.sql.SQLException;
import java.util.List;

import org.ecnu.orm.Wares;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("waresDao")
public class WaresDao extends AbstractDao {

	public void updateCount(final Long wareId) {
		// TODO Auto-generated method stub
		hibertemplate.execute(new HibernateCallback<Object>() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "update wares set COUNT = COUNT + 1 where  WARE_ID = '"+wareId+"'";
		Query query = session.createSQLQuery(sql);
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<Wares> getAllResult(Class<?> c, List<String> fieldName, List<Object> args)
	{
		List<Wares> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		crit.addOrder(Order.desc("count"));
		results=hibertemplate.findByCriteria(crit);
		return results;
	}
}
