<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/public.js"></script>
<title>Work Flow Manage</title>

</head>
<body bgColor=#dee7ff leftMargin=0 background="" topMargin=0 marginheight="0" marginwidth="0">
		<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff bgColor=#dee7ff style="font-SIZE: 10pt">
			<tbody>
				<tr height=35>
					<td align=middle width=20 background=images/title_left.gif bgColor=#dee7ff></td>
					<td align=middle width=120 background=images/title_left.gif bgColor=#dee7ff>
						<font color=#f7f7f7>Work Flow Manage
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
					</td>
					<td height=14 align="left" vAlign=center noWrap></td>
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
				<td width="50%" height="37" align="center"><b>Flow Name</b></td>
				<td width="50%" height="37" align="center"><b>Operation</b></td>
			</tr>
			<!-- 列表数据栏 -->
			<c:if test="${!empty workflows}">
				<c:forEach items="${workflows}" var="workflow">
					<tr bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
						<td align="center" vAlign="center">
							<a href="openViewImage.action?id=${workflow.id }" target="_blank">${workflow.name }</a>
						</td>
						<td align="center" vAlign="center">
							<a href="#" onclick="del('delete_workflow.action?id=${workflow.id}');">Delete</a><br/>
							<a href="#" onclick="openWin('flowform.action?workflowId=${workflow.id }','flowform',600,500)">Define Form</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty workflows}">
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

		<form action="add_workflow.action" method="post" enctype="multipart/form-data">
			<table class="tableEdit" border="0" align=center cellspacing="1" cellpadding="0" style="width: 580px;">
				<tbody>
					<tr>
						<!-- 这里是添加、编辑界面的标题 -->
						<td align="center" class="tdEditTitle">Add or Re-upload Flow Definition File and Image</td>
					</tr>
					<tr>
						<td>
							<!-- 主输入域开始 --> 
							<input type="hidden" name="method" value="add">
							<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
								<tr>
									<td>Flow Definition File</td>
									<td>
										<input type="file" name="processDefinition">
									</td>
								</tr>
								<tr>
									<td>Flow Definition Image</td>
									<td>
										<input type="file" name="processImage">
									</td>
								</tr>
								<tr align="center">
									<td colspan="3" bgcolor="#EFF3F7">
										<input type="submit" name="saveButton" class="MyButton" value="Upload">
									</td>
								</tr>
							</table> <!-- 主输入域结束 -->
						</td>
					</tr>
				</tbody>
			</table>
		</form>

</body>

</html>
