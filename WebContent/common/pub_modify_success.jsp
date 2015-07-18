<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Update record success</title>
<script type="text/javascript">
function closewindow(){
	if(window.opener){
		window.opener.location.reload(true);
		window.close();
	}
}
function clock(){
	i = i -1;
	if(document.getElementById("info")){
		document.getElementById("info").innerHTML = "Window Close Auto Within "+i+" Seconds";
	}
	if(i > 0)
		setTimeout("clock();",1000);
	else
		closewindow();
}

var i = 4;
clock();

</script>
</head>
<body>
<center>
	Update Record Success!<p>
	<div id="info">Window Close Auto Within 3 Seconds</div>
	<input type="button" value="Close Window" onclick="closewindow();">
</center>
</body>
</html>