<%@ page language="java" contentType="text/html; charset=Gb18030" pageEncoding="Gb18030"%>
<%@ include file="/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Gb18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/public.js"></script>
<title>Approving Document Manage</title>
</head>
<body bgColor=#dee7ff leftMargin=0 background="" topMargin=0 marginheight="0" marginwidth="0">
	<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff bgColor=#dee7ff style="font-SIZE: 10pt">
		<tbody>
			<tr height=35>
				<td align=middle width=20 background=images/title_left.gif bgColor=#dee7ff></td>
				<td align=middle width=120 background=images/title_left.gif bgColor=#dee7ff>
					<font color=#f7f7f7> Approving Document Manage
						<font color="#FFFFFF">&nbsp;</font>
					</font>
				</td>
				<td align=middle width=11 background=images/title_middle.gif bgColor=#dee7ff>
					<font color=#f7f7f7>&nbsp;</font>
				</td>
				<td align=middle background=images/title_right.gif bgColor=#dee7ff>
					<font color=#f7f7f7>&nbsp;</font>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="font-SIZE: 10pt">
		<tbody>
			<tr>
				<td width="82%" height=14 align=right vAlign=center noWrap></td>
				<td width="18%" align=right vAlign=center noWrap></td>
			</tr>
			<tr>
				<td height=14 align=right vAlign=center noWrap>
					<!-- 在这里插入查询表单 --> 
					<a href="document.action">My Document</a> 【Approving Document】 
					<a href="approved_list.action">Approved Document</a>
				</td>
				<td height=14 align="left" vAlign=center noWrap>
					<%
						/**
						 * 在这里定义“添加”，“查询”等按钮
						 * <input type="image" name="find" value="find" src="images/cz.gif">
						 * &nbsp;&nbsp;&nbsp;&nbsp; 
						 * <a href="#" onClick="openWin('document.do?method=addInput','470')">
						 * <img src="images/addpic.gif" border=0 align=absMiddle style="CURSOR: hand"></a>
						 */
					%>
				</td>
			</tr>
			<tr>
				<td height=28 colspan="2" align=right vAlign=center noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- 可以在这里插入分页导航条 -->
				</td>
			</tr>
		</tbody>
	</table>
	<table width="778" border="0" align=center cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
		<!-- 列表标题栏 -->
		<tr bgcolor="#EFF3F7" class="tablebody1">
			<td width="15%" height="37" align="center"><b>Document Name</b></td>
			<td width="15%" height="37" align="center"><b>Document Description</b></td>
			<td width="15%" height="37" align="center"><b>Create Time</b></td>
			<td width="15%" height="37" align="center"><b>Document State</b></td>
			<td width="8%" height="37" align="center"><b>Flow Name</b></td>
			<td width="7%" height="37" align="center"><b>Assignment</b></td>
			<td width="15%" height="37" align="center"><b>Approve History</b></td>
			<td width="10%" align="center"><b>Operation</b></td>
		</tr>
		<!-- 列表数据栏 -->
		<c:if test="${!empty documents}">
			<c:forEach items="${documents }" var="document">
				<tr bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
					<td align="center" vAlign="center">${document.title}</td>
					<td align="center" vAlign="center">${document.description }</td>
					<td align="center" vAlign="center">${document.createTime }</td>
					<td align="center" vAlign="center">${document.status }</td>
					<td align="center" vAlign="center">${document.workflow.name}</td>
					<td align="center" vAlign="center">
						<c:if test="${!empty document.content }">
							<a href="download.action?id=${document.id}">Download</a>
						</c:if></td>
					<td align="center" vAlign="center">
						<a href="#" onclick="openWin('approve_history.action?&id=${document.id}')">View</a>
					</td>
					<td align="center" vAlign="center">
						<a href="#" onclick="openWin('approve_input.action?id=${document.id}')">Approve</a>
						<a href="#" onclick="openWin('submit_input.action?id=${document.id}')">Submit</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<!-- 在列表数据为空的时候，要显示的提示信息 -->
		<c:if test="${empty documents}">
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
				<td height=28 align=right vAlign=center noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- 可以在这里插入分页导航条 -->
				</td>
			</tr>
		</tbody>
	</table>
</body>

</html>
