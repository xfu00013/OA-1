package com.struts2.action;

import com.oa.manager.OrgManager;
import com.opensymphony.xwork2.ActionSupport;

public class DelAction extends BaseAction{
	
	private OrgManager orgManager;
	
	public void setOrgManager(OrgManager orgManager) {
		this.orgManager = orgManager;
	}
	
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String execute() throws Exception {
		orgManager.deleteOrg(id);
		return "del_success";
	}
}
