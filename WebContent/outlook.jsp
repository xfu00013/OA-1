<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ include file="/common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;CHARSET=GBK">
<title>Outlook Like Bar</title>

<!--
  you need this style or you will get an error in ns4 on first page load!
-->
<style>
div {
	position: absolute;
}
</style>

<script type="text/javascript" src="script/crossbrowser.js"
	type="text/javascript">
</script>
<script type="text/javascript" src="script/outlook.js"
	type="text/javascript">
</script>

<script>
	// ---------------------------------------------------------------------------
	// Example of howto: use OutlookBar
	// ---------------------------------------------------------------------------

	//create OutlookBar
	var o = new createOutlookBar('Bar', 0, 0, screenSize.width,
			screenSize.height, '#969696', 'white');//'#000099') // OutlookBar
	var p;

	//create first panel
	p = new createPanel('al', 'Institution');
	p.addButton('images/netm.gif', 'Institution Manage', 'parent.main.location="org.action"');
	p.addButton('images/news.gif', 'Staff Manage','parent.main.location="person.action"');
	o.addPanel(p);

	p = new createPanel('p', 'Authority Manage');
	p.addButton('images/mail.gif', 'Module Manage', 'parent.main.location="module.action"');
	p.addButton('images/peditor.gif', 'Role Manage', 'parent.main.location="role.action"');
	p.addButton('images/word.gif', 'User Manage', 'parent.main.location="user.action"');
	p.addButton('images/news.gif', 'Adresse', 'alert("Adresse")');
	p.addButton('images/mail.gif', 'Postausgang', 'alert("Postausgang")');
	p.addButton('images/mail.gif', 'Posteingang', 'alert("Posteingang")');
	p.addButton('images/news.gif', 'Information aus<BR>erster Hand','alert("Infos")');
	p.addButton('images/peditor.gif', 'Gelbe Post', 'alert("Gelbe Post")');
	p.addButton('images/word.gif', 'Schreiben', 'alert("Schreiben")');
	o.addPanel(p);

	p = new createPanel('workflow', 'Work Flow');
	p.addButton('images/netm.gif', 'Flow Manage', 'parent.main.location="workflow.action"');
	p.addButton('images/netm.gif', 'Form Definition', 'parent.main.location="workflow.action?formdef=true"');
	o.addPanel(p);

	p = new createPanel('document', 'Document Manage');
	p.addButton('images/netm.gif', 'Document Maintain', 'parent.main.location="document.action"');
	p.addButton('images/netm.gif', 'File Dispose', 'parent.main.location="searchAllFinishedDocuments.action"');
	o.addPanel(p);

	o.draw(); //draw the OutlookBar

	//-----------------------------------------------------------------------------
	//functions to manage window resize
	//-----------------------------------------------------------------------------
	//resize OP5 (test screenSize every 100ms)
	function resize_op5() {
		if (bt.op5) {
			o.showPanel(o.aktPanel);
			var s = new createPageSize();
			if ((screenSize.width != s.width)
					|| (screenSize.height != s.height)) {
				screenSize = new createPageSize();
				//need setTimeout or resize on window-maximize will not work correct!
				//benötige das setTimeout oder das Maximieren funktioniert nicht richtig
				setTimeout("o.resize(0,0,screenSize.width,screenSize.height)",
						100);
			}
			setTimeout("resize_op5()", 100);
		}
	}

	//resize IE & NS (onResize event!)
	function myOnResize() {
		if (bt.ie4 || bt.ie5 || bt.ns5) {
			var s = new createPageSize();
			o.resize(0, 0, s.width, s.height);
		} else if (bt.ns4)
			location.reload();
	}
</script>

</head>
<!-- need an onResize event to redraw outlookbar after pagesize changes! -->
<!-- OP5 does not support onResize event! use setTimeout every 100ms -->
<body onLoad="resize_op5();" onResize="myOnResize();">
</body>
</html>


