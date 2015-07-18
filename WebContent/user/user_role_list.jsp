<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>User��${user.person.name }��Have Roles</title>
</head>
<body>
	<center>
		<table class="tableEdit" border="0" cellspacing="1" cellpadding="0"
			style="width: 580px;">
			<tbody>
				<tr>
					<!-- ��������ӡ��༭����ı��� -->
					<td align="center" class="tdEditTitle">
						User��${user.person.name }��Have Roles
					</td>
				</tr>
				<tr>
					<td>
						<!-- ��������ʼ -->
						<table width="100%" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="FONT-SIZE: 10pt">
							<tbody>
								<tr>
									<td width="82%" height=14 align=right vAlign="middle" noWrap></td>
									<td width="18%" align=right vAlign="middle" noWrap></td>
								</tr>
								<tr>
									<td height=14 align=right vAlign="middle" noWrap>
										<!-- ����������ѯ�� -->
									</td>
									<td height=14 align="left" vAlign="middle" noWrap>
										<a href="#" onclick="openWin('toUserRole.action?id=${user.id }','userRoleInput',600,200);">Distribute Role to User</a>
									</td>
								</tr>
								<tr>
									<td height=28 colspan="2" align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- ��������������ҳ������ -->
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
							<!-- �б������ -->
							<tr bgcolor="#EFF3F7" class="tableBody1">
								<td width="33%" height="37" align="center"><b>Role Name</b></td>
								<td width="33%" height="37" align="center"><b>���ȼ�</b></td>
								<td width="34%" height="37" align="center"><b>Operation</b></td>
							</tr>
							<!-- �б������� -->
							<c:if test="${!empty urs}">
								<c:forEach items="${urs }" var="ur">
									<tr bgcolor="#EFF3F7" class="tableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
										<td align="center" vAlign="middle">${ur.role.name }</td>
										<td align="center" vAlign="middle">${ur.orderNum }</td>
										<td align="center" vAlign="middle">
											<a href="#" onclick="del('del_userRole.action?id=${ur.user.id }&roleId=${ur.role.id}');">Delete Relevance</a>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- ���б�����Ϊ�յ�ʱ��Ҫ��ʾ����ʾ��Ϣ -->
							<c:if test="${empty urs}">
								<tr>
									<td colspan="7" align="center" bgcolor="#EFF3F7" class="tableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
										No Related Records
									</td>
								</tr>
							</c:if>
						</table> <!-- ����������� -->
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