package org.ecnu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("nodeMappingDao")
public class NodeMappingDao extends AbstractDao {

	@SuppressWarnings("unchecked")
	public List<String> getAllUser() {
		// TODO Auto-generated method stub
		List<String> eNames = new ArrayList<String>();
		eNames = hibertemplate.executeFind(new HibernateCallback() {
			public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select distinct EMPLOYEE_NAME from  node_mapping";

				Query query = session.createSQLQuery(sql);
				System.out.println("query.list().size():"+query.list().size());
				return query.list();
			}
		});
//		List<String> nt = new ArrayList<String>();
//		for(int i=0; i<ntypes.size(); i++){//去除空值
//			if(ntypes.get(i).trim().length()==0)continue;
//			else nt.add(ntypes.get(i).trim());
//		}
//		System.out.println("nt.size():"+nt.size());
//		return nt;
		return eNames;
	}
	//------------nodeId和userId为外键时开启------------------
//	@Override
//	public List<?> getResultByLike(Class<?> c, List<String> fieldName, List<Object> args, int pageNo){
//		DetachedCriteria crit = DetachedCriteria.forClass(c);
//		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
//		DetachedCriteria proCrit = crit.createCriteria("users", Criteria.LEFT_JOIN);
//		
//		
//		int i=0;
////		for(;i<fieldName.size();i++){
////			System.out.println("fieldName.get("+i+").toString():"+fieldName.get(i).toString());
////			}
//		
//		if((i=fieldName.indexOf("nodeName"))>=0) {
//			nodeCrit.add(Restrictions.like("nodeName", "%"+args.get(i)+"%"));
//			fieldName.remove(i);
//			args.remove(i);
//		}
//		if((i=fieldName.indexOf("userName"))>=0) {
//			proCrit.add(Restrictions.like("userName", "%"+args.get(i)+"%"));
//			fieldName.remove(i);
//			args.remove(i);
//		}
//		
//		return hibertemplate.findByCriteria(crit, pageNo*10, 10);
//	}
//
//	@SuppressWarnings("unchecked")
//	@Override
//	public long readRowsCountByLike(Class<?> c, List<String> fieldName,
//			List<Object> args, String idName) {
//		// TODO Auto-generated method stub
//		List<Long> results = null;
//		
//		DetachedCriteria dc = DetachedCriteria.forClass(c);
//		DetachedCriteria rdc = dc.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
//		DetachedCriteria gdc = dc.createCriteria("users", Criteria.LEFT_JOIN);
//		int i = 0;
//		
//		if((i=fieldName.indexOf("nodeName"))>=0) {
//			rdc.add(Restrictions.like("nodeName", "%"+args.get(i)+"%"));
//			args.remove(i);
//			fieldName.remove(i);
//		}
//		
//		if((i=fieldName.indexOf("userName"))>=0) {
//			gdc.add(Restrictions.like("userName", "%"+args.get(i)+"%"));
//			args.remove(i);
//			fieldName.remove(i);
//		}
//
//		CountProjection proj=Projections.count(idName);
//		dc.setProjection(proj);
//		results=hibertemplate.findByCriteria(dc);
//		return results.get(0);
//	}
}
