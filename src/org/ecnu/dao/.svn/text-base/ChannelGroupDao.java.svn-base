package org.ecnu.dao;

import java.sql.SQLException;
import java.util.List;

import org.ecnu.orm.ChannelGroup;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("channelGroupDao")
public class ChannelGroupDao extends AbstractDao {

//	public List<ChannelGroup> searchAllVersion() {
//		// TODO Auto-generated method stub
//		hibertemplate.execute(new HibernateCallback() {
//			public Object doInHibernate(Session session) throws HibernateException, SQLException {
//		String sql = "delete from Depot where  EMPLOYEE_NAME = '"+ename+"' and DEPOT_WARE_NAME ='"+wname+"'";
//		Query query = session.createSQLQuery(sql);
////		System.out.println("updateCurrentNumber query.executeUpdate()::"+query.executeUpdate());
//		return query.executeUpdate();
//			}
//		});
//	}
	
	@SuppressWarnings({ "unchecked" })
	public List<String> searchAllVersion2() {
		String hql = "SELECT distinct versionName FROM ChannelGroup";
		return hibertemplate.find(hql);
	}

}
