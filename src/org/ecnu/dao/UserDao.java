package org.ecnu.dao;

import java.util.List;

import org.ecnu.orm.Users;
import org.hibernate.Criteria;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao extends AbstractDao {

	public void HelloUser()
	{
		System.out.println("Hello, UserDao");
	}
	
	public List<Users> getResult(Class<?> c, List<String> fieldName, List<Object> args, int pageNo)
	{
		DetachedCriteria dc = DetachedCriteria.forClass(c);
		DetachedCriteria rdc = dc.createCriteria("role", Criteria.LEFT_JOIN);
		DetachedCriteria gdc = dc.createCriteria("userGroup", Criteria.LEFT_JOIN);
		int i = 0;
		
		if((i=fieldName.indexOf("roleName"))>=0) {
			rdc.add(Restrictions.like("roleName", "%"+args.get(i)+"%"));
			args.remove(i);
			fieldName.remove(i);
		}
		
		if((i=fieldName.indexOf("groupName"))>=0) {
			gdc.add(Restrictions.like("groupName", "%"+args.get(i)+"%"));
			args.remove(i);
			fieldName.remove(i);
		}
		for(i=0; i<fieldName.size(); i++)
			dc.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
		dc.addOrder(Order.asc("userId"));
		if(pageNo==-1)
			return hibertemplate.findByCriteria(dc);
		else
			return hibertemplate.findByCriteria(dc, pageNo*10, 10);
	}

	@SuppressWarnings("unchecked")
	@Override
	public long readRowsCountByLike(Class<?> c, List<String> fieldName,
			List<Object> args, String idName) {
		// TODO Auto-generated method stub
		List<Long> results = null;
		
		DetachedCriteria dc = DetachedCriteria.forClass(c);
		DetachedCriteria rdc = dc.createCriteria("role", Criteria.LEFT_JOIN);
		DetachedCriteria gdc = dc.createCriteria("userGroup", Criteria.LEFT_JOIN);
		int i = 0;
		
		if((i=fieldName.indexOf("roleName"))>=0) {
			rdc.add(Restrictions.like("roleName", "%"+args.get(i)+"%"));
			args.remove(i);
			fieldName.remove(i);
		}
		
		if((i=fieldName.indexOf("groupName"))>=0) {
			gdc.add(Restrictions.like("groupName", "%"+args.get(i)+"%"));
			args.remove(i);
			fieldName.remove(i);
		}
		for(i=0; i<fieldName.size(); i++)
			dc.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
		dc.addOrder(Order.asc("userId"));
		CountProjection proj=Projections.count(idName);
		dc.setProjection(proj);
		results=hibertemplate.findByCriteria(dc);
		return results.get(0);
	}
	
	/**
	 * 搜索所有有效的营业员信息
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getAllAssists()
	{
		List<Users> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(Users.class);
		DetachedCriteria rdc = crit.createCriteria("role", Criteria.LEFT_JOIN);
//		DetachedCriteria gdc = crit.createCriteria("userGroup", Criteria.LEFT_JOIN);
		
		rdc.add(Restrictions.eq("roleName", "营业员"));
		crit.add(Restrictions.eq("userStatus", "1"));//1有效

		System.out.println("crit.toString():"+crit.toString());
		results=hibertemplate.findByCriteria(crit);
		return results;
	}
}
