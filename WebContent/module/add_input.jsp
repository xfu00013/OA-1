<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Add Module Info</title>
</head>
<body>
	<center>
		<form action="add_module.action" method="post">
			<input type="hidden" name="parentId" value="<%=Integer.parseInt(request.getParameter("parentId"))%>">
			<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
				<tbody>
					<tr>
						<!-- ��������ӡ��༭����ı��� -->
						<td align="center" class="tdEditTitle">Add Module Info</td>
					</tr>
					<tr>
						<td>
							<!-- ��������ʼ -->
							<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
								<tr>
									<td class="tdEditLabel">Module Name</td>
									<td class="tdEditContent">
										<input type="text" name="name">
									</td>
									<td class="tdEditLabel">Module Description</td>
									<td class="tdEditContent">
										<input type="text" name="sn">
									</td>
								</tr>
								<tr>
									<td class="tdEditLabel">�����</td>
									<td class="tdEditContent">
										<input type="text" name="orderNum">
									</td>
									<td class="tdEditLabel">Module Address</td>
									<td class="tdEditContent">
										<input type="text" name="url">
									</td>
								</tr>
							</table> <!-- ����������� -->
						</td>
					</tr>
				</tbody>
			</table>

			<table>
				<tr align="center">
					<td colspan="3" bgcolor="#EFF3F7">
						<input type="submit" name="saveButton" class="MyButton" value="Save Module Info"> 
						<input type="button" class="MyButton" value="Close Window" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>