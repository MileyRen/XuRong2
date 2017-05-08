package org.ecnu.dao;

import java.sql.SQLException;
import java.util.List;

import org.ecnu.orm.DepotHis;
import org.ecnu.orm.MyStock;
import org.ecnu.orm.Users;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("myStockDao")
public class MyStockDao extends AbstractDao {
	
	@SuppressWarnings("unchecked")
	public int updateCurrentWareNum(final String employeeName, final String wareName, final int outnum){
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "update mystock set  currentWareNum = currentWareNum - "+outnum+" where employeeName = '"+employeeName+"' and wareName ='"+wareName+"'";
		Query query = session.createSQLQuery(sql);
//		System.out.println("updateCurrentNumber query.executeUpdate()::"+query.executeUpdate());
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<MyStock> searchAllByEmp(String eName) {
		// TODO Auto-generated method stub
		List<MyStock> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(MyStock.class);
		
		crit.add(Restrictions.eq("employeeName", eName));

		results=hibertemplate.findByCriteria(crit);
		return results;
	}

	@SuppressWarnings("unchecked")
	public void creatNextMonth(final String ename, final String wname, final int csn, final int wcost, final String stry,
			final String strm, final String lastTime) {
		// TODO Auto-generated method stub
		hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
//		String sql = "insert into  mystock set  EMPLOYEE_NAME = '"+ename+"' and WARE_NAME = '"+wname+"' and LAST_MONTH_NUM ='"+csn+"' and LAST_MONTH_COST ='"+wcost+"' and YEAR = '"+stry+"' and MONTH ='"+strm+"' and LAST_TIME= '"+lastTime+"'";
		String sql = "insert into  mystock (EMPLOYEE_NAME,WARE_NAME,LAST_MONTH_NUM,LAST_MONTH_COST,CURRENT_WARE_NUM,YEAR,MONTH,TYPE,LAST_TIME) VALUES ('"+ename+"','"+wname+"','"+csn+"','"+wcost+"','"+csn+"','"+stry+"','"+strm+"','1','"+lastTime+"')";
		Query query = session.createSQLQuery(sql);
//		System.out.println("updateCurrentNumber query.executeUpdate()::"+query.executeUpdate());
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public Object updateStoreNum(final Long sid, final int csn, final int wareCost) {
		// TODO Auto-generated method stub
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "update mystock set  CHECK_STORE_NUM = '"+csn+"' , CHECK_WARE_COST = '"+wareCost+"', TYPE = '2' where STOCK_ID = '"+sid+"'";
		Query query = session.createSQLQuery(sql);
//		System.out.println("updateCurrentNumber query.executeUpdate()::"+query.executeUpdate());
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<MyStock> searchThisMonthByWName(String ename, String wname, String stry, String strm) {
		// TODO Auto-generated method stub
		List<MyStock> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(MyStock.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		crit.add(Restrictions.eq("wareName", wname));
		crit.add(Restrictions.eq("year", stry));
		crit.add(Restrictions.eq("month", strm));

		crit.addOrder(Order.asc("lastTime"));
		results=hibertemplate.findByCriteria(crit);
		return results;
	}

	public List<MyStock> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(DepotHis.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		crit.add(Restrictions.like("lastTime", yearmonth+"%"));
		
		crit.addOrder(Order.desc("lastTime"));
		
		return hibertemplate.findByCriteria(crit);
	}
}
