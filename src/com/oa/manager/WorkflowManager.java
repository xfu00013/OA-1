package com.oa.manager;

import java.util.List;

import com.oa.model.Workflow;

public interface WorkflowManager {
	/**
	 * 部署流程定义
	 * @param processDefinition
	 * @param processImage
	 */
	public void deployProcessDefinition(byte[] processDefinition, byte[] processImage);
	/**
	 * 查找特定流程定义信息
	 * @param workflowId 流程标识（Id）
	 * @return
	 */
	public Workflow findWorkflow(int workflowId);
	/**
	 * 删除流程定义
	 * @param workflowId 流程标识（Id）
	 */
	public void deleteWorkflow(int workflowId);
	/**
	 * 查询已有的所有流程定义信息
	 * @return 列表的元素是: Workflow对象
	 */
	public List searchAllWorkflows();
	/**
	 * 添加流程实例
	 * @param workflowName 流程名称
	 * @param documentId 公文标识
	 * @return 流程实例标识
	 */
	public long addProcessInstance(String workflowName, int documentId);
	/**
	 * 删除流程实例
	 * @param processInstanceId
	 * @return
	 */
	public void deleteProcessInstance(long processInstanceId);
	
	/**
	 * 查找流转到某个用户那里的所有公文
	 * @param username 用户账号
	 * @return 公文的标识，其元素是int类型
	 */
	public List searchApprovingDocuments(String username);
	/**
	 * 搜索下一步的流向，即下一步都可以走那些路劲
	 * @param username
	 * @param processInstanceId 流程实例标识
	 * @return 流向的名称列表
	 */
	public List searchNextTransitions(String username, long processInstanceId);
	/**
	 * 流向下一步
	 * @param username 用户账号
	 * @param transitionName 流程实例标识
	 * @param processInstanceId 流向名称
	 */
	public String flowToNextStep(String username,long processInstanceId,String transitionName);
}
