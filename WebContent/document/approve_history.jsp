<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Document Approve History</title>
</head>
<body>
<!--  
	<logic:empty name="historys">
		No Approve History Records!
	</logic:empty>
	<logic:notEmpty name="historys">
		<logic:iterate id="history" name="historys">
			<hr>
		Approver:<c:out value="${history.approver.person.name }" />
			<br>
		Approve Time:<c:out value="${history.approveTime }" />
			<br>
		Approve Command:<c:out value="${history.comment }" />
			<br>
			<br>
		</logic:iterate>
	</logic:notEmpty>
	-->
	<c:if test="${empty historys}">
		No Approve History Records!
	</c:if>
	<c:if test="${!empty historys}">
		<c:forEach items="${historys}" var="history" >
			<hr>
		Approver:${history.approver.username}
			<br>
		Approve Time:${history.approveTime}
			<br>
		Approve Command:${history.comment}
			<br>
			<br>
		</c:forEach>
	</c:if>
</body>
</html>