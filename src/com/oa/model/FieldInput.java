package com.oa.model;

/**
 * 表单的输入形式
 * @author king
 * @hibernate.class table="t_fieldinput"
 */
public class FieldInput {
	
	/**
	 * @hibernate.id
	 * 		generator-class="native"
	 */
	private int id;
	
	/**
	 * 页面表单元素的名称，如：
	 * 文本输入框、下拉框、文件等等
	 * @hibernate.property
	 */
	private String name;
	
	/**
	 * 针对这个页面表单元素，如何呈现为HTML代码
	 * 通过模版来实现！
	 * @hibernate.property
	 */
	private String template;

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

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}
}
