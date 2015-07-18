package com.oa.model;

import java.util.Set;

/**
 * 流程表单
 * @author king
 * @hibernate.class table="t_flowform"
 */
public class FlowForm {
	
	/**
	 * @hibernate.id
	 * 		generator-class="native"
	 */
	private int id;
	
	/**
	 * 对应的工作流
	 * @hibernate.many-to-one
	 * 		lazy="false"
	 */
	private Workflow workflow;
	
	/**
	 * 表单模版
	 * @hibernate.property
	 */
	private String template;
	
	/**
	 * 表单包含的表单域
	 * @hibernate.set inverse="true" lazy="false"
	 * @hibernate.key column="flowformid"
	 * @hibernate.one-to-many class="com.oa.model.FormField"
	 */
	private Set fields;

	public Set getFields() {
		return fields;
	}

	public void setFields(Set fields) {
		this.fields = fields;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public Workflow getWorkflow() {
		return workflow;
	}

	public void setWorkflow(Workflow workflow) {
		this.workflow = workflow;
	}
}

