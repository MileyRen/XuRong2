package org.ecnu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.ecnu.orm.ChannelInfo;
import org.ecnu.util.ClassUtil;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("channelInfoDao")
public class ChannelInfoDao extends AbstractDao {

	public List<?> getResultByLike(Class<?> c, List<String> fieldName, List<Object> args, int pageNo)
	{
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
		
//		System.out.println("use channelInfoDao getResultByLike");
		int i=0;
		for(int j=0;j<args.size();j++){
			System.out.println(fieldName.get(j)+"++++++++++"+args.get(j));
		}
		if((i=fieldName.indexOf("nodeName"))>=0) {
			nodeCrit.add(Restrictions.like("nodeName", "%"+args.get(i)+"%"));
			fieldName.remove(i);
			args.remove(i);
		}
		
		for(i=0;i<fieldName.size();i++){
			if(args.get(i).getClass().toString().contains("String")){
			crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}else{
				crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			}
		}
		
		crit.addOrder(Order.desc("lastTime"));
		crit.addOrder(Order.desc("nodeInfo.nodeId"));
		crit.addOrder(Order.asc("channelId"));
		System.out.println("crit.toString():"+crit.toString());
		return hibertemplate.findByCriteria(crit, pageNo*10, 10);
	}
	
	@SuppressWarnings("unchecked")
	public long readRowsCountByLike(Class<?> c, List<String> fieldName, List<Object> args, String idName)
	{
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
		List<Long> results = null;
		int i=0;
		if((i=fieldName.indexOf("nodeName"))>=0) {
			nodeCrit.add(Restrictions.like("nodeName", "%"+args.get(i)+"%"));
			fieldName.remove(i);
			args.remove(i);
		}
		
		for(i=0;i<fieldName.size();i++){
			if(args.get(i).getClass().toString().contains("String")){
			crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}else{
				crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			}
		}
		
		CountProjection proj=Projections.count(idName);
		crit.setProjection(proj);
		results=hibertemplate.findByCriteria(crit);
		return results.get(0);
	}
	
	public List<?> getResultByLike2(Class<?> c, List<String> fieldName, List<Object> args, Date ltime, Date rtime, int pageNo)
	{
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
		
//		System.out.println("use channelInfoDao getResultByLike");
		int i=0;
		for(int j=0;j<args.size();j++){
			System.out.println(fieldName.get(j)+"++++++++++"+args.get(j));
		}
		if((i=fieldName.indexOf("nodeName"))>=0) {
			nodeCrit.add(Restrictions.like("nodeName", "%"+args.get(i)+"%"));
			fieldName.remove(i);
			args.remove(i);
		}
		
		for(i=0;i<fieldName.size();i++){
			if(args.get(i).getClass().toString().contains("String")){
			crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}else{
				crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			}
		}
		
		crit.add(Restrictions.between("lastTime", ltime, rtime));
		
		crit.addOrder(Order.desc("lastTime"));
		crit.addOrder(Order.desc("nodeInfo.nodeId"));
		crit.addOrder(Order.asc("channelId"));
		System.out.println("crit.toString():"+crit.toString());
		return hibertemplate.findByCriteria(crit, pageNo*10, 10);
	}
	
