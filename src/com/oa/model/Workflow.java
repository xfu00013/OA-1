package com.oa.model;
/**
 * 流程
 * @author King
 * @hibernate.class table="t_workflow"
 */
public class Workflow {
	/**
	 * @hibernate.id
	 * 	generator-class="native"
	 */
	private int id;
	/**
	 * 流程名称
	 * @hibernate.property
	 * 		unique="true"
	 */
	private String name;
	/**
	 * 流程定义文件
	 * @hibernate.property
	 *  	type="binary"
	 * 		length="99999999"
	 */
	private byte[] processDefinition;
	/**
	 * 流程定义图片
	 * @hibernate.property
	 * 		type="binary"
	 * 		length="99999999"
	 */
	private byte[] processImage;
	
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
	public byte[] getProcessDefinition() {
		return processDefinition;
	}
	public void setProcessDefinition(byte[] processDefinition) {
		this.processDefinition = processDefinition;
	}
	public byte[] getPic() {
		return processImage;
	}
	public void setPic(byte[] pic) {
		this.processImage = pic;
	}
	public byte[] getProcessImage() {
		return processImage;
	}
	public void setProcessImage(byte[] processImage) {
		this.processImage = processImage;
	}
	
}
