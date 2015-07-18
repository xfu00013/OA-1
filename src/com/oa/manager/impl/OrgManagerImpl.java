package com.oa.manager.impl;

import com.oa.PagerModel;
import com.oa.manager.OrgManager;
import com.oa.model.Organization;

public class OrgManagerImpl extends AbstractPagerManager<Organization> implements OrgManager{

	public void addOrg(Organization org, int parentId) {
		if(parentId != 0){
			org.setParent((Organization)this.getHibernateTemplate()
					.get(Organization.class, parentId));
		}
		this.getHibernateTemplate().save(org);
		//给机构添加唯一编号
		org.setSn(org.getParent() == null ? ("" + org.getId()) : (org.getParent().getSn() + "_" + org.getId()));
		
		this.getHibernateTemplate().update(org);
		
	}

	public void deleteOrg(int orgId) {
		
		Organization org = (Organization)this.getHibernateTemplate().get(Organization.class, orgId);
		
		if(org.getChildren().size()>0){
			throw new RuntimeException("Exist child institution, not allow delete!");
		}
		
		this.getHibernateTemplate().delete(this.getHibernateTemplate()
				.get(Organization.class, orgId));
	}

	public void modifyOrg(Organization org, int parentId) {
		if(parentId != 0){
			org.setParent((Organization)this.getHibernateTemplate()
					.get(Organization.class, parentId));
		}
		
		this.getHibernateTemplate().update(org);
	}

	public Organization findOrg(int orgId) {
		
		return (Organization)this.getHibernateTemplate().get(Organization.class, orgId);
	}

	
	public PagerModel<Organization> findOrgs(int parentId) {
//		//查询总的条目数
//		String selectCountHql = "select count(*) from Organization org where org.parent is null";
//		
//		if(parentId != 0){
//			selectCountHql = "select count(*) from Organization org where org.parent.id = " + parentId;
//		}
//		
//		int total = ((Long)this.getSession().createQuery(selectCountHql).uniqueResult()).intValue();
//		
//		//查询机构列表
//		String selectHql = "select org from Organization org where org.parent is null";
//		
//		if(parentId != 0) {
//			selectHql = "select org from Organization org where org.parent.id = " + parentId;
//		}
//		
//		List<Organization> list = this.getSession().createQuery(selectHql).setFirstResult(offset).setMaxResults(pagesize).list();
//		
//		System.out.println("listSize:" + list.size());
//		
//		PagerModel<Organization> pm = new PagerModel<Organization>();
//		pm.setTotal(total);
//		pm.setList(list);
//		
//		return pm;
		
		if(parentId == 0) {
			return this.searchPaginated("from Organization org where org.parent is null");
		}
		
		return this.searchPaginated("from Organization org where org.parent.id = ?", parentId);
	}
}
