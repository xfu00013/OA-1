<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script/public.js"></script>
<title>Add Staff Info</title>
</head>
<body>
	<center>
		<form action="addPerson.action" method="post">
			<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
				<tbody>
					<tr>
						<!-- ��������ӡ��༭����ı��� -->
						<td align="center" class="tdEditTitle">Add Staff Info</TD>
					</tr>
					<tr>
						<td>
							<!-- ��������ʼ -->

							<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
								<tr>
									<td class="tdEditLabel">Name</td>
									<td class="tdEditContent">
										<input type="text" name="name">
									</td>
									<td class="tdEditLabel">Gender</td>
									<td class="tdEditContent">
										<input type="radio" name="sex" value="MAN"/>Man
										<input type="radio" name="sex" value="WOMAN"/>Woman
									</td>
								</tr>
								<tr>
									<td class="tdEditLabel">Institution</td>
									<td class="tdEditContent" colspan="3" style="width: 400px; text-align: left"> 
										&nbsp;&nbsp;&nbsp; 
										<input type="hidden" name="orgId" id="orgIdId"> 
										<input type="text" name="orgName" disabled="disabled" id="orgNameId"> 
										<input type="button" name="selectOrgButton" value="select institution" onclick="openWin('org.action?select=true','selectorg',800,500,1)">
									</td>
								</tr>
								<tr>
									<td class="tdEditLabel">Title</td>
									<td class="tdEditContent">
										<input type="text" name="duty">
									</td>
									<td class="tdEditLabel">Telephone</td>
									<td class="tdEditContent">
										<input type="text" name="phone">
									</td>
								</tr>
								<tr>
									<td class="tdEditLabel">Address</td>
									<td class="tdEditContent">
										<input type="text" name="address">
									</td>
									<td class="tdEditLabel">Description</td>
									<td class="tdEditContent">
										<input type="text" name="description">
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
						<input type="submit" name="saveButton" class="MyButton" value="Save Staff Info">
						<input type="button" class="MyButton" value="Close Window" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>