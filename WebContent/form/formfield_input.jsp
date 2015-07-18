<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Text Field</title>
</head>
<body>
	<center>
		<form action="addFormField.action" method="post">
			<input type="hidden" name="method" value="addFormField"> 
			<input type="hidden" name="id" value="${param.id}"> 
			<input type="hidden" name="formId" value="${param.formId}">
			<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
				<tbody>
					<tr>
						<!-- 这里是添加、编辑界面的标题 -->
						<td align="center" class="tdEditTitle">Text Field</td>
					</tr>
					<tr>
						<td>
							<!-- 主输入域开始 -->
							<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
								<tr>
									<td class="tdEditLabel">Label</td>
									<td class="tdEditContent">
										<input type="text" name="fieldLabel">
									</td>
									<td class="tdEditLabel">Name</td>
									<td class="tdEditContent">
										<input type="text" name="fieldName">
									</td>
								</tr>
								<tr>
									<td class="tdEditLabel">type</td>
									<td class="tdEditContent">
										<select name="fieldTypeId">
											<c:forEach items="${fieldtypes }" var="ft">
												<option value="${ft.id }">${ft.name }</option>
											</c:forEach>
										</select>
									</td>
									<td class="tdEditLabel">Input Form</td>
									<td class="tdEditContent">
										<select name="fieldInputId">
											<c:forEach items="${fieldinputs }" var="fi">
												<option value="${fi.id }">${fi.name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table> <!-- 主输入域结束 -->
						</td>
					</tr>
				</tbody>
			</table>

			<table>
				<tr align="center">
					<td colspan="3" bgcolor="#EFF3F7">
						<input type="submit" name="saveButton" class="MyButton" value="Save Form Filed Info"> 
						<input type="button" class="MyButton" value="Close Window" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>