package com.oa.manager.impl;

import com.oa.PagerModel;
import com.oa.manager.RoleManager;
import com.oa.model.Role;

public class RoleManagerImpl extends AbstractPagerManager<Role> implements RoleManager {

	public void addRole(Role role) {
		this.getHibernateTemplate().save(role);

	}

	public void deleteRole(int roleId) {
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(Role.class, roleId));

	}

	public Role findRole(int roleId) {
		
		return (Role)this.getHibernateTemplate().get(Role.class, roleId);
	}

	public void modifyRole(Role role) {
		this.getHibernateTemplate().update(role);

	}

	public PagerModel<Role> searchRoles() {
		return this.searchPaginated("from Role");
	}
	
	public String method() {
		return "hello";
	}
}
