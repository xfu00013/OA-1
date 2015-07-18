package com.oa.manager.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.oa.manager.UserManager;
import com.oa.model.Person;
import com.oa.model.Role;
import com.oa.model.User;
import com.oa.model.UsersRoles;

public class UserManagerImpl extends AbstractPagerManager<User> implements
		UserManager {

	public void addOrModifyUserRole(int userId, int roleId, int orderNum) {
		//根据userId和roleId查找UsersRoles对象
		UsersRoles ur = this.findUsersRoles(userId, roleId);
		
		if(ur == null) {
			ur = new UsersRoles();
			ur.setOrderNum(orderNum);
			ur.setUser((User)this.getHibernateTemplate().get(User.class, userId));
			ur.setRole((Role)this.getHibernateTemplate().get(Role.class, roleId));
			
			this.getHibernateTemplate().save(ur);
			return;
		}
		//
		ur.setOrderNum(orderNum);
		this.getHibernateTemplate().update(ur);
	}

	public void addUser(User user, int personId) {
		if(personId == 0) {
			throw new RuntimeException("Must select related person info");
		}
		user.setPerson((Person)this.getHibernateTemplate().get(Person.class, personId));
		
		//设置添加时间
		user.setCreateTime(new Date());
		
		this.getHibernateTemplate().save(user);
	}

	public void deleteUser(int userId) {
		this.getHibernateTemplate().delete(this.getHibernateTemplate().get(User.class, userId));

	}

	public void deleteUserRole(int userId, int roleId) {
		this.getHibernateTemplate().delete(this.findUsersRoles(userId, roleId));

	}

	public User findUser(int userId) {
		
		return (User)this.getHibernateTemplate().get(User.class, userId);
	}

	public User login(String username, String password) {
		/**
		 * 因为设置了User的auto-import="false",所以，在这里使用
		 * HQL查询的时候，必须使用全路径的类名
		 */
		User user = (User)this.getSession().createQuery(
									"select u from com.oa.model.User u where u.username = ?")
									.setParameter(0, username)
									.uniqueResult();
		
		if(user == null) {
			throw new RuntimeException("This User not Exist ");
		}
		
		if(!user.getPassword().equals(password)) {
			throw new RuntimeException("Password Error");
		}
		
		if(user.getExpireTime() != null) {
			//现在时间
			Calendar now = Calendar.getInstance();
			
			//失效时间
			Calendar expireTime = Calendar.getInstance();
			expireTime.setTime(user.getExpireTime());
			
			if(now.after(expireTime)) {
				throw new RuntimeException("This Account Expires");
			}
		}
		
		return user;
	}

	public void modifyUser(User user, int personId) {
		System.out.println("personId:" + personId);
		user.setPerson((Person)this.getHibernateTemplate().get(Person.class, personId));
		this.getHibernateTemplate().update(user);

	}

	@SuppressWarnings("unchecked")
	public List<UsersRoles> searchUserRoles(int userId) {
		
		return this.getHibernateTemplate().find("select ur from UsersRoles ur where ur.user.id = ?", userId);
	}
	
	public UsersRoles findUsersRoles(int userId, int roleId) {
		return (UsersRoles)this.getSession().createQuery(
		"select ur from UsersRoles ur where ur.user.id = ? and ur.role.id = ?")
		.setParameter(0, userId)
		.setParameter(1, roleId)
		.uniqueResult();
	}

}
