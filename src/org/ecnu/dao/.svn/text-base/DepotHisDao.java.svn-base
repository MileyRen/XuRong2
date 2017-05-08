package org.ecnu.dao;

import java.util.List;

import org.ecnu.orm.Depot;
import org.ecnu.orm.DepotHis;
import org.hibernate.Criteria;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("depotHisDao")
public class DepotHisDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public List<DepotHis> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(DepotHis.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		crit.add(Restrictions.like("lastTime", yearmonth+"%"));
		
		crit.addOrder(Order.desc("lastTime"));
		
		return hibertemplate.findByCriteria(crit);
	}
	
	public Object getResult(Class<DepotHis> c, List<String> fieldName, List<Object> args, String ltime, String rtime, int pageNo) {
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

	public long readRowsCount(Class<DepotHis> c, List<String> fieldName, List<Object> args, String ltime, String rtime, String idName) {
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

//	@SuppressWarnings("unchecked")
//	public List<DepotHis> searchAllByShip(Long id) {
//		// TODO Auto-generated method stub
//		DetachedCriteria dc = DetachedCriteria.forClass(Depot.class);
//		DetachedCriteria sdc = dc.createCriteria("shipping", Criteria.LEFT_JOIN);
//		
//		sdc.add(Restrictions.eq("id", id));
//
//		return hibertemplate.findByCriteria(sdc);
//	}
}
