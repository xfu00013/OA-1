package com.oa.model;

import java.util.List;
/**
 * 表单域
 * @author king
 * @hibernate.class table="t_formfield"
 */
public class FormField {
	
	/**
	 * @hibernate.id
	 * 		generator-class="native"
	 */
	private int id;
	
	/**
	 * 表单域标签
	 * @hibernate.property
	 */
	private String fieldLabel;
	
	/**
	 * 表单域的名称
	 * @hibernate.property
	 */
	private String fieldName;
	
	/**
	 * 表单域的输入形式
	 * @hibernate.many-to-one
	 * 		lazy="false"
	 */
	private FieldInput fieldInput;
	
	/**
	 * 表单域的类型
	 * @hibernate.many-to-one
	 * 		lazy="false"
	 */
	private FieldType fieldType;
	
	/**
	 * 额外参数，条目
	 * 比如：如果是下拉框，都有哪些值可供选择
	 * @hibernate.list table="t_fielditem" lazy="false"
	 * @hibernate.key column="fieldid"
	 * @hibernate.list-index column="itemindex"
	 * @hibernate.composite-element class="com.oa.model.FieldItem"
	 */
	private List items;
	
	/**
	 * 对应的表单
	 * @hibernate.many-to-one column="flowformid"
	 * 		lazy="false"
	 */
	private FlowForm flowForm;

	public FieldInput getFieldInput() {
		return fieldInput;
	}

	public void setFieldInput(FieldInput fieldInput) {
		this.fieldInput = fieldInput;
	}

	public String getFieldLabel() {
		return fieldLabel;
	}

	public void setFieldLabel(String fieldLabel) {
		this.fieldLabel = fieldLabel;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public FieldType getFieldType() {
		return fieldType;
	}

	public void setFieldType(FieldType fieldType) {
		this.fieldType = fieldType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List getItems() {
		return items;
	}

	public void setItems(List items) {
		this.items = items;
	}

	public FlowForm getFlowForm() {
		return flowForm;
	}

	public void setFlowForm(FlowForm flowForm) {
		this.flowForm = flowForm;
	}
}
