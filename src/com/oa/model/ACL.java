package com.oa.model;

/**
 * 
 * @author king
 * @hibernate.class table="t_acl"
 */
public class ACL {
	/**
	 * 主体类型：角色
	 */
	public static final String TYPE_ROLE = "Role";
	/**
	 * 主体类型：用户
	 */
	public static final String TYPE_USER = "User";
	/**
	 * 授权允许
	 */
	public static final int ACL_YES = 1;
	/**
	 * 授权不允许
	 */
	public static final int ACL_NO = 0;
	/**
	 * 授权不确定
	 */
	public static final int ACL_NEUTRAL = -1;
	/**
	 * @hibernate.id
	 * 		generator-class="native"
	 */
	private int id;
	
	/**
	 * 主体类型：角色或用户
	 * @hibernate.property
	 * 		not-null="true"
	 */
	private String principalType;
	/**
	 * 主体标识：角色标识或用户标识
	 * @hibernate.property
	 * 		not-null="true"
	 */
	private int principalSn;
	/**
	 * 资源标识
	 * @hibernate.property
	 * 		not-null="true"
	 */
	private int resourceSn;
	/**
	 * 授权状态，用后4位来标识CRUD操作
	 * @hibernate.property
	 * 		not-null="true"
	 */
	private int aclState;
	/**
	 * 表示是否继承，0表示不继承，-1表示继承
	 * @hibernate.property
	 * 		not-null="true"
	 */
	private int extendsState;
	
	public String getPrincipalType() {
		return principalType;
	}
	public void setPrincipalType(String principalType) {
		this.principalType = principalType;
	}
	public int getPrincipalSn() {
		return principalSn;
	}
	public void setPrincipalSn(int principalSn) {
		this.principalSn = principalSn;
	}
	public int getResourceSn() {
		return resourceSn;
	}
	public void setResourceSn(int resourceSn) {
		this.resourceSn = resourceSn;
	}
	public int getAclState() {
		return aclState;
	}
	public void setAclState(int aclState) {
		this.aclState = aclState;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getExtendsState() {
		return extendsState;
	}
	public void setExtendsState(int extendsState) {
		this.extendsState = extendsState;
	}
	
	/**
	 * acl实例跟主体和资源关联
	 * 根据此实例进行授权：某种操作是否允许
	 * @param permission 只可取值0，1，2，3
	 * @param yes true表示允许，false表示不允许
	 */
	public void setPermission(int permission, boolean yes) {
		int tmp = 1;
		tmp = tmp << permission;
		
		if(yes) {
			aclState |= tmp;
		} else {
			aclState &= ~tmp;
		}
	}
	
	/**
	 * 获得ACL授权
	 * @param permission C/R/U/D权限
	 * @return 授权标识，允许/不允许/不确定
	 */
	public int getPermission(int permission) {
		if(extendsState == 0xFFFFFFFF) {
			return ACL_NEUTRAL;
		}
		
		int tmp = 1;
		tmp = tmp << permission;
		
		tmp &= aclState;
		
		if(tmp != 0) {
			return ACL_YES;
		}
		
		return ACL_NO;
	}
	/**
	 * 设置本授权是否是继承的
	 * @param yes true表示继承，false表示不继承
	 */
	public void setExtends(boolean yes) {
		if(yes) {
			extendsState = 0xFFFFFFFF;
		} else {
			extendsState = 0;
		}
	}
}
