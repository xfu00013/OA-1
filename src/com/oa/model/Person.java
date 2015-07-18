package com.oa.model;

/**
 * 
 * @author King
 * @hibernate.class table="t_person"
 */
public class Person {
	/**
	 * @hibernate.id
	 * generator-class="native"
	 */
	private int id;
	/**
	 * @hibernate.property
	 */
	private String name;
	/**
	 * @hibernate.property
	 */
	private String sex;
	/**
	 * @hibernate.property
	 */
	private String address;
	/**
	 * @hibernate.property
	 */
	private String duty;
	/**
	 * @hibernate.property
	 */
	private String phone;
	/**
	 * @hibernate.property
	 */
	private String description;
	/**
	 * @hibernate.many-to-one
	 * 		not-found="ignore"
	 * 		lazy="false"
	 */
	private Organization org;
	/**
	 * 1对1双向关联
	 * @hibernate.one-to-one
	 * 		property-ref="person"
	 * 		lazy="false"
	 */
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Organization getOrg() {
		return org;
	}

	public void setOrg(Organization org) {
		this.org = org;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
