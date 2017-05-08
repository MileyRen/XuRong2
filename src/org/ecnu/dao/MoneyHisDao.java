package org.ecnu.dao;

import java.util.List;

import org.ecnu.orm.MoneyHis;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("moneyHisDao")
public class MoneyHisDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public List<MoneyHis> searchAllByMonth(String ename, String yearmonth) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(MoneyHis.class);
		
		crit.add(Restrictions.eq("employeeName", ename));
		crit.add(Restrictions.like("lastTime", yearmonth+"%"));
		
		crit.addOrder(Order.desc("lastTime"));
		
		return hibertemplate.findByCriteria(crit);
	}

}
