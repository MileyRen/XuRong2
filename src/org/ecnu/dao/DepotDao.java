package org.ecnu.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.ecnu.orm.Depot;
import org.ecnu.orm.Money;
import org.hibernate.Criteria;
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

@Repository("depotDao")
public class DepotDao extends AbstractDao {

	public Object getResult(Class<Depot> c, List<String> fieldName, List<Object> args, String ltime, String rtime, int pageNo) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		
		for(int i=0;i<fieldName.size();i++){
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		
		if(ltime != null && rtime != null)
			crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		crit.addOrder(Order.desc("lastTime"));
		return hibertemplate.findByCriteria(crit, pageNo*10, 10);
	}

	public long readRowsCount(Class<Depot> c,	List<String> fieldName, List<Object> args, String ltime, String rtime, String idName) {
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
	public List<Depot> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(Depot.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		crit.add(Restrictions.like("lastTime", yearmonth+"%"));
		
		crit.addOrder(Order.desc("lastTime"));//降序
		
		return hibertemplate.findByCriteria(crit);
	}
	
	@SuppressWarnings({ "rawtypes" })
	public List searchAllByEName(String eName) {		
		String hql = "SELECT depotWareName,Sum(depotWareNum) as depotWareNum,depotWarePrice FROM Depot WHERE employeeName = '"+eName+"' GROUP BY depotWareName";
		return hibertemplate.find(hql);
	}
	
	@SuppressWarnings("rawtypes")
	public List searchAllEName() {
		String hql = "SELECT employeeName FROM Depot GROUP BY employeeName";
		return hibertemplate.find(hql);
	}
	

	/**
	 * 直接用标志位表明未清算记录
	 * @param ename
	 * @param wname
	 * @param strym
	 * @return
	 */
	public List<Depot> searchThisMonthByWNameEName(String ename, String wname, String strym) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(Depot.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		crit.add(Restrictions.eq("depotWareName", wname));
//		crit.add(Restrictions.like("lastTime", strym+"%"));
//		crit.add(Restrictions.eq("type", "1"));
		
		crit.addOrder(Order.desc("lastTime"));//降序，先减去时间较前的
		
		return hibertemplate.findByCriteria(crit);
	}

	@SuppressWarnings("unchecked")
	public void deleteOnesEW(final String ename, final String wname) {
		// TODO Auto-generated method stub
		hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "delete from Depot where  EMPLOYEE_NAME = '"+ename+"' and DEPOT_WARE_NAME ='"+wname+"'";
		Query query = session.createSQLQuery(sql);
//		System.out.println("updateCurrentNumber query.executeUpdate()::"+query.executeUpdate());
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<Depot> searchAllByShip(Long id) {
		// TODO Auto-generated method stub
		DetachedCriteria dc = DetachedCriteria.forClass(Depot.class);
		DetachedCriteria sdc = dc.createCriteria("shipping", Criteria.LEFT_JOIN);
		
		sdc.add(Restrictions.eq("id", id));

		return hibertemplate.findByCriteria(sdc);
	}
}
