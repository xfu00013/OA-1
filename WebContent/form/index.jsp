<%@ page language="java" contentType="text/html; charset=Gb18030" pageEncoding="Gb18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUbLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Gb18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Set Flow Form</title>
</head>
<body>
	<center>
		<form action="addForm.action" method="post">
			<input type="hidden" name="id" value="${flowForm.id }"> 
			<input type="hidden" name="workflowId" value="${workflow.id}">
			<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
				<tbody>
					<tr>
						<!-- 这里是添加、编辑界面的标题 -->
						<td align="center" class="tdEditTitle">
							Set Flow【${workflow.name}】Form
						</td>
					</tr>
					<tr>
						<td>
							<!-- 主输入域开始 -->
							<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
								<c:if test="${empty flowForm.template }">
									<c:set var="tmp" value="document_form.ftl" />
								</c:if>
								<c:if test="${!empty flowForm.template }">
									<c:set var="tmp" value="${flowForm.template}" />
								</c:if>
								<tr>
									<td>Form Template</td>
									<td>
										<input type="text" name="template" value="${tmp}">
									</td>
								</tr>
							</table> <c:if test="${!empty flowForm }">
								<hr>
								<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
									<tr bgcolor="#EFF3F7" class="tablebody1">
										<td width="20%"><b>Label</b></td>
										<td width="20%"><b>Name</b></td>
										<td width="20%"><b>Type</b></td>
										<td width="20%"><b>Input Form</b></td>
										<td width="20%"><b>Operation</b></td>
									</tr>
									<c:forEach items="${flowForm.fields }" var="field">
										<tr>
											<td>${field.fieldLabel }</td>
											<td>${field.fieldName }</td>
											<td>${field.fieldType.name }</td>
											<td>${field.fieldInput.name }</td>
											<td>
												<a href="#" onclick="del('deleteField.action?id=${field.id}')">Delete</a>
												<a href="#" onclick="openWin('addItemInput.action?id=${field.id }','additem',700,600)">Item</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</c:if> <!-- 主输入域结束 -->
						</td>
					</tr>
				</tbody>
			</table>

			<table>
				<tr align="center">
					<td colspan="3" bgcolor="#EFF3F7">
						<input type="submit" name="savebutton" class="Mybutton" value="Save Form Info"> 
							<c:if test="${!empty flowForm }">
								<input type="button" class="Mybutton" value="Add Form Field" onclick="openWin('formFieldInput.action?formId=${flowForm.id }','addformfield',600,200)">
							</c:if> 
						<input type="button" class="Mybutton" value="Close Window" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>