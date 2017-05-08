package org.ecnu.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.ecnu.orm.Depot;
import org.ecnu.orm.Money;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("moneyDao")
public class MoneyDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public List<Money> getResult(Class<Money> c, List<String> fieldName, List<Object> args, String ltime, String rtime, int pageNo) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		
		for(int i=0;i<fieldName.size();i++){
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		
		crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		crit.addOrder(Order.desc("lastTime"));
		
		return (List<Money>)hibertemplate.findByCriteria(crit, pageNo*10, 10);
	}

	public long readRowsCount(Class<Money> c,	List<String> fieldName, List<Object> args, String ltime, String rtime, String idName) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(c);

		int i=0;
		
		for(i=0;i<fieldName.size();i++){
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		
		crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		CountProjection proj=Projections.count(idName);
		crit.setProjection(proj);

		return (Long) hibertemplate.findByCriteria(crit).get(0);
	}

	@SuppressWarnings("unchecked")
	public List<Money> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(Money.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		crit.add(Restrictions.like("lastTime", yearmonth+"%"));
		
		crit.addOrder(Order.desc("lastTime"));
		
		return hibertemplate.findByCriteria(crit);
	}

	@SuppressWarnings("unchecked")
	public void deleteByEName(final String ename) {
		// TODO Auto-generated method stub
		hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "delete from Money where  EMPLOYEE_NAME = '"+ename+"'";
		Query query = session.createSQLQuery(sql);
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<Money> searchAllByEName(String ename) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(Money.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		
		crit.addOrder(Order.desc("lastTime"));
		
		return hibertemplate.findByCriteria(crit);
	}
}
