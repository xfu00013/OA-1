<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@include file="/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Please select institution</title>
<script type="text/javascript">
	function selectOrg(id, name) {
		if (window.opener) {
			window.opener.document.all.orgIdId.value = id;
			window.opener.document.all.orgNameId.value = name;
			window.close();
		}
	}
</script>
</head>
<body bgColor=#dee7ff leftMargin=0 background="" topMargin=0 marginheight="0" marginwidth="0">

	<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
		<tbody>
			<tr>
				<!-- ��������ӡ��༭����ı��� -->
				<td align="center" class="tdEditTitle">Please select institution</td>
			</tr>
			<tr>
				<td>
					<!-- ��������ʼ -->
					<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="FONT-SIZE: 10pt">
						<tbody>
							<tr>
								<td width="82%" height=14 align=right vAlign="middle" noWrap>
								</td>
								<td width="18%" align=right vAlign="middle" noWrap></td>
							</tr>
							<tr>
								<td height=14 align=right vAlign="middle" noWrap>
									<!-- ����������ѯ�� -->
								</td>
								<td height=14 align="left" vAlign="middle" noWrap>
									<%
										/**
										 * �����ﶨ�塰��ӡ�������ѯ���Ȱ�ť
										 * <input type="image" name="find" value="find" src="images/cz.gif">
										 * &nbsp;&nbsp;&nbsp;&nbsp; 
										 * <a href="#" onClick="openWin('document.do?method=addInput','470')">
										 * <img src="images/addpic.gif" border=0 align=absMiddle style="CURSOR: hand"></a>
										 */
									%> 
									<!-- 
									<a href="org.action?parentId=${ppid } & select=true">Back</a>
									 -->
									<a href="javascript:" onclick="history.go(-1); return false">Back</a>
								</td>
							</tr>
							<tr>
								<td height=28 colspan="2" align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- ��������������ҳ������ -->
								</td>
							</tr>
						</tbody>
					</table>
					<table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
						<!-- �б������ -->
						<tr bgcolor="#EFF3F7" class="tablebody1">
							<td width="5%" height="37" align="center"><b></b></td>
							<td width="5%" height="37" align="center"><b>No.</b></td>
							<td width="30%" height="37" align="center"><b>Institution Name</b></td>
							<td width="30%" height="37" align="center"><b>Institution Identifier</b></td>
							<td width="30%" height="37" align="center"><b>Father Institution Name</b></td>
						</tr>
						<!-- �б������� -->
						<c:if test="${!empty pm.list}">
							<c:forEach items="${pm.list }" var="org">
								<tr bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
									<td align="center" vAlign="middle">
										<input type="radio" onclick="selectOrg('${org.id }','${org.name }')">
									</td>
									<td align="center" vAlign="middle">${org.id}</td>
									<td align="center" vAlign="middle">
										<a href="org.action?parentId=${org.id }&select=true">${org.name }</a>
									</td>
									<td align="center" vAlign="middle">${org.sn }</td>
									<td align="center" vAlign="middle">
										<c:if test="${!empty org.parent}">
											<c:out value="${org.parent.name}" />
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- ���б�����Ϊ�յ�ʱ��Ҫ��ʾ����ʾ��Ϣ -->
						<c:if test="${empty pm.list}">
							<tr>
								<td colspan="7" align="center" bgcolor="#EFF3F7" class="tablebody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
									No related operation
								</td>
							</tr>
						</c:if>
					</table>
					<table width="778" border=0 align=center cellPadding=0 cellSpacing=0 borderColor=#ffffff style="FONT-SIZE: 10pt">
						<tbody>
							<tr>
								<td height=28 align=right vAlign="middle" noWrap background=images/list_middle.jpg>&nbsp;&nbsp; <!-- ��������������ҳ������ -->
									<pg:pager items="${pm.total }" url="org.action" export="currentPageNumber=pageNumber" maxPageItems="2">
										<pg:param name="parentId" />
										<pg:param name="select" value="true" />
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
					</table> <!-- ����������� -->
				</td>
			</tr>
		</tbody>
	</table>





</body>

</html>
