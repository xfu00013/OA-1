package com.struts2.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.oa.model.User;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {
	
	@Override
	public String execute() throws Exception {
		//添加权限认证代码
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("login");
		if(user == null) {
			return "login";
		}
		
		return super.execute();
	}
	
	protected int getOffset(HttpServletRequest request){
		int offset = 0;
		try {
			offset = Integer.parseInt(request.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		return offset;
	}
	
	protected int getPagesize(HttpServletRequest request){
		return 10;
	}
	
	
	protected User currentUser(){
		return (User)ServletActionContext.getRequest().getSession().getAttribute("login");
	}
}
