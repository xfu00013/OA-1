package com.oa.manager.impl;

import java.util.Date;
import java.util.List;
import javax.jws.soap.SOAPBinding.Use;

import com.oa.PagerModel;
import com.oa.manager.DocumentManager;
import com.oa.manager.WorkflowManager;
import com.oa.model.ApproveInfo;
import com.oa.model.Document;
import com.oa.model.User;
import com.oa.model.Workflow;

public class DocumentManagerImpl extends AbstractPagerManager<Document> implements DocumentManager{

	private WorkflowManager workflowManager;
	public void setWorkflowManager(WorkflowManager workflowManager) {
		this.workflowManager = workflowManager;
	}

	//添加公文
	public void addDocument(Document document, int workflowId, int userId) {
		//保存公文信息
		document.setWorkflow((Workflow)getHibernateTemplate().load(Workflow.class, workflowId));
		document.setCreator((User)getHibernateTemplate().load(User.class, userId));
		document.setStatus(Document.STATUS_NEW);
		document.setCreateTime(new Date());
		getHibernateTemplate().save(document);
		
		//添加流程实例
		long processInstanceId = workflowManager.addProcessInstance(document.getWorkflow().getName(), document.getId());
		
		//绑定流程实例的标识到公文对象
		document.setProcessInstanceId(processInstanceId);
		getHibernateTemplate().update(document);
	}

	//查找特定公文
	public Document findDocument(int documentId) {
		//此处要用get，用load会出现lazy异常
		return (Document)getHibernateTemplate().get(Document.class, documentId);
	}

	//更新公文信息
	public void modifyDocument(Document document) {
		
	}

	//删除公文
	public void deleteDocument(int documentId) {
		Document document = (Document)getHibernateTemplate().load(Document.class, documentId);
		
		//删除公文信息
		getHibernateTemplate().delete(document);
		
		//删除流程实例
		workflowManager.deleteProcessInstance(document.getProcessInstanceId());
	}

	//查找用户创建的所有公文
	public PagerModel<Document> searchMyDocuments(int userId) {
		
		return searchPaginated("select d from Document d where d.creator.id = ?", userId);
	}

	//查找公文的审批历史
	public List searchApproveInfos(int documentId) {
		
		return getHibernateTemplate().find("from ApproveInfo ai where ai.document.id = ?", documentId);
	}

	//查找正在等待审批的公文
	public List searchApprovingDocuments(int userId) {
		User user = (User)getHibernateTemplate().load(User.class, userId);
		
		//搜索已流转到用户那里的公文标识列表
		List docIds = workflowManager.searchApprovingDocuments(user.getUsername());
		
		if(docIds == null || docIds.isEmpty()){
			return null;
		}
		//根据公文标识查找所有的公文对象
		return getSession()
				.createQuery("select d from Document d where d.id in (:ids)")
				.setParameterList("ids", docIds)
				.list();
	}

	//查找用户已审批过的公文
	public PagerModel<Document> searchApprovedDocuments(int userId) {
		
		return searchPaginated("select distinct ai.document from ApproveInfo ai where ai.approver.id = ?", userId);
	}

	//审批
	public void addApproveInfo(ApproveInfo approveInfo, int documentId,
			int approverId) {
		approveInfo.setDocument((Document)getHibernateTemplate().load(Document.class, documentId));
		approveInfo.setApprover((User)getHibernateTemplate().load(User.class, approverId));
		getHibernateTemplate().save(approveInfo);
	}

	
	
	//
	public List searchNextSteps(int documentId, int userId) {
		
		return null;
	}

	//提交到流程
	public void submitToWorkflow(int userId, int documentId,
			String transitionName) {
		User user = (User)getHibernateTemplate().load(User.class, userId);
		String username = user.getUsername();
		
		Document document = (Document)getHibernateTemplate().load(Document.class, documentId);
		long processInstanceId = document.getProcessInstanceId();
		
		String status = workflowManager.flowToNextStep(username, processInstanceId, transitionName);
		
		document.setStatus(status);
		getHibernateTemplate().update(document);
	}

}
