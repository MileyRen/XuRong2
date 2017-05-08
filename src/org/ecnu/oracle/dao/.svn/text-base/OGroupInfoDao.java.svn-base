package org.ecnu.oracle.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.orm.GroupInfo;
import org.ecnu.oracle.orm.GroupInfoDtl;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("oGroupInfoDao")
public class OGroupInfoDao extends OAbstractDao {

	@SuppressWarnings("unchecked")
	public List<GroupInfo> searchGroupInfoInParamVersion(final GroupInfo groupInfo) {
		// TODO Auto-generated method stub
		List<GroupInfo> gilist = new ArrayList<GroupInfo>();
		gilist =  (List<GroupInfo>)hibertemplate.executeFind(new HibernateCallback() {
			public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
				
				String tempsql ="select DISTINCT gi.* from  Group_Info gi, param_version pv where pv.node_Id = gi.group_id ";
				if(!groupInfo.getGroupId().isEmpty()){tempsql=tempsql+"and pv.node_Id = '"+groupInfo.getGroupId()+"' ";}
				if(!groupInfo.getGroupName().isEmpty()){tempsql=tempsql+"and gi.group_Name like '%"+groupInfo.getGroupName()+"%'";}
				String sql = tempsql;
				
				Query query = session.createSQLQuery(sql).addEntity(GroupInfo.class);
				
				return query.list();
			}
		});
		return gilist;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> searchGroupNameByNodeId(final String nodeId) {
		// TODO Auto-generated method stub
		List<String> reslist = new ArrayList<String>();
		reslist= (List<String>) hibertemplate.executeFind(new HibernateCallback() {
			public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql ="select DISTINCT gi.group_name from node_info ni, group_info gi, " +
						"group_info_dtl gid where ni.node_id = gid.node_id and gid.group_id = gi.group_id " +
						"and gi.group_id not in ('8A000000','8B000000') and ni.node_id = '"+nodeId+"'";
				SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
		return reslist;
	}

}
