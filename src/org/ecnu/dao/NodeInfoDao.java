package org.ecnu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.orm.PWareInfo;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.Users;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("nodeInfoDao")
public class NodeInfoDao extends AbstractDao {

	public boolean nodeIsExist(String nodeId) {
		// TODO Auto-generated method stub
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<String> searchAllNodeType() {
		// TODO Auto-generated method stub
//		List<NodeInfo> nis = new ArrayList<NodeInfo>();
		List<String> ntypes = new ArrayList<String>();
		ntypes = hibertemplate.executeFind(new HibernateCallback() {
			public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select distinct MACHINE_TYPE from  NODE_INFO";

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
		return ntypes;
	}
	
	@SuppressWarnings("unchecked")
	public List<PWareInfo> searchAllChannel(final long curVersionNo) {
		List<PWareInfo> pwis = new ArrayList<PWareInfo>();
		pwis =  (List<PWareInfo>)hibertemplate.executeFind(new HibernateCallback() {
			public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select * from  p_ware_info where version_no = "+curVersionNo;
//				Query query = session.createSQLQuery(sql);
				Query query = session.createSQLQuery(sql).addEntity(PWareInfo.class);
				System.out.println("query.list().size():"+query.list().size());
				return query.list();
			}
		});
		return pwis;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void updateAssign(final String nodeId, final String state) {
		// TODO Auto-generated method stub
		hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				//String hql=" update NODE_INFO set IS_ASSIGN = '"+ state +"' where  NODE_ID = '"+nodeId+"'";
				//Query query = session.createQuery(hql);
				String sql=" update NODE_INFO set IS_ASSIGN = '"+ state +"' where  NODE_ID = '"+nodeId+"'";
				Query query = session.createSQLQuery(sql);
				return query.executeUpdate(); //返回执行受到影响的行数
            }
		});
	}

	@SuppressWarnings("unchecked")
	public List<NodeInfo> searchAllNodeIdByGroupId(String groupId) {
		// TODO Auto-generated method stub
		List<NodeInfo> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(NodeInfo.class);
		DetachedCriteria ndc = crit.createCriteria("nodeGroupInfo", Criteria.LEFT_JOIN);
		
		ndc.add(Restrictions.eq("nodeGroupId", groupId));

		results=hibertemplate.findByCriteria(crit);
		return results;
	}

	@SuppressWarnings("unchecked")
	public int createNode(final NodeInfo ni) {
		// TODO Auto-generated method stub
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql=" insert into NODE_INFO VALUES  ( "+ni.getNodeId()+","+ni.getNodeGroupInfo().getNodeGroupId()+","+ni.getNodeName()+","+ni.getVersionName()+","+ni.getIsAssign()+","+ni.getNodeStatus()+","+ni.getMacAddr()+","+ni.getSimNo()+","+ni.getMachineType()+","+ni.getMonopoly()+","+ni.getNodeAddr()+")";
	
		Query query = session.createSQLQuery(sql);
		
		return query.executeUpdate();
            }
		});
	}
}
