<%@ page language="java" contentType="text/html; charset=Gb18030" pageEncoding="Gb18030"%>
<%@include file="/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Gb18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Staff Manage</title>
</head>
<body bgColor=#dee7ff leftMargin=0 background="" topMargin=0 marginheight="0" marginwidth="0">

	<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff bgColor=#dee7ff style="font-SIZE: 10pt">
		<tbody>
			<tr height=35>
				<td align="center" width=20 background=images/title_left.gif bgColor=#dee7ff></td>
				<td align="center" width=120 background=images/title_left.gif bgColor=#dee7ff>
					<font color=#f7f7f7> Staff Manage
						<font color="#FFFFFF">&nbsp;</font>
					</font>
				</td>
				<td align="center" width=11 background=images/title_middle.gif bgColor=#dee7ff><font color=#f7f7f7>&nbsp;</font></td>
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
					<%
						/**
						 * 在这里定义“添加”，“查询”等按钮
						 * <input type="image" name="find" value="find" src="images/cz.gif">
						 * &nbsp;&nbsp;&nbsp;&nbsp; 
						 * <a href="#" onClick="openWin('document.do?method=addInput','470')">
						 * <img src="images/addpic.gif" border=0 align=absMiddle style="CURSOR: hand"></a>
						 */
					%> 
					<a href="#" onclick="openWin('toAdd.action','addperson',600,200);">Add Staff Info</a>
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
			<td width="18%" height="37" align="center"><b>Name</b></td>
			<td width="18%" height="37" align="center"><b>Gender</b></td>
			<td width="18%" height="37" align="center"><b>Title</b></td>
			<td width="18%" height="37" align="center"><b>Telephone</b></td>
			<td width="18%" height="37" align="center"><b>Institution</b></td>
			<td width="5%" height="37" align="center"><b>Operation</b></td>
		</tr>
		<!-- 列表数据栏 -->
		<c:if test="${!empty pm.list}">
			<c:forEach items="${pm.list }" var="person">
				<tr bgcolor="#EFF3F7" class="tablebody1"
					onmouseover="this.bgColor = '#DEE7FF';"
					onmouseout="this.bgColor='#EFF3F7';">
					<td align="center" vAlign="middle">${person.id }</td>
					<td align="center" vAlign="middle">${person.name }</td>
					<td align="center" vAlign="middle">${person.sex }</td>
					<td align="center" vAlign="middle">${person.duty }</td>
					<td align="center" vAlign="middle">${person.phone }</td>
					<td align="center" vAlign="middle">${person.org.name }</td>
					<!-- 
					<c:if test="$ {my:method(login.id, 'person', 3) }">
						<td align="center" vAlign="middle">
							<a href="#" onclick="del('delPerson.action?id=${person.id }');">Delete</a>
						</td>
					</c:if>
					 -->
					 <td align="center" vAlign="middle">
						<a href="#" onclick="del('delPerson.action?id=${person.id }');">Delete</a>
					 </td>
				</tr>
			</c:forEach>
		</c:if>
		<!-- 在列表数据为空的时候，要显示的提示信息 -->
		<c:if test="${empty pm.list}">
			<tr>
				<td colspan="7" align="center" bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
					No related operation
				</td>
			</tr>
		</c:if>
	</table>
	<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="font-SIZE: 10pt">
		<tbody>
			<tr>
				<td height=28 align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- 可以在这里插入分页导航条 -->
					<pg:pager items="${pm.total }" url="person.action" export="currentPageNumber=pageNumber" maxPageItems="2">
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
