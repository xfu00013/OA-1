<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/public.js"></script>
<title>Select Document to Add</title>
</head>
<body>
	<center>
		<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
			<tbody>
				<tr>
					<!-- 这里是添加、编辑界面的标题 -->
					<td align="center" class="tdEditTitle">Select Document to Add</td>
				</tr>
				<tr>
					<td>
						<!-- 主输入域开始 --> 
						<c:forEach items="${workflows }" var="flow">
							<a href="add_document.action?workflowId=${flow.id }">${flow.name}</a> &nbsp;
						</c:forEach> <!-- 主输入域结束 -->
					</td>
				</tr>
			</tbody>
		</table>
		<table>
			<tr align="center">
				<td colspan="3" bgcolor="#EFF3F7">
					<input type="button" class="MyButton" value="Close Window" onclick="window.close()">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>