	@SuppressWarnings("unchecked")
	public long readRowsCountByLike2(Class<?> c, List<String> fieldName, List<Object> args, Date ltime, Date rtime, String idName)
	{
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
		List<Long> results = null;
		int i=0;
		if((i=fieldName.indexOf("nodeName"))>=0) {
			nodeCrit.add(Restrictions.like("nodeName", "%"+args.get(i)+"%"));
			fieldName.remove(i);
			args.remove(i);
		}
		
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
	
	public List<?> getAllResult(Class<?> c, List<String> fieldName, List<Object> args)
	{
		DetachedCriteria crit = DetachedCriteria.forClass(c);
		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
//		DetachedCriteria proCrit = crit.createCriteria("wareInfo", Criteria.LEFT_JOIN);//wareId为外键时开启
		
		int i=0;
		
		if((i=fieldName.indexOf("nodeName"))>=0) {
			nodeCrit.add(Restrictions.like("nodeName", "%"+args.get(i)+"%"));
			fieldName.remove(i);
			args.remove(i);
		}
//		if((i=fieldName.indexOf("wareName"))>=0) {
//			proCrit.add(Restrictions.like("wareName", "%"+args.get(i)+"%"));
//			fieldName.remove(i);
//			args.remove(i);
//		}

		for(i=0;i<fieldName.size();i++){
			if(args.get(i).getClass().toString().contains("String")){
			crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}else{
				crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			}
		}
		
		return hibertemplate.findByCriteria(crit);
	}
	
	@SuppressWarnings("unchecked")
	public int updateByInc(final String tableName, final List<String>channelIds, final List<Integer>incrementNumber, final List<String>wareNames){
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				int i;
				Date now = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
				String hql=" update CHANNEL_INFO set  current_Number = current_Number + ? , increment_Number = ?, last_Time ='"+sdf.format(now)+"', ware_Name = ? where id = ?";

				Connection con = session.connection();
				PreparedStatement ps = con.prepareStatement(hql);

				for(i=0; i<channelIds.size(); i++){
						ps.setObject(1, incrementNumber.get(i));
						ps.setObject(2, incrementNumber.get(i));
						ps.setObject(3, wareNames.get(i));
						ps.setObject(4, Long.parseLong(channelIds.get(i)));//String to Long
					ps.addBatch();
				}
				int [] rtn=ps.executeBatch();
				ps.close();
				session.flush();
				session.close();
				return rtn.length;
			}
		});
	}

	@SuppressWarnings("unchecked")
	public int editNormalStock(String tableName, final List<String> ids, final List<Integer> nors) {
		// TODO Auto-generated method stub
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				int i;
				String hql=" update CHANNEL_INFO set  normal_Stock = ? where id = ?";

//				System.out.println("updatebycurr pdao");
				Connection con = session.connection();
				PreparedStatement ps = con.prepareStatement(hql);
				for(i=0; i<ids.size(); i++){
						ps.setObject(2, ids.get(i));
						ps.setObject(1, nors.get(i));
//						System.out.println(i+" ps.toString():"+ps.toString());
					ps.addBatch();
				}
				int [] rtn=ps.executeBatch();
				ps.close();
				session.flush();
				session.close();
				return rtn.length;
			}
		});
	}

	@SuppressWarnings("unchecked")
	public int updateCurrentNumber(final String tableName, final String nodeId, final String channelId, final int outnum){
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "update CHANNEL_INFO set  increment_number = increment_number - "+outnum+" where node_id = '"+nodeId+"' and channel_id ='"+channelId+"'";
		Query query = session.createSQLQuery(sql);
//		System.out.println("updateCurrentNumber query.executeUpdate()::"+query.executeUpdate());
		return query.executeUpdate();
			}
		});
	}

	public boolean channelIsExist(final String nodeId, final String channelId) {
		// TODO Auto-generated method stub
		String count;
		count =  hibertemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "select count(*)  from CHANNEL_INFO where node_id = '"+nodeId+"' and channel_id ='"+channelId+"'";
		Query query = session.createSQLQuery(sql);

		return query.list();
			}
		}).get(0).toString();
		
		if(count.equals("0"))return false;
		return true;
	}

	@SuppressWarnings("unchecked")
	public void deleteMoreByNodeId(final String nodeId) {
		// TODO Auto-generated method stub
		hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "delete from CHANNEL_INFO where node_id = '"+nodeId+"' ";
		Query query = session.createSQLQuery(sql);
		System.out.println("updateCurrentNumber query.executeUpdate()::"+query.executeUpdate());
		return query.executeUpdate();
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<ChannelInfo> searchAllByNodeId(String nodeid) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(ChannelInfo.class);
		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
		
		nodeCrit.add(Restrictions.eq("nodeId", nodeid));
		
		crit.addOrder(Order.asc("channelId"));
		return hibertemplate.findByCriteria(crit);
	}
	
	public ChannelInfo getResultByNodeIdChannelId(String nodeid, String channelid) {
		// TODO Auto-generated method stub
		DetachedCriteria crit = DetachedCriteria.forClass(ChannelInfo.class);
		DetachedCriteria nodeCrit=crit.createCriteria("nodeInfo", Criteria.LEFT_JOIN);
		
		nodeCrit.add(Restrictions.eq("nodeId", nodeid));
		crit.add(Restrictions.eq("channelId", channelid));
		
		return (ChannelInfo) hibertemplate.findByCriteria(crit).get(0);
	}

	@SuppressWarnings("unchecked")
	public void changeIsSpecial(final Long id) {
		// TODO Auto-generated method stub
		hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
		String sql = "update CHANNEL_INFO set IS_SPECIAL = (IS_SPECIAL % 2 +1) where id = '"+id+"' ";
		Query query = session.createSQLQuery(sql);
		return query.executeUpdate();
			}
		});
	}
}
