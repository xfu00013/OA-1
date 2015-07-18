package com.oa.model;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oa.manager.OrgManager;

import junit.framework.TestCase;

public class OrgManagerTest extends TestCase{
	
	private static BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext-*.xml");
	
	public void testAddOrg(){
		OrgManager orgManager = (OrgManager)factory.getBean("orgManager");
		
		Organization org = new Organization();
		org.setName("测试机构");
		org.setDescription("没有什么描述");
		
		orgManager.addOrg(org, 0);
	} 
	
	public void testDeleteOrg(){
		
	}
	
	public void testModifyOrg(){
		
	}
	
	public void testFindOrg(){
		
	}
	
	public void testFindOrgs(){
		
	}
}
