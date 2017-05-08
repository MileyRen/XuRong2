package org.ecnu.dao;

import java.util.Date;
import java.util.List;

import org.ecnu.orm.ChannelHis;
import org.hibernate.Criteria;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class ChannelHisDao extends AbstractDao {

	public List<?> getResultByLike(Class<?> c, List<String> fieldName, List<Object> args, Date ltime, Date rtime, int pageNo)
	{
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		int i=0;
		
		for(i=0;i<fieldName.size();i++){
			if(args.get(i).getClass().toString().contains("String")){
			crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}else{
				crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			}
		}
		
		crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		crit.addOrder(Order.desc("lastTime"));
		crit.addOrder(Order.desc("nodeId"));
		crit.addOrder(Order.asc("channelId"));
		
		return hibertemplate.findByCriteria(crit, pageNo*10, 10);
	}
	
	@SuppressWarnings("unchecked")
	public long readRowsCountByLike(Class<?> c, List<String> fieldName, List<Object> args, Date ltime, Date rtime, String idName)
	{
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		
		List<Long> results = null;
		int i=0;
		
		for(i=0;i<fieldName.size();i++){
			if(args.get(i).getClass().toString().contains("String")){
			crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}else{
				crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			}
		}
		
		crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		CountProjection proj=Projections.count(idName);
		crit.setProjection(proj);
		results=hibertemplate.findByCriteria(crit);
		return results.get(0);
	}

}
