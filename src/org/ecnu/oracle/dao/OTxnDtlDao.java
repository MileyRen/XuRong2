package org.ecnu.oracle.dao;

import java.sql.SQLException;
import java.util.List;

import org.ecnu.oracle.orm.RptTxnDtl;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

@Repository("oTxnDtlDao")
public class OTxnDtlDao extends OAbstractDao {

	@SuppressWarnings("unchecked")
	public List<RptTxnDtl> get(final String id) {
		return hibertemplate.execute(new HibernateCallback() {

			@Override
			public List<Object> doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				String sql = "SELECT * FROM NODE_INFO WHERE WORK_DATE=?,BATCH_NO=?,POS_ID=?,TXN_EVENT_CODE=?,PASS_NO=?,SALES_ID=?";
									
				SQLQuery q = session.createSQLQuery(sql);
				String[] values = id.split(",");
				for(int i=1;i<=values.length;i++)
					q.setParameter(i,values[i-1]);	
			
				return q.list();
			}
			
		});
	}
}
