<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/public.js"></script>
<title>Role Manage</title>
</head>
<body bgColor=#dee7ff leftMargin=0 background="" topMargin=0 marginheight="0" marginwidth="0">
	<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff bgColor=#dee7ff style="font-SIZE: 10pt">
		<tbody>
			<tr height=35>
				<td align="center" width=20 background=images/title_left.gif bgColor=#dee7ff></td>
				<td align="center" width=120 background=images/title_left.gif bgColor=#dee7ff>
					<font color=#f7f7f7> Role Manage
						<font color="#FFFFFF">&nbsp;</font>
					</font></td>
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
					<!-- 在这里插入查询表单 -->
				</td>
				<td height=14 align="left" vAlign="middle" noWrap>
					<a href="#" onclick="openWin('role/add_input.jsp','addOrg',600,200);">Add Role Info</a>
				</td>
			</tr>
			<tr>
				<td height=28 colspan="2" align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- 可以在这里插入分页导航条 -->
				</td>
			</tr>
		</tbody>
	</table>
	<table width="778" border="0" align=center cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
		<!-- 列表标题栏 -->
		<tr bgcolor="#EFF3F7" class="tablebody1">
			<td width="5%" height="37" align="center"><b>No.</b></td>
			<td width="18%" height="37" align="center"><b>Role Name</b></td>
			<td width="18%" height="37" align="center"><b>Related Operation</b></td>
		</tr>
		<!-- 列表数据栏 -->
		<c:if test="${!empty pm.list}">
			<c:forEach items="${pm.list }" var="role">
				<tr bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
					<td align="center" vAlign="middle">${role.id }</td>
					<td align="center" vAlign="middle">${role.name }</td>
					<td align="center" vAlign="middle">
						<a href="#" onclick="del('del_role.action?id=${role.id }');">Delete</a><br/>
						<a href="#" onclick="openWin('acl.action?principalType=Role&principalSn=${role.id }','RoleAuth',600,500,1);">Set Authority to Role</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<!-- 在列表数据为空的时候，要显示的提示信息 -->
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
				<td height=28 align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- 可以在这里插入分页导航条 -->
					<pg:pager url="role.action" items="${pm.total }" export="currentPageNumber=pageNumber" maxPageItems="2" isOffset="true">
						<pg:first>
							<a href="${pageUrl}">Top</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }">Previous</a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber }">
									<font color="red">${pageNumber }</font>
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
