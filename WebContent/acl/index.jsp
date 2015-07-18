<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link href="style/oa.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/public.js"></script>
<script type='text/javascript' src='dwr/interface/aclManager.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript">
	/*
	function invoke(){
		aclManager.method(function(data){
			alert(data);
		});
	}
	*/
	
	/*
	function addOrModifyPermission(field){
		aclManager.addOrModifyPermission("${type}", ${sn}, field.getAttribute("resourceSn"), field.getAttribute("permission"), field.checked);
	}
	*/
	
	//授权
	function addOrModifyPermission(field) {
	
		//如果被选择上，则同时选择"继承"和启用
		if(field.checked) {
			$(field.getAttribute("resourceSn")+"_USE").checked = true;
			
			<c:if test="${type eq 'User'}">
				$(field.getAttribute("resourceSn")+"_EXT").checked = true;
			</c:if>
			
		}
	
		aclManager.addOrModifyPermission(
									"${type}", 
									${sn}, 
									field.getAttribute("resourceSn"), 
									field.getAttribute("permission"), 
									field.checked
									);
	}
	
	//设置用户的继承特性
	function addOrModifyUserExtends(field) {
		aclManager.addOrModifyUserExtends(
									${sn}, 
									field.getAttribute("resourceSn"),
									field.checked
									);
	}
	
	//点击启用checkbox
	function usePermission(field){
		//如果checkbox被选中，意味着需要更新ACL的状态
		
		//设置同步，依次执行
		dwr.engine.setAsync(false);
		
		if(field.checked) {
			//更新C/R/U/D状态
			addOrModifyPermission($(field.getAttribute("resourceSn")+"_C"));
			addOrModifyPermission($(field.getAttribute("resourceSn")+"_R"));
			addOrModifyPermission($(field.getAttribute("resourceSn")+"_U"));
			addOrModifyPermission($(field.getAttribute("resourceSn")+"_D"));
			
			//更新EXT状态
			<c:if test="${type eq 'User'}">
				addOrModifyUserExtends($(field.getAttribute("resourceSn")+"_EXT"));
			</c:if>
		} else {
			aclManager.deletePermission(
									"${type}", 
									${sn},
									field.getAttribute("resourceSn")
									);
			$(field.getAttribute("resourceSn")+"_C").checked = false;
			$(field.getAttribute("resourceSn")+"_R").checked = false;
			$(field.getAttribute("resourceSn")+"_U").checked = false;
			$(field.getAttribute("resourceSn")+"_D").checked = false;
			
			<c:if test="${type eq 'User' }">
				$(field.getAttribute("resourceSn")+"_EXT").checked = false;
			</c:if>
		}
	}
	
	//初始化表格
	function initTable() {
		aclManager.searchAclRecord(
									"${type}", 
									${sn}, 
									function(data){
										for(var i=0;i<data.length;i++){
											var resourceSn = data[i][0];
											var cState = data[i][1];
											var rState = data[i][2];
											var uState = data[i][3];
											var dState = data[i][4];
											var extState = data[i][5];
											
											$(resourceSn+"_C").checked = cState == 0 ? false : true;
											$(resourceSn+"_R").checked = rState == 0 ? false : true;
											$(resourceSn+"_U").checked = uState == 0 ? false : true;
											$(resourceSn+"_D").checked = dState == 0 ? false : true;
											
											<c:if test="${type eq 'User' }">
												$(resourceSn+"_EXT").checked = extState == 0 ? false : true;
											</c:if>
											
											$(resourceSn+"_USE").checked = true;
										}
									});
	}
</script>

<c:choose>
	<c:when test="${type eq 'Role'}">
		<c:set var="title" value="Set Authority to Role【${role.name}】"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="title" value="Please Set Authority to User【${user.username}】"></c:set>
	</c:otherwise>
</c:choose>
<title>${title }</title>
</head>
<body onload="initTable()">
	<!-- 
	<input type="button" value="Test" onclick="invoke()"/>
	 -->
	<center>
		<table class="tableEdit" border="0" cellspacing="1" cellpadding="0" style="width: 580px;">
			<tbody>
				<tr>
					<!-- 这里是添加、编辑界面的标题 -->
					<td align="center" class="tdEditTitle">${title }</td>
				</tr>
				<tr>
					<td>
						<!-- 主输入域开始 -->

						<table class="tableEdit" style="width: 580px;" cellspacing="0" border="0" cellpadding="0">
							<tr>
								<td class="tdEditLabel">Top Level Module</td>
								<td class="tdEditContent">Second Level Module</td>
								<td class="tdEditLabel">Authority</td>
								<c:if test="${type eq 'User'}">
									<td class="tdEditLabel">Extends</td>
								</c:if>
								<td class="tdEditLabel">Start Using</td>

							</tr>
							<!-- 输出模块树 -->
							<c:forEach items="${modules}" var="module">
								<tr>
									<td>${module.name }</td>
									<td></td>
									<td>
										<input type="checkbox" id="${module.id }_C" onclick="addOrModifyPermission(this)" resourceSn="${module.id }" permission="0">C 
										<input type="checkbox" id="${module.id }_R" onclick="addOrModifyPermission(this)" resourceSn="${module.id }" permission="1">R 
										<input type="checkbox" id="${module.id }_U" onclick="addOrModifyPermission(this)" resourceSn="${module.id }" permission="2">U 
										<input type="checkbox" id="${module.id }_D" onclick="addOrModifyPermission(this)" resourceSn="${module.id }" permission="3">D
									</td>
									<c:if test="${type eq 'User'}">
										<td>
											<input type="checkbox" id="${module.id }_EXT" onclick="addOrModifyUserExtends(this)" resourceSn="${module.id }">
										</td>
									</c:if>
									<td>
										<input type="checkbox" id="${module.id }_USE" onclick="usePermission(this)" resourceSn="${module.id }">
									</td>
								</tr>
								<c:forEach items="${module.children}" var="child">
									<tr>
										<td></td>
										<td>${child.name }</td>
										<td>
											<input type="checkbox" id="${child.id }_C" onclick="addOrModifyPermission(this)" resourceSn="${child.id }" permission="0">C 
											<input type="checkbox" id="${child.id }_R" onclick="addOrModifyPermission(this)" resourceSn="${child.id }" permission="1">R 
											<input type="checkbox" id="${child.id }_U" onclick="addOrModifyPermission(this)" resourceSn="${child.id }" permission="2">U 
											<input type="checkbox" id="${child.id }_D" onclick="addOrModifyPermission(this)" resourceSn="${child.id }" permission="3">D
										</td>
										<c:if test="${type eq 'User'}">
											<td>
												<input type="checkbox" id="${child.id }_EXT" onclick="addOrModifyUserExtends(this)" resourceSn="${child.id }">
											</td>
										</c:if>
										<td>
											<input type="checkbox" id="${child.id }_USE" onclick="usePermission(this)" resourceSn="${child.id }">
										</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</table> <!-- 主输入域结束 -->
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