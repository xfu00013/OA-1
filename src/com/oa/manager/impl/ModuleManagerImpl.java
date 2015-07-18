package com.oa.manager.impl;

import com.oa.PagerModel;
import com.oa.manager.ModuleManager;
import com.oa.model.Module;

public class ModuleManagerImpl extends AbstractPagerManager<Module> implements ModuleManager {

	public void addModule(Module module, int parentId) {
		if(parentId != 0) {
			module.setParent((Module)this.getHibernateTemplate().get(Module.class, parentId));
		}
		
		this.getHibernateTemplate().save(module);
	}

	public void deleteModule(int moduleId) {
		Module module = (Module)this.getHibernateTemplate().get(Module.class, moduleId);
		
		if(module.getChildren().size() > 0) {
			throw new RuntimeException("Exist child module, not allow delete");
		}
		this.getHibernateTemplate().delete(module);

	}

	public Module findModule(int moduleId) {
		return (Module)this.getHibernateTemplate().get(Module.class, moduleId);
	}

	public void modifyModule(Module module, int parentId) {
		if(parentId != 0) {
			module.setParent((Module)this.getHibernateTemplate().get(Module.class, parentId));
		}
		
		this.getHibernateTemplate().update(module);

	}

	public PagerModel<Module> searchModules(int parentId) {
		return this.searchPaginated("select m from Module m where " + (parentId ==0 ? "m.parent is null" : ("m.parent.id = " + parentId)));
	}

}
