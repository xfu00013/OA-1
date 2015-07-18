package com.oa;

import com.oa.manager.AclManager;

//JSTL函数，完成权限的即时认证
public class SecurityFunction {
	
	private static AclManager aclManager;
	
	public static boolean method(int userId,String sn,int permission) {
		
		return aclManager.hasPermissionBySn(userId, sn, permission);
	}

	//该方法不能定义为static，否则spring无法注入
	public void setAclManager(AclManager aclManager) {
		SecurityFunction.aclManager = aclManager;
	}
}
