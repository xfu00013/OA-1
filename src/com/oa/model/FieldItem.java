package com.oa.model;


/**
 * 下拉框的列表元素，即<option value="value">label</option>
 * @author king
 *	
 */
public class FieldItem {
	
	/**
	 * 文本
	 * @hibernate.property
	 */
	private String label;
	
	/**
	 * 值
	 * @hibernate.property
	 */
	private String value;

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
