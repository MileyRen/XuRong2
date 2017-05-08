package org.ecnu.oracle.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.ecnu.oracle.orm.GroupInfoDtl;
import org.ecnu.oracle.orm.GroupInfoDtlId;
import org.ecnu.oracle.orm.ONodeInfo;
import org.ecnu.oracle.orm.PWareInfo;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("oGroupInfoDtlDao")
public class OGroupInfoDtlDao extends OAbstractDao {

	@SuppressWarnings("unchecked")
	public List<String> searchAllNodeIdByGroupId(final String groupId) {
		List<String> anis = new ArrayList<String>();
		anis =  (List<String>)hibertemplate.executeFind(new HibernateCallback() {
			public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select * from  Group_Info_Dtl where Group_Id = '"+groupId+"'";
//				Query query = session.createSQLQuery(sql);
				Query query = session.createSQLQuery(sql).addEntity(GroupInfoDtl.class);
				List<String> temp = new ArrayList<String>();
				List<String> res = new ArrayList<String>();
				GroupInfoDtl gid = new GroupInfoDtl();
				for(int i=0; i<query.list().size(); i++){
					gid = (GroupInfoDtl) query.list().get(i);
					temp.add(gid.getId().getNodeId());
					}
				
				for(int j=0; j<temp.size(); j++){
					if(temp.get(j).substring(0, 2).equals("80"))
						res.addAll(searchAllNodeIdByGroupId(temp.get(j)));
					else res.add(temp.get(j));
				}
				return res;
			}
		});
		return anis;
	}

	@SuppressWarnings("unchecked")
	public String searchGroupIdByNodeId(final String nodeId) {//联合主键
		// TODO Auto-generated method stub
		List<GroupInfoDtl> gidlist = new ArrayList<GroupInfoDtl>();
		gidlist = hibertemplate.executeFind(new HibernateCallback() {
			public List<GroupInfoDtl> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select * from  Group_Info_Dtl where group_id not in('8A000000','8B000000') and node_id = '"+nodeId+"'";
//				Query query = session.createSQLQuery(sql);
				Query query = session.createSQLQuery(sql).addEntity(GroupInfoDtl.class);
				return query.list();
			}
		});
		String temp = gidlist.get(0).getId().getGroupId();
//		if(nodeIdIsExist(temp))return searchGroupIdByNodeId(temp);
//		else 
			return temp;
	}

	@SuppressWarnings("unchecked")
	public boolean nodeIdIsExist(final String nodeId) {
		// TODO Auto-generated method stub
		List<GroupInfoDtl> gidlist = new ArrayList<GroupInfoDtl>();
		gidlist = hibertemplate.executeFind(new HibernateCallback() {
			public List<GroupInfoDtl> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select * from  Group_Info_Dtl where group_id not in('8A000000','8B000000') and node_id = '"+nodeId+"'";
//				Query query = session.createSQLQuery(sql);
				Query query = session.createSQLQuery(sql).addEntity(GroupInfoDtl.class);
				return query.list();
			}
		});
		if(gidlist.size()==0)return false;
		else {
			System.out.println("nodeId"+nodeId+"groupId"+gidlist.get(0).getId().getGroupId());
			return true;
			}
	}
	
//	@SuppressWarnings("unchecked")//函数有问题
//	public List<String> getAllNodeIdByGroupId(String groupId) {
//		// TODO Auto-generated method stub
//		List<String> results = new ArrayList<String>();
//		
//		DetachedCriteria crit=DetachedCriteria.forClass(GroupInfoDtl.class);//GroupInfoDtlId.class
//		crit.add(Restrictions.eq("groupId", groupId));
//		List<GroupInfoDtlId> temp = hibertemplate.findByCriteria(crit);
//		System.out.println("temp.toString():"+temp.toString());
//		
//		for (GroupInfoDtlId groupInfoDtlId : temp) {
//			System.out.println("groupInfoDtlId.getNodeId():"+groupInfoDtlId.getNodeId());
//			if(groupInfoDtlId.getNodeId().substring(0, 2).equals("80"))
//				results.addAll(getAllNodeIdByGroupId(groupId));				
//			else
//				results.add(groupInfoDtlId.getNodeId());
//		}
//		return results;
//	}

}
