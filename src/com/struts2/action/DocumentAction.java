package com.struts2.action;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.BeanUtils;

import com.oa.manager.DocumentManager;
import com.oa.manager.FormManager;
import com.oa.manager.WorkflowManager;
import com.oa.model.ApproveInfo;
import com.oa.model.Document;
import com.oa.model.DocumentProperty;
import com.oa.model.FieldType;
import com.oa.model.FlowForm;
import com.oa.model.FormField;

public class DocumentAction extends BaseAction implements ServletResponseAware{
	
	private DocumentManager documentManager;
	private WorkflowManager workflowManager;
	private FormManager formManager;
	public void setDocumentManager(DocumentManager documentManager) {
		this.documentManager = documentManager;
	}
	public void setWorkflowManager(WorkflowManager workflowManager) {
		this.workflowManager = workflowManager;
	}
	public void setFormManager(FormManager formManager) {
		this.formManager = formManager;
	}
	
	private HttpServletResponse response;
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	private int id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 公文内容，即上传文件的内容，
	 * 这些上传文件的内容将会被保存到数据库
	 */
	private File contentFile;
	/**
	 * 创建者
	 */
	private int creatorId;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 公文所走的流程
	 */
	private int workflowId;
	/**
	 * 下一步流向的名称
	 */
	private String transitionName;
	private String approveInfo;
	private Map props = new HashMap();
	
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
	public File getContentFile() {
		return contentFile;
	}
	public void setContentFile(File contentFile) {
		this.contentFile = contentFile;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getWorkflowId() {
		return workflowId;
	}
	public void setWorkflowId(int workflowId) {
		this.workflowId = workflowId;
	}
	public String getTransitionName() {
		return transitionName;
	}
	public void setTransitionName(String transitionName) {
		this.transitionName = transitionName;
	}
	public String getApproveInfo() {
		return approveInfo;
	}
	public void setApproveInfo(String approveInfo) {
		this.approveInfo = approveInfo;
	}
	public Map getProps() {
		return props;
	}

	public void setProps(Map props) {
		this.props = props;
	}
	
	//公文管理主界面，显示我的公文刘表
	public String execute() throws Exception {
		ServletActionContext.getRequest().setAttribute("pm",documentManager.searchMyDocuments(currentUser().getId()));
		return SUCCESS;
	}
	
	/**
	 * 已审核公文列表，显示由当前登录人员审核的公文列表
	 * @return
	 * @throws Exception
	 */
	public String approvedList() throws Exception {
		
		ServletActionContext.getRequest().setAttribute("pm",documentManager.searchApprovedDocuments(currentUser().getId()));
		return SUCCESS;
	}
	
	/**
	 * 待审核公文列表，显示等待当前登录人员审核的公文列表
	 * @return
	 * @throws Exception
	 */
	public String approvingList() throws Exception {
		
		ServletActionContext.getRequest().setAttribute("documents",documentManager.searchApprovingDocuments(currentUser().getId()));
		return SUCCESS;
	}
	
	/**
	 * 在待审核公文列表上，针对某个文档，可以点击打开审批界面，对此文档进行审批
	 * @return
	 * @throws Exception
	 */
	public String approveInput() throws Exception {
		
		return SUCCESS;
	}
	
	/**	
	 * 用户输入审批信息之后，点击保存，对文档进行审批操作
	 * @return
	 * @throws Exception
	 */
	public String approve() throws Exception {
		
		String comment = approveInfo;
		
		ApproveInfo approveInfo = new ApproveInfo();
		approveInfo.setApproveTime(new Date());
		approveInfo.setComment(comment);
		
		documentManager.addApproveInfo(approveInfo, id, currentUser().getId());
		
		return SUCCESS;
	}
	
	/**
	 * 在我的公文或待审核公文列表上，点击提交，可打开提交的选择界面
	 * 在这个界面上，列出下一步所有可选的步骤，用户可以选择其中一个
	 * 步骤进行提交操作。系统将按照用户的选择转移到下一个节点
	 * @return
	 * @throws Exception
	 */
	public String submitInput() throws Exception {
		System.out.println("hahaahahahahahaha");
		
		Document doc = documentManager.findDocument(id);
		System.out.println(doc.getId()+"-------------------");
		List transitions = workflowManager.searchNextTransitions(currentUser().getUsername(),doc.getProcessInstanceId());
		ServletActionContext.getRequest().setAttribute("steps", transitions);
		return SUCCESS;
	}
	
	/**
	 * 用户选择了其中一个步骤，点击提交
	 * @return
	 * @throws Exception
	 */
	public String submit() throws Exception {
		
		Document doc = documentManager.findDocument(id);
		
//		workflowManager.flowToNextStep(
//				currentUser().getUsername(), 
//				doc.getProcessInstanceId(), 
//				transitionName);
		documentManager.submitToWorkflow(currentUser().getId(), id, transitionName);
		return "add_success";
	}
	
	/**
	 * 查看公文的审批历史
	 * @return
	 * @throws Exception
	 */
	public String approvedHistory() throws Exception {
		
		ServletActionContext.getRequest().setAttribute("historys",documentManager.searchApproveInfos(id));
		return SUCCESS;
	}
	
	
	public String delete() throws Exception {
		documentManager.deleteDocument(id);
		return "del_success";
	}
	
	/**
	 * 点击添加公文的时候，需要选择相应的流程，此界面列出所有的流程以供选择
	 * @return
	 * @throws Exception
	 */
	public String selectFlow() throws Exception {
		ServletActionContext.getRequest().setAttribute("workflows", workflowManager.searchAllWorkflows());
		return SUCCESS;
	}
	
	/**
	 * 选择了流程之后（即点击流程名称），需要打开公文录入界面
	 * @return
	 * @throws Exception
	 */
	public String addInput() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 添加公文的操作
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception {
		
		Document document = new Document();
		document.setTitle(title);
		document.setDescription(description);
		
		
		//处理Map的数据
		
				//将ActionForm中的Map的数据，按照表单定义对应的类型来进行转换，并设置到document对象即可
				if(props.isEmpty()){
					System.out.println("---------------props is null----------");
					document.setProps(null);
				}else{
					
					//流程对应的表单定义
					FlowForm flowForm = formManager.findForm(workflowId);
					
					if(flowForm == null){
						document.setProps(null);
					}else{
						
						Map documentProps = new HashMap();
						
						//拿到表单定义对应的所有的域定义
						Set fields = flowForm.getFields();
						
						for (Iterator iter = fields.iterator(); iter.hasNext();) {
							FormField field = (FormField) iter.next();
							
							String propertyName = field.getFieldName();
							FieldType propertyType = field.getFieldType();
							
							//根据表单的属性名称，从Map中将界面上传过来的原始值拿出来
							Object source = props.get(propertyName);
							Object target = null;
							
							if(source != null){
								
								//对于输入的字符串
								if(source instanceof String && !propertyType.getType().equals("java.io.File")){
									
									Class targetClass = Class.forName(propertyType.getType());
									
									//利用ConvertUtils工具，将从界面上传过来的字符串
									//转换为FormFiled对应的FieldType所指定类型的对象
									target = ConvertUtils.convert((String)source, targetClass);
								}
								
								//如果表单域是上传文件
								if(propertyType.getType().equals("java.io.File")){
									
									//注意：如果界面上传的是文件，struts可以自动转换为FormFile类型的对象！！！！
//									FormFile ff  = (FormFile)source;
//									target = ff.getFileData();
								}
								
								//现在，需要将target的值赋予document对象
								if(target == null){
									throw new RuntimeException("无法处理输入的值！");
								}
								
								DocumentProperty dp = new DocumentProperty();
								String type = propertyType.getType();
								if(type.equals("java.io.File")){
									dp.setJava_io_File((byte[])target);
								}
								if(type.equals("java.lang.Integer")){
									dp.setJava_lang_Integer((Integer)target);
								}
								if(type.equals("java.lang.String")){
									dp.setJava_lang_String((String)target);
								}
								
								documentProps.put(propertyName, dp);
							}
						}
						
						//将documentProps对象赋予document对象的props属性
						document.setProps(documentProps);
					}
				}
		
		
		
		if(contentFile != null){
			document.setContent(getBytesFromFile(contentFile));
		}
		
		documentManager.addDocument(document, workflowId, currentUser().getId());
		
		return "add_success";
	}
	
	//下载公文附件
	public String download(){
		Document document = documentManager.findDocument(id);
		
		response.reset();
		response.setContentType("application/x-download;charset=GBK");
		response.setHeader("Content-Disposition", "attachment;filename=temp.do");
		
			try {
				response.getOutputStream().write(document.getContent());
				response.getOutputStream().flush();
				response.getOutputStream().close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		//指示struts，不要对返回值进行处理
		return null;	
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
