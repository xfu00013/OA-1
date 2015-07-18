package com.oa.manager;

import com.oa.PagerModel;
import com.oa.model.Organization;

public interface OrgManager {
	
	/**
	 * 添加机构
	 * @param org
	 * @param parentId
	 */
	public void addOrg(Organization org, int parentId);
	/**
	 * 删除机构
	 * @param orgId
	 */
	public void deleteOrg(int orgId);
	/**
	 * 修改机构
	 * @param org
	 * @param parentId
	 */
	public void modifyOrg(Organization org, int parentId);
	/**
	 * 查询机构
	 * @param orgId
	 * @return
	 */
	public Organization findOrg(int orgId);
	
	/**
	 * 查询机构列表，如果parentId为0，返回顶级机构列表
	 * @return
	 */
	public PagerModel<Organization> findOrgs(int parentId);
}
