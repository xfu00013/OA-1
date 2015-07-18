package com.oa.model;

/**
 * 
 * @author king
 * @hibernate.class table="t_ur"
 */
public class UsersRoles {
	/**
	 * @hibernate.id
	 * 		generator-class="native"
	 */
	private int id;
	/**
	 * 对应的角色
	 * @hibernate.many-to-one
	 * 		lazy="false"
	 */
	private Role role;
	/**
	 * 对应的用户
	 * @hibernate.many-to-one
	 * 		lazy="false"
	 */
	private User user;
	/**
	 * 角色在这个用户中的优先级
	 * @hibernate.property
	 */
	private int orderNum;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	
}
