package com.struts2.action;

import com.oa.manager.OrgManager;
import com.oa.model.Organization;
import com.opensymphony.xwork2.ActionSupport;

public class AddAction extends BaseAction{
	
	private OrgManager orgManager;
	
	public void setOrgManager(OrgManager orgManager) {
		this.orgManager = orgManager;
	}
	
	private int parentId;
	
	private String name;
	
	private String description;

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public String execute() throws Exception {
		
		Organization org = new Organization();
		org.setName(name);
		org.setDescription(description);
		
		orgManager.addOrg(org, parentId);
		
		return "add_success";
	}
}
