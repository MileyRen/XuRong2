package org.ecnu.oracle.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.orm.ParamVersion;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("oParamVersionDao")
public class OParamVersionDao extends OAbstractDao {

	@SuppressWarnings("unchecked")
	public List<ParamVersion> getAllParamVersion()
	{
		
		List<ParamVersion> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(ParamVersion.class);
		
		results = hibertemplate.findByCriteria(crit);
		return results;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ParamVersion readByNodeId(final String nodeId, final String paramTag) {
		return  hibertemplate.execute(new HibernateCallback() {
			public ParamVersion doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				final String sql = "SELECT * FROM Param_Version WHERE NODE_ID = '"+nodeId+"' and Param_Tag = '"+paramTag+"'";
				SQLQuery query = session.createSQLQuery(sql);
//				ParamVersion pv = new ParamVersion();
//				System.out.println("query.list().get(0).toString():"+query.list().get(0).toString());
//				pv = (ParamVersion) query.list().get(0);
				return (ParamVersion) query.list().get(0);
			}
		});
	}
	
	public ParamVersion readByCriteria(String nodeId, String paramTag)
	{
		
		DetachedCriteria crit = DetachedCriteria.forClass(ParamVersion.class);
		DetachedCriteria idCrit = crit.createCriteria("ParamVersionId");
		
		idCrit.add(Restrictions.eq("nodeId", nodeId));
		idCrit.add(Restrictions.eq("paramTag", paramTag));
		
		System.out.println("crit.toString():"+crit.toString());
		return (ParamVersion) hibertemplate.findByCriteria(crit, 0,10).get(0);
	}

	@SuppressWarnings("unchecked")
	public boolean nodeIdIsExist(final String nodeId, final String paramTag) {
		// TODO Auto-generated method stub
		List<ParamVersion> gidlist = new ArrayList<ParamVersion>();
		gidlist = hibertemplate.executeFind(new HibernateCallback() {
			public List<ParamVersion> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select * from  param_version where  PARAM_TAG= '"+paramTag+"' and node_id = '"+nodeId+"'";
//				Query query = session.createSQLQuery(sql);
				Query query = session.createSQLQuery(sql).addEntity(ParamVersion.class);
				return query.list();
			}
		});
		if(gidlist.size()==0)return false;
		else {
			return true;
			}
	}
}
