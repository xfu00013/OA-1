package com.oa.model;

import java.util.Date;
import java.util.Map;

/**
 * 公文
 * @author King
 * @hibernate.class table="t_document"
 */
public class Document {
	public static final String STATUS_NEW = "New";
	public static final String STATUS_END = "End";
	
	
	/**
	 * @hibernate.id
	 * 		generator-class="native"
	 */
	private int id;
	/**
	 * 标题
	 * @hibernate.property
	 */
	private String title;
	/**
	 * 描述
	 * @hibernate.property
	 */
	private String description;
	/**
	 * 公文内容，即上传文件的内容，
	 * 这些上传文件的内容将会被保存到数据库
	 * @hibernate.property
	 * 		type="binary"
	 * 		length="99999999"
	 */
	private byte[] content;
	/**
	 * 创建者
	 * @hibernate.many-to-one
	 * 		lazy="false"
	 */
	private User creator;
	/**
	 * 创建时间
	 * @hibernate.property
	 */
	private Date createTime;
	/**
	 * 公文的当前状态信息：
	 * 只有新建状态的公文，才可以被更新和删除
	 * 只有已完成状态的公文，才可以被归档
	 * @hibernate.property
	 */
	private String status;
	/**
	 * 公文所走的流程
	 * @hibernate.many-to-one
	 * 		lazy="false"
	 */
	private Workflow workflow;
	/**
	 * 流程实例的标识
	 * @hibernate.property
	 */
	private long processInstanceId;
	/**
	 * 表单的动态属性，key:String , value: DocumentProperty
	 * @hibernate.map table="t_document_properties"
	 * @hibernate.key column="documentid"
	 * @hibernate.map-key type="string" column="propertyname"
	 * @hibernate.composite-element class="com.oa.model.DocumentProperty"
	 */
	private Map props;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Workflow getWorkflow() {
		return workflow;
	}
	public void setWorkflow(Workflow workflow) {
		this.workflow = workflow;
	}
	public long getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(long processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Map getProps() {
		return props;
	}
	public void setProps(Map props) {
		this.props = props;
	}
	
}
