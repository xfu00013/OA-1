package com.oa.manager;

import java.util.List;

import com.oa.PagerModel;
import com.oa.model.ApproveInfo;
import com.oa.model.Document;

public interface DocumentManager {
	/**
	 * 添加公文信息
	 * @param document
	 * @param workflowId
	 * @param userId
	 */
	public void addDocument(Document document, int workflowId, int userId);
	/**
	 * 查找某个公文的信息
	 * @param documentId
	 * @return
	 */
	public Document findDocument(int documentId);
	/**
	 * 更新公文信息
	 * @param document
	 */
	public void modifyDocument(Document document);
	/**
	 * 删除公文信息
	 * @param documentId
	 */
	public void deleteDocument(int documentId);
	/**
	 * 搜索用户自身创建的公文列表
	 * @param userId
	 * @return
	 */
	public PagerModel<Document> searchMyDocuments(int userId);
	/**
	 * 查询公文的审批信息
	 * @param documentId
	 * @return
	 */
	public List searchApproveInfos(int documentId);
	/**
	 * 查询待用户审批的公文列表
	 * @param userId
	 * @return
	 */
	public List searchApprovingDocuments(int userId);
	/**
	 * 查询用户已审批过的公文列表
	 * @param userId
	 * @return
	 */
	public PagerModel<Document> searchApprovedDocuments(int userId);
	/**
	 * 存储审批信息
	 * @param approveInfo 审批信息
	 * @param documentId 被审批的公文
	 * @param approverId 审批者ID
	 */
	public void addApproveInfo(ApproveInfo approveInfo, int documentId, int approverId);
	
	/**
	 * 查询下一个可选步骤列表（公文ID，用户标识）
	 * @param documentId
	 * @param userId
	 * @return
	 */
	public List searchNextSteps(int documentId,int userId);
	
	/**
	 * 提交到流程
	 * @param userId 当前登录用户的ID
	 * @param documentId 被提交的公文ID
	 * @param transistionName 要提交到哪里去
	 */
	public void submitToWorkflow(int userId,int documentId,String transitionName);
}
