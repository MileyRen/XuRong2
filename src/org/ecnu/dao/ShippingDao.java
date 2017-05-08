package org.ecnu.dao;

import java.util.List;

import org.ecnu.orm.Shipping;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("shippingDao")
public class ShippingDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public List<Shipping> getAllThisMonth(Shipping sp) {
		// TODO Auto-generated method stub
		List<Shipping> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(Shipping.class);
		
		crit.add(Restrictions.eq("employeeName", sp.getEmployeeName()));
		crit.add(Restrictions.like("lastTime", sp.getLastTime()+"%"));

		results=hibertemplate.findByCriteria(crit);
		return results;
	}

	@SuppressWarnings("unchecked")
	public List<Shipping> getResult(Class<Shipping> c,
			List<String> fieldName, List<Object> args, String ltime,
			String rtime, int pageNo) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		
		for(int i=0;i<fieldName.size();i++){
//			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			if(args.get(i).getClass().toString().contains("String")){
				crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}
			else crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		
		if(ltime != null && rtime != null)
			crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		crit.addOrder(Order.desc("lastTime"));
		return hibertemplate.findByCriteria(crit, pageNo*10, 10);
	}

	public long readRowsCount(Class<Shipping> c, List<String> fieldName,
			List<Object> args, String ltime, String rtime, String idName) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(c);

		int i=0;
		
		for(i=0;i<fieldName.size();i++){
//			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			if(args.get(i).getClass().toString().contains("String")){
				crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}
			else crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		
		crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		CountProjection proj=Projections.count(idName);
		crit.setProjection(proj);

		return (Long) hibertemplate.findByCriteria(crit).get(0);
	}

	public Shipping searchTheLast() {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(Shipping.class);
		
		crit.addOrder(Order.desc("id"));
		
		return (Shipping) hibertemplate.findByCriteria(crit).get(0);
	}

}
