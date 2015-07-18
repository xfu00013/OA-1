<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Modify User Account Info</title>
</head>
<body>
	<center>
		<form action="modify_user.action" method="post">
			<input type="hidden" name="id" value="<%=Integer.parseInt(request.getParameter("userId"))%>">
			<input type="hidden" name="personId" value="<%=Integer.parseInt(request.getParameter("personId"))%>">
			<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
				<tbody>
					<tr>
						<!-- 这里是添加、编辑界面的标题 -->
						<td align="center" class="tdEditTitle">Modify User Account Info</td>
					</tr>
					<tr>
						<td>
							<!-- 主输入域开始 -->
							<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
								<tr>
									<td class="tdEditLabel">User Account</td>
									<td class="tdEditContent">
										<input type="text" name="username" value="${user.username }">
									</td>
									<td class="tdEditLabel">Login Password</td>
									<td class="tdEditContent">
										<input type="text" name="password" value="${user.password }">
									</td>
								</tr>
								<tr>
									<td class="tdEditLabel">Expire Time</td>
									<td class="tdEditContent">
										<input type="text" name="expireTime" value="<fmt:formatDate value="${user.expireTime }" pattern="yyyy-MM-dd"/>">
									</td>
									<td class="tdEditLabel"></td>
									<td class="tdEditContent"></td>
								</tr>
							</table> <!-- 主输入域结束 -->
						</td>
					</tr>
				</tbody>
			</table>

			<table>
				<tr align="center">
					<td colspan="3" bgcolor="#EFF3F7">
						<input type="submit" name="saveButton" class="MyButton" value="Update User Account"> 
						<input type="button" class="MyButton" value="Close Window" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>