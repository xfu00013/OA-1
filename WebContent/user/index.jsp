<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@include file="/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/public.js"></script>
<title>User Manage</title>
</head>
<body bgColor=#dee7ff leftMargin=0 background="" topMargin=0 marginheight="0" marginwidth="0">
		<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff bgColor=#dee7ff style="font-SIZE: 10pt">
			<tbody>
				<tr height=35>
					<td align="center" width=20 background=images/title_left.gif bgColor=#dee7ff></td>
					<td align="center" width=120 background=images/title_left.gif bgColor=#dee7ff>
						<font color=#f7f7f7> User Manage
							<font color="#FFFFFF">&nbsp;</font>
						</font>
					</td>
					<td align="center" width=11 background=images/title_middle.gif bgColor=#dee7ff>
						<font color=#f7f7f7>&nbsp;</font>
					</td>
					<td align="center" background=images/title_right.gif bgColor=#dee7ff>
						<font color=#f7f7f7>&nbsp;</font>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="font-SIZE: 10pt">
			<tbody>
				<tr>
					<td width="82%" height=14 align=right vAlign="middle" noWrap></td>
					<td width="18%" align=right vAlign="middle" noWrap></td>
				</tr>
				<tr>
					<td height=14 align=right vAlign="middle" noWrap>
						<!-- ����������ѯ�� -->
					</td>
					<td height=14 align="left" vAlign="middle" noWrap></td>
				</tr>
				<tr>
					<td height=28 colspan="2" align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- ��������������ҳ������ -->
					</td>
				</tr>
			</tbody>
		</table>
		<table width="778" border="0" align=center cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
			<!-- �б������ -->
			<tr bgcolor="#EFF3F7" class="tablebody1">
				<td width="5%" height="37" align="center"><b>No.</b></td>
				<td width="10%" height="37" align="center"><B>Name</B></td>
				<td width="10%" height="37" align="center"><b>Gender</b></td>
				<td width="10%" height="37" align="center"><b>Institution</b></td>
				<td width="10%" height="37" align="center"><b>Login Account</b></td>
				<td width="10%" height="37" align="center"><b>Expire Time</b></td>
				<td width="45%" height="37" align="center"><b>Operation</b></td>
			</tr>
			<!-- �б������� -->
			<c:if test="${!empty pm.list}">
				<c:forEach items="${pm.list }" var="person">
					<tr bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
						<td align="center" vAlign="middle">${person.id }</td>
						<td align="center" vAlign="middle">${person.name }</td>
						<td align="center" vAlign="middle">${person.sex }</td>
						<td align="center" vAlign="middle">${person.org.name }</td>
						<td align="center" vAlign="middle">${person.user.username }</td>
						<td align="center" vAlign="middle">
							<fmt:formatDate value="${person.user.expireTime }" pattern="yyyy-MM-dd" />
						</td>
						<td align="center" vAlign="middle">
							<a href="#" onclick="openWin('user/add_input.jsp?personId=${person.id }','assignUser',600,100);">Distribute Account${person.id}</a><br/> 
							<a href="#" onclick="del('del_user.action?id=${person.user.id }');">Delete Account</a><br/> 
							<a href="#" onclick="openWin('user/update_input.jsp?userId=${person.user.id }&personId=${person.id }','chgpsw',600,100);">Modify Account</a><br/> 
							<a href="#" onclick="openWin('userRole.action?id=${person.user.id }','assignRole',600,400);">Distribute Role</a><br/> 
							<a href="#" onclick="openWin('acl.action?principalType=User&principalSn=${person.user.id }','RoleAuth',600,500,1);">Set Authority to User</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- ���б�����Ϊ�յ�ʱ��Ҫ��ʾ����ʾ��Ϣ -->
			<c:if test="${empty pm.list}">
				<tr>
					<td colspan="7" align="center" bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
						No Related Records
					</td>
				</tr>
			</c:if>
		</table>
		<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="font-SIZE: 10pt">
			<tbody>
				<tr>
					<td height=28 align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- ��������������ҳ������ -->
						<pg:pager items="${pm.total }" url="user.action" export="currentPageNumber=pageNumber" maxPageItems="2">
							<pg:first>
								<a href="${pageUrl}">Top</a>
							</pg:first>
							<pg:prev>
								<a href="${pageUrl }">Previous</a>
							</pg:prev>
							<pg:pages>
								<c:choose>
									<c:when test="${ currentPageNumber eq pageNumber}">
										<font color="red">${pageNumber}</font>
									</c:when>
									<c:otherwise>
										<a href="${pageUrl }">${pageNumber }</a>
									</c:otherwise>
								</c:choose>
							</pg:pages>
							<pg:next>
								<a href="${pageUrl }">Next</a>
							</pg:next>
							<pg:last>
								<a href="${pageUrl }">Bottom</a>
							</pg:last>
						</pg:pager>
					</td>
				</tr>
			</tbody>
		</table>

</body>

</html>
