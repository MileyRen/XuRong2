package org.ecnu.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CountProjection;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.ecnu.dao.InterfaceDao;

public class AbstractDao extends HibernateDaoSupport implements InterfaceDao{
	
	//@Autowired
	public HibernateTemplate hibertemplate;
	
	@Resource(name = "sessionFactory")//注入sessionFactory
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
        hibertemplate=getHibernateTemplate();
    }
	
	//在数据库中插入一个对象
	public Serializable create(Object newInstance) {
		// TODO Auto-generated method stub
		return hibertemplate.save(newInstance);
	}
	

	//在数据库中根据ID，读取一个对象
	public Object read(String entityName, Serializable id) {
		// TODO Auto-generated method stub
		return hibertemplate.get(entityName, id);
	}
	
	
	/**
	 * 
	 * @param hql 
	 * @param object 类名
	 * @return
	 */
	public Object readByObject(String hql, Object[] object)
	{
		return hibertemplate.find(hql, object).get(0);
	}
	
	//在数据库更新一个对象
	public void update(Object transientObject) {
		hibertemplate.saveOrUpdate(transientObject);
	}
	
	//在数据库删除一个对象
	public void delete(Object persistentObject) {
		// TODO Auto-generated method stub
		hibertemplate.delete(persistentObject);
	}
	
	//删除表中所有记录
	public void deleteAll(String name)
	{
		final String m_hql=" delete from "+name;
		hibertemplate.execute(new HibernateCallback<Object>() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(m_hql);
                return query.executeUpdate();
            }
        });
	}
	
	//，Class c为， args为,条件以相等计算
	/**
	 * 根据搜索条件查询数据库表
	 * @param c 表的映射类
	 * @param fieldName 字段映射的属性名集合
	 * @param args 搜索条件集合
	 * @param pageNo 第几页
	 * @return
	 */
	public List<?> getResult(Class<?> c, List<String> fieldName, List<Object> args, int pageNo)
	{
//		System.out.println("AbstractDao getResult");
		List<?> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		results=hibertemplate.findByCriteria(crit, pageNo*10, 10);
		return results;
	}
	
	/**
	 * 查询结果不分页
	 * @param c 表的映射类
	 * @param fieldName 字段映射属性名集合
	 * @param args 搜索条件集合
	 * @return 查询的结果集
	 */
	public List<?> getAllResult(Class<?> c, List<String> fieldName, List<Object> args)
	{
		List<?> results = null;
		
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
			System.out.println(fieldName.get(i)+"+++"+args.get(i));
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		results=hibertemplate.findByCriteria(crit);
		return results;
	}
	
	//Class c为表的映射类， args为搜索条件, 条件以like计算
	
	/**
	 * 根据搜索条件模糊查询数据库表
	 * @param c 表的映射类
	 * @param fieldName 字段的映射属性名
	 * @param args 搜索条件集合
	 * @param pageNo 第几页
	 * @return 分页显示模糊查询结果集
	 */
	public List<?> getResultByLike(Class<?> c, List<String> fieldName, List<Object> args, int pageNo)
	{
		List<?> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
//			System.out.println("args.get(i).getClass():"+args.get(i).getClass().toString());
			if(args.get(i).getClass().toString().contains("String")){
				crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}
			else crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		results=hibertemplate.findByCriteria(crit, pageNo*10, 10);
		return results;
	}
	
	
	/**
	 * 多条件查询
	 * @param c 表映射类名
	 * @param fieldName 查询字段映射属性名集合
	 * @param args 查询条件值集合
	 * @param idName 属性名
	 * @return 返回符合条件的记录数
	 */
	@SuppressWarnings("unchecked")
	public long readRowsCount(Class<?> c, List<String> fieldName, List<Object> args, String idName)
	{
		List<Long> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
			crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
			
		CountProjection proj=Projections.count(idName);//按主键统计数量
		crit.setProjection(proj);
		
		results=hibertemplate.findByCriteria(crit);
				
		return results.get(0);
	}
	
	/**
	 * 多条件模糊查询
	 * @param c 表映射类名
	 * @param fieldName 查询字段映射属性名集合
	 * @param args 查询条件值集合
	 * @param idName 属性名
	 * @return 返回符合条件的记录数
	 */
	@SuppressWarnings("unchecked")
	public long readRowsCountByLike(Class<?> c, List<String> fieldName, List<Object> args, String idName)
	{
		List<Long> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(c);
		for(int i=0; i<args.size(); i++)
		{
			if(args.get(i).getClass().toString().contains("String")){
				crit.add(Restrictions.like(fieldName.get(i), "%"+args.get(i)+"%"));
			}
			else crit.add(Restrictions.eq(fieldName.get(i), args.get(i)));
		}
		CountProjection proj=Projections.count(idName);
		crit.setProjection(proj);
		results=hibertemplate.findByCriteria(crit);
		return results.get(0);
	}

	
	/**
	 * 批量处理多次更新
	 * @param tableName 表的映射类名
	 * @param idName where子句后的属性名
	 * @param ids idName的值的集合
	 * @param fieldNames 待更新的字段映射的属性名集合
	 * @param values 待更新属性名的新值的集合，集合的每个元素为一条记录的所有新值的集合
	 * @return 返回更新操作影响的记录数
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public int updateMore(final String tableName, final String idName, final List<String> ids, final List<String> fieldNames, final List<Object>[] values) {
		// TODO Auto-generated method stub		
		
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {	
				int i,j;
				String hql=" update "+tableName+" set ";
				for(i=0; i<fieldNames.size()-1; i++)
				{
					hql=hql+fieldNames.get(i)+"= ?, ";
				}
				hql=hql+fieldNames.get(i)+"= ?";
				hql=hql+" where "+idName+" in (";
				for(i = 0; i<ids.size()-1; i++){
					hql = hql+ids.get(i)+", ";
				}
				hql = hql+ids.get(i)+")";
				
				Connection con = session.connection();
				PreparedStatement ps = con.prepareStatement(hql);
				
				for(j=0; j<values.length; j++){
					for(i=0; i<fieldNames.size()-1; i++) 
						ps.setObject(i, values[j].get(i));
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
	
	/**
	 * 更新操作
	 * @param tableName 表映射类名
	 * @param idName  where后的字段对应的属性名
	 * @param id where后的字段对应的属性名的值
	 * @param fieldNames 更新涉及的属性名
	 * @param values 新值的集合
	 * @return 更新影响的记录数
	 */
	@SuppressWarnings("unchecked")
	public int updateByhql(final String tableName, final String idName, final String id, final List<String> fieldNames, final List<Object> values) {
		// TODO Auto-generated method stub		
		
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {	
				int i,j;
				String hql=" update "+tableName+" set ";
				for(i=0; i<fieldNames.size()-1; i++)
				{
					hql=hql+fieldNames.get(i)+"= ?, ";
				}
				hql=hql+fieldNames.get(i)+"= ?";
				hql=hql+" where "+idName+" ="+id;
				
				Query q = session.createQuery(hql);
												
				for(i=0; i<fieldNames.size(); i++) 
					q.setParameter(i, values.get(i));
				return q.executeUpdate();
            }
		});
	}

	@Override
	public List<Object> getResult(List<String> f,List<Object> v,List<Date> t,int p) {
		return null;
	}

	@Override
	public int creatNodeFaultByHQL(String nodeId, String reportPerson,
			String finish, String problem) {
		// TODO Auto-generated method stub
		return 0;	
	}

	/**
	 * 非全字段插入操作
	 * @param tableName 表的映射类
	 * @param fieldNames 待插入的数据库字段名映射属性名集合
	 * @param values 待插入的数据库字段映射的属性值集合
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int createBySql(final String tableName, final List<String> fieldNames, final List<Object> values)
	{
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				String sql=" insert into "+tableName+" ( ";
				int i;
				for(i=0; i<fieldNames.size()-1; i++)
				{
					sql=sql+fieldNames.get(i)+" , ";
				}
				sql=sql+fieldNames.get(i)+" ) values ( ";
				for(i = 0; i<values.size()-1; i++){
					sql = sql+"'"+values.get(i)+"'"+" , ";
				}
				sql = sql+"'"+values.get(i)+"'"+")";
				
				Query query = session.createSQLQuery(sql);
				
				return query.executeUpdate();
            }
		});
	}
	
	
	/**
	 * 全字段插入操作
	 * @param name 表的映射类
	 * @param args 数据库字段值集合
	 * @param len 字段映射名集合的size
	 */
	@SuppressWarnings("unchecked")
	public void createByHql(String name, final List<Object> args, final int len)//必须表的全字段插入
	{
		String hqltmp=" insert into "+name+" values (";
		for(int i=0; i<len-1; i++)
		{
			hqltmp+="?,";
		}
		hqltmp+="?)";
		final String hql=hqltmp;
		hibertemplate.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
            	Connection conn=session.connection();   
                PreparedStatement ps=null;
                ps=conn.prepareStatement(hql); 
                	for(int j=0; j<len; j++)
                		ps.setString(j, (String) args.get(j));
                	ps.addBatch();
                ps.executeBatch();
                ps.close();   
                session.flush();   
                session.close();
                return null;
            }
        });
	}
	
	/**
	 * 
	 * @param name 表的映射类
	 * @param args 插入的多条记录各字段的集合
	 * @param len 属性个数
	 */
	//name表名，args插入的所有值，len字段长度
	@SuppressWarnings("unchecked")
	public void createMore(String name, final List<Object> args[], final int len)
	{
		String hqltmp=" insert into "+name+" values (";
		for(int i=0; i<len-1; i++)
		{
			hqltmp+="?,";
		}
		hqltmp+="?)";
		final String hql=hqltmp;
		hibertemplate.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
            	Connection conn=session.connection();   
                PreparedStatement ps=null;
                ps=conn.prepareStatement(hql); 
                for(int i=0; i<args.length; i++)
            	{
                	for(int j=0; j<len; j++)
                		ps.setString(j, (String) args[i].get(j));
                	ps.addBatch();
            	}
                ps.executeBatch();
                ps.close();   
                session.flush();   
                session.close();
                return null;
            }
        });
	}
	

	//tableName表名，idName：ID名，ids：ID字段的值，fieldNames：字段名称，values：字段值
	@SuppressWarnings("unchecked")
	public int updateStateMore(final String tableName, final String idName, final List<String> ids, final List<String> fieldNames, final List<String> values)
	{
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				String sql=" update "+tableName+" set ";
				int i;
				for(i=0; i<fieldNames.size()-1; i++)
				{
					sql=sql+fieldNames.get(i)+"='"+values.get(i)+"', ";
				}
				sql=sql+fieldNames.get(i)+"='"+values.get(i);
				sql=sql+"' where "+idName+" in (";
				for(i = 0; i<ids.size()-1; i++){
					sql = sql+ids.get(i)+", ";
				}
				sql = sql+ids.get(i)+")";
				
				Query query = session.createQuery(sql);
				
				return query.executeUpdate();
            }
		});
	}
	
	/**
	 * 更新
	 * @param tableName 表的映射类
	 * @param idName 
	 * @param ids
	 * @param fieldName 待更新的数据库字段映射属性名集合
	 * @param value 新值
	 * @return 
	 */
	@SuppressWarnings("unchecked")
	public int updateStates(final String tableName, final String idName, final List<?> ids, final String fieldName, final Object value)
	{
		return hibertemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				
				String hql=" update "+tableName+" set "+ fieldName +"="+ value +" where "+idName+" in ('";
				int i;
				for(i = 0; i<ids.size()-1; i++){
					hql = hql+ids.get(i)+"', '";
				}
				hql = hql+ids.get(i)+"')";
				
				Query query = session.createQuery(hql);
				
				return query.executeUpdate(); //返回执行受到影响的行数
            }
		});
	}

	/**
	 * 多次删除
	 * @param hql 删除语句
	 * @param ids 待删除的id的集合
	 */
	@SuppressWarnings("unchecked")
	public void deleteMoreByHql(final String hql, final List<?> ids) {
		// TODO Auto-generated method stub
		//System.out.println("hhhhh"+hql);
		hibertemplate.execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(hql);
                for(int i=0; i<ids.size(); i++)
            	{
                	query.setParameter(i, ids.get(i));
                	//System.out.println("ids: "+ids.get(i));
            	}
                return query.executeUpdate();
            }
        });
	}
	
//	@Override
//	public int updateByNor(String tableName, String nodeName) {
//		return 0;
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public int updateByInc(String tableName, List<String> channelId, List<Integer> incrstocks) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int updateByCur(String tableName, List<String> channelId, List<Integer> currstocks) {
//		// TODO Auto-generated method stub
//		System.out.println("updatebycurr aDao");
//		return 0;
//	}

	@Override
	public Boolean checkInIds(Class c,List<?> ids) {
		// TODO Auto-generated method stub
		return null;
	}

//	public long countRows(List<String> fieldNames,List<Object> values,List<Date> times,int pageNo){
//		return 0;
//	}

}
