package com.struts2.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.print.attribute.standard.Severity;

import org.apache.struts2.ServletActionContext;
import org.dom4j.io.SAXReader;

import com.oa.manager.WorkflowManager;
import com.oa.model.Workflow;

public class WorkflowAction extends BaseAction{
	
	private WorkflowManager workflowManager;
	public void setWorkflowManager(WorkflowManager workflowManager) {
		this.workflowManager = workflowManager;
	}

	private int id;
	private String name;
	private File processDefinition;
	private File processImage;
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
	public File getProcessDefinition() {
		return processDefinition;
	}
	public void setProcessDefinition(File processDefinition) {
		this.processDefinition = processDefinition;
	}
	public File getProcessImage() {
		return processImage;
	}
	public void setProcessImage(File processImage) {
		this.processImage = processImage;
	}
	
	/**
	 * 打开流程管理主页面，列出当前所有流程
	 */
	public String execute() throws Exception {
		ServletActionContext.getRequest().setAttribute("workflows", workflowManager.searchAllWorkflows());
		
		return SUCCESS;
	}
	
	/**
	 * 添加流程定义
	 */
	public String add() throws Exception {
		
		//部署流程
		workflowManager.deployProcessDefinition(
				getBytesFromFile(processDefinition), 
				getBytesFromFile(processImage));
		
		return "add_success";
	}
	
	/**
	 * 删除流程定义
	 */
	public String delete() throws Exception {
		
		workflowManager.deleteWorkflow(id);
		
		return "del_success";
	}
	
	/**
	 * 打开查看流程图片的界面
	 * @return
	 * @throws Exception
	 */
	public String openViewImage() throws Exception {
		return SUCCESS;
	}
	
	/**
	 * 查看图片（此请求由flow_image.jsp中的<img src="workflow.do?method=viewImage">发起的请求）
	 * @return
	 * @throws Exception
	 */
	public String viewImage() throws Exception {
		Workflow wf = workflowManager.findWorkflow(id);
		ServletActionContext.getResponse().setContentType("image/jpeg");
		ServletActionContext.getResponse().getOutputStream().write(wf.getProcessImage());
		return null;
	}
	
	/**
	 * 查看流程定义文件的内容
	 * @return
	 * @throws Exception
	 */
	public String viewFlowDef() throws Exception {
		Workflow wf = workflowManager.findWorkflow(id);
		System.out.println(wf.getId()+"-------------------------------------------------------------");
		byte[] defs = wf.getProcessDefinition();
		
		//将byte[]转换为字符串
		//String defString = new String(defs,"UTF-8");
		
		//为了避免硬编码encoding，可以利用dom4j工具来帮助我们转换xml文件
		String defString = new SAXReader().read(
				new ByteArrayInputStream(defs)
			).asXML();
		
		ServletActionContext.getRequest().setAttribute("def", defString);
		return SUCCESS;
	}
	
	
	
	//将file转换为byte[]数组
	private byte[] getBytesFromFile(File file){
		byte[] ret = null;
		try {
			if (file == null) {
				return null;
			}
			FileInputStream in = new FileInputStream(file);
			ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
			byte[] b = new byte[4096];
			int n;
			while ((n = in.read(b)) != -1) {
				out.write(b, 0, n);
			}
			in.close();
			out.close();
			ret = out.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ret;
	}
}
