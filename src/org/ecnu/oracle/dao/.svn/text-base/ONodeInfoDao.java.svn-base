package org.ecnu.oracle.dao;

import java.sql.SQLException;
import java.util.List;

import org.ecnu.oracle.orm.ONodeInfo;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("oNodeInfoDao")
public class ONodeInfoDao extends OAbstractDao {

//	public Object searchAllResult(ONodeInfo oni) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<ONodeInfo> readBySQLUseNodeId(final String id) {
		return hibertemplate.execute(new HibernateCallback() {

			public List<Object> doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String sql = "SELECT * FROM NODE_INFO WHERE NODE_ID =?";
									
				SQLQuery q = session.createSQLQuery(sql);
				q.setParameter(1,id);	
			
				return q.list();
			}
			
		});
	}
	
	@SuppressWarnings("unchecked")
	public List<ONodeInfo> getAllNodes(Class<?> c, List<String> fieldName, List<Object> args)
	{
		List<ONodeInfo> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<fieldName.size(); i++){
			if(fieldName.get(i) == null){
				crit.add(Restrictions.sqlRestriction(" NODE_ID not like '%80' "));
			}
		}
		for(int i=0; i<args.size(); i++)
		{
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		results=hibertemplate.findByCriteria(crit);
		return results;
	}
}
