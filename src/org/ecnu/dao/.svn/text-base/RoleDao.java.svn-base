package org.ecnu.dao;

import java.util.List;

import org.ecnu.orm.Role;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDao extends AbstractDao {
	@SuppressWarnings("unchecked")
	public List<Role> getAllRole(){
		List<Role> results = null;
		DetachedCriteria crit=DetachedCriteria.forClass(Role.class);

		results = hibertemplate.findByCriteria(crit);
		return results;
	}
}
