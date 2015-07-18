<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Set Role to User</title>
</head>
<body>
	<center>
		<form action="add_userRole.action" method="post">
			<input type="hidden" name="id" value="${id}">
			<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
				<tbody>
					<tr>
						<!-- ��������ӡ��༭����ı��� -->
						<td align="center" class="tdEditTitle">Set Role to User</td>
					</tr>
					<tr>
						<td>
							<!-- ��������ʼ -->
							<table width="100%" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
								<!-- �б������ -->
								<tr bgcolor="#EFF3F7" class="tableBody1">
									<td width="20%" height="37" align="center"><b>Select</b></td>
									<td width="80%" height="37" align="center"><b>Role Name</b></td>
								</tr>
								<!-- �б������� -->
								<c:if test="${!empty pm.list}">
									<c:forEach items="${pm.list }" var="role">
										<tr bgcolor="#EFF3F7" class="tableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
											<td align="center" vAlign="middle">
												<input type="radio" name="roleId" value="${role.id }">
											</td>
											<td align="center" vAlign="middle">${role.name }</td>
										</tr>
									</c:forEach>
								</c:if>
								<!-- ���б�����Ϊ�յ�ʱ��Ҫ��ʾ����ʾ��Ϣ -->
								<c:if test="${empty pm.list}">
									<tr>
										<td colspan="7" align="center" bgcolor="#EFF3F7" class="tableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
											No Related Records
										</td>
									</tr>
								</c:if>
							</table>
							<table width="100%" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="FONT-SIZE: 10pt">
								<tbody>
									<tr>
										<td height=28 align=left vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- ��������������ҳ������ -->
											���ȼ���<input type="text" name="orderNum">
										</td>
									</tr>
								</tbody>
							</table> <!-- ����������� -->
						</td>
					</tr>
				</tbody>
			</table>

			<table>
				<tr align="center">
					<td colspan="3" bgcolor="#EFF3F7">
						<input type="submit" name="saveButton" class="MyButton" value="Distribute Role"> 
						<input type="button" class="MyButton" value="Close Window" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>