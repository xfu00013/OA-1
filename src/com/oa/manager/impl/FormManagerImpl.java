package com.oa.manager.impl;

import java.util.List;

import com.oa.manager.FormManager;
import com.oa.model.FieldInput;
import com.oa.model.FieldType;
import com.oa.model.FlowForm;
import com.oa.model.FormField;
import com.oa.model.Workflow;

public class FormManagerImpl extends AbstractPagerManager<FlowForm> implements FormManager {

	public void addField(FormField field, int formId,int fieldTypeId,int fieldInputId) {
		
		field.setFlowForm(
			(FlowForm)getHibernateTemplate().load(FlowForm.class, formId)
		);
		
		field.setFieldInput((FieldInput)getHibernateTemplate().load(FieldInput.class, fieldInputId));
		field.setFieldType((FieldType)getHibernateTemplate().load(FieldType.class, fieldTypeId));
		
		getHibernateTemplate().saveOrUpdate(field);
	}

	public FormField findFormField(int fieldId) {

		return (FormField)getHibernateTemplate().get(FormField.class, fieldId);
	}

	public void addForm(FlowForm form,int workflowId) {
		Workflow wf = (Workflow)getHibernateTemplate().get(Workflow.class, workflowId);
		form.setWorkflow(wf);
		getHibernateTemplate().saveOrUpdate(form);
	}

	public void updateFieldItems(int fieldId, List items) {
		FormField field = findFormField(fieldId);
		//System.out.println(field.getId()+"---------------------------------");
		field.setItems(items);
		//System.out.println(items+"---------------------------------------");
		getHibernateTemplate().update(field);
	}

	public void delField(int fieldId) {
		getHibernateTemplate().delete(
				(FormField)getHibernateTemplate().load(FormField.class, fieldId)
				);
	}

	public void delForm(int formId) {
		getHibernateTemplate().delete(
				(FlowForm)getHibernateTemplate().load(FlowForm.class, formId)
		);				
	}

	public FlowForm findForm(int workflowId) {
		
		return (FlowForm)getSession()
			.createQuery("select f from FlowForm f where f.workflow.id = ?")
			.setParameter(0, workflowId)
			.uniqueResult();
	}

	public List searchAllFields(int formId) {
		
		return getHibernateTemplate().find("select ff from FormField ff where ff.flowForm.id = ?",formId);
	}

	public List searchAllForms() {
		
		return getHibernateTemplate().find("from FlowForm");
	}

	public List searchFieldInputs() {
		
		return getHibernateTemplate().find("select fi from FieldInput fi");
	}

	public List searchFieldTypes() {
		return getHibernateTemplate().find("select ft from FieldType ft");
	}

	public FieldInput findFieldInput(int inputId) {
		return (FieldInput)getHibernateTemplate().load(FieldInput.class, inputId);
	}

	public FieldType findFieldType(int typeId) {
		return (FieldType)getHibernateTemplate().load(FieldType.class, typeId);
	}

}
