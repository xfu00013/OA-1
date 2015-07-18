package com.struts2.action;

import java.util.Iterator;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.oa.AutoArrayList;
import com.oa.manager.FormManager;
import com.oa.manager.WorkflowManager;
import com.oa.model.FieldItem;
import com.oa.model.FlowForm;
import com.oa.model.FormField;
import com.oa.model.Workflow;

public class FlowFormAction extends BaseAction{
	private FormManager formManager;
	private WorkflowManager workflowManager;
	public void setFormManager(FormManager formManager) {
		this.formManager = formManager;
	}
	public void setWorkflowManager(WorkflowManager workflowManager) {
		this.workflowManager = workflowManager;
	}
	
	private int id;
	/**
	 * 流程
	 */
	private int workflowId;
	/**
	 * 模板
	 */
	private String template;
	//用于表单域的输入
	private int formId;
	private int fieldTypeId;
	private int fieldInputId;
	private String fieldName;
	private String fieldLabel;
	//表单域条目的输入
	private List items = new AutoArrayList(FieldItem.class);
	public int getFieldInputId() {
		return fieldInputId;
	}
	public void setFieldInputId(int fieldInputId) {
		this.fieldInputId = fieldInputId;
	}
	public String getFieldLabel() {
		return fieldLabel;
	}
	public void setFieldLabel(String fieldLabel) {
		this.fieldLabel = fieldLabel;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public int getFieldTypeId() {
		return fieldTypeId;
	}
	public void setFieldTypeId(int fieldTypeId) {
		this.fieldTypeId = fieldTypeId;
	}
	public int getFormId() {
		return formId;
	}
	public void setFormId(int formId) {
		this.formId = formId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public int getWorkflowId() {
		return workflowId;
	}
	public void setWorkflowId(int workflowId) {
		this.workflowId = workflowId;
	}
	public List getItems() {
		return items;
	}
	public void setItems(List items) {
		this.items = items;
	}
	
	//主界面，针对流程打开，在这个界面上，显示流程表单的信息
	public String execute() throws Exception {
		Workflow workflow = workflowManager.findWorkflow(workflowId);
		FlowForm flowForm = formManager.findForm(workflowId);
		
		ServletActionContext.getRequest().setAttribute("flowForm", flowForm);
		ServletActionContext.getRequest().setAttribute("workflow", workflow);
		return SUCCESS;
	}
	
	//添加流程表单
		public String addForm() throws Exception {
			
			FlowForm flowform = new FlowForm();
			flowform.setTemplate(template);
			flowform.setId(id);
			formManager.addForm(flowform, workflowId);
			
			/*
			ActionForward forward = new ActionForward();
			forward.setPath("/flowform.do?workflowId="+ffaf.getWorkflowId());
			forward.setRedirect(true);
			
			return forward;
			*/
			return "add_success";
		}
		
		//打开界面，输入表单域，在这个界面上，需要选择表单域的类型和输入形式
		public String formFieldInput() throws Exception {
			ServletActionContext.getRequest().setAttribute("fieldtypes", formManager.searchFieldTypes());
			ServletActionContext.getRequest().setAttribute("fieldinputs", formManager.searchFieldInputs());
			
			return SUCCESS;
		}
		
		//添加表单域
		public String addFormField() throws Exception {
			FormField field = new FormField();
			field.setId(id);
			field.setFieldLabel(fieldLabel);
			field.setFieldName(fieldName);
			
			formManager.addField(field,formId, fieldTypeId, fieldInputId);
			
			return "add_success";
		}
		
		//删除表单域
		public String deleteField() throws Exception {
			formManager.delField(id);
			
			return "del_success";
		}
		
		//给某个表单域添加条目（输入界面），列出已有的条目
		public String addItemInput() throws Exception {
			//首先根据ID的值，加载表单域
			FormField field = formManager.findFormField(id);
			
			ServletActionContext.getRequest().setAttribute("field", field);
			
			return SUCCESS;
		}
		
		//添加条目
		public String addItem() throws Exception {
			System.out.println("--------------------"+items+"--------------------");
			
			for (Iterator iter = items.iterator(); iter.hasNext();) {
				FieldItem item = (FieldItem) iter.next();
				//如果没有输入任何值，则忽略不处理
				if(item == null || item.getValue() == null || item.getValue().trim().equals("")){
					iter.remove();
				}
			}
			formManager.updateFieldItems(id, items);
			
			return "add_success";
		}
	
}
