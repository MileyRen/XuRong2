package org.ecnu.oracle.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ecnu.oracle.orm.PWareInfo;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("oPWareInfoDao")
public class OPWareInfoDao extends OAbstractDao {

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
	
	
	//有问题
//	@SuppressWarnings({ "unchecked", "rawtypes" })
//	public List<PWareInfo> searchChannel(final String nodeId, final long curVersionNo){
//		return hibertemplate.execute(new HibernateCallback() {
//			public Object doInHibernate(Session session) throws HibernateException, SQLException {
//		String sql = "select * from  p_ware_info where version_no = "+curVersionNo;
//		Query query = session.createSQLQuery(sql);
//		return query.executeUpdate();
//			}
//		});
//	}

}
