<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@include file="/common/common.jsp" %>
<html>
<!--
 ---------------------------------------------------------------------------
 this script is copyright (c) 2001 by Michael Wallner!
 http://www.wallner-software.com
 mailto:dhtml@wallner-software.com

 you may use this script on web pages of your own
 you must not remove this copyright note!

 This script featured on Dynamic Drive (http://www.dynamicdrive.com)
 Visit http://www.dynamicdrive.com for full source to this script and more
 ---------------------------------------------------------------------------
-->
<head>
<meta http-equiv="Content-Type" content="text/html;CHARSET=iso-8859-1">
<title>HowTo:</title>
</head>

<body leftmargin=10 topmargin=0 marginwidth=10 marginheight=0>
	<br />
	<b>HowTo:</b> build Outlook Like bar seen on left hand...
	<hr>
	<br />
	<br />
	<pre>
&lt;script language="JavaScript" src="crossbr/owser.js" type="text/javascript"&gt;
&lt;/script&gt;
&lt;script language="JavaScript" src="outlook.js" type="text/javascript"&gt;
&lt;/script&gt;

&lt;SCRIPT&gt;
<span style="color: darkgreen">
// ---------------------------------------------------------------------------
// Example of howto: use Outlook Like bar
// ---------------------------------------------------------------------------


  //create Outlookbar-Object:
  //              Name
  //              x-position
  //              y-Position
  //              width
  //              height
  //              background-color
  //              page background-color (needed for OP5)
  //(screenSize object is created by 'crossbr/owser.js')
  //
</span>
  var o = new createOutlookbar('bar',0,0,screenSize.width,screenSize.height,'#606060','white') // Outlookbar
  var p
<span style="color: darkgreen">
  //create first panel..</span>
  p = new createPanel('al','Anwendungen');
<span style="color: darkgreen">
  //add buttons:
  //             image name
  //             label text
  //             onClick JavaScript code
  //
</span>
  p.addbutton('netm.gif','Netmanage','alert("NetM")');
  p.addbutton('news.gif','News','alert("News")');
  p.addbutton('word.gif','Word','alert("Word")');
  p.addbutton('peditor.gif','Editor','alert("Editor")');
  p.addbutton('mail.gif','Mail','alert("Mail")');
  o.addPanel(p);
<span style="color: darkgreen">
  //create second panel...</span>
  p = new createPanel('p','Postfächer');
  p.addbutton('mail.gif','Mail 2','alert("Mail2")');
  p.addbutton('peditor.gif','Personal&lt;br/&gt;Editor','alert("Personal Editor")');
  p.addbutton('word.gif','Projekte','alert("Projekte")');
  p.addbutton('news.gif','Adresse','alert("Adresse")');
  p.addbutton('mail.gif','Postausgang','alert("Postausgang")');
  p.addbutton('mail.gif','Posteingang','alert("Posteingang")');
  p.addbutton('news.gif','Information aus&lt;br/&gt;erster Hand','alert("Infos")');
  p.addbutton('peditor.gif','Gelbe Post','alert("Gelbe Post")');
  p.addbutton('word.gif','Schreiben','alert("Schreiben")');
  o.addPanel(p);
<span style="color: darkgreen">
  //create two empty panels...</span>
  p = new createPanel('l','Leeres Panel');
  o.addPanel(p);

  p = new createPanel('l2','Leeres Panel 2');
  o.addPanel(p);

  o.draw();         <span style="color: darkgreen">//draw the Outlook Like bar!</span>

<span style="color: darkgreen">
//-----------------------------------------------------------------------------
//functions to manage window resize
//-----------------------------------------------------------------------------
//resize OP5 (test screenSize every 100ms)</span>
function resize_op5() {
  if (bt.op5) {
    o.showPanel(o.aktPanel);
    var s = new createPageSize();
    if ((screenSize.width!=s.width) || (screenSize.height!=s.height)) {
      screenSize=new createPageSize();
      //need setTimeout or resize on window-maximize will not work correct!
      //benötige das setTimeout oder das Maximieren funktioniert nicht richtig
      setTimeout("o.resize(0,0,screenSize.width,screenSize.height)",100);
    }
    setTimeout("resize_op5()",100);
  }
}

<span style="color: darkgreen">//resize IE & NS (onResize event!)</span>
function myOnResize() {
  if (bt.ie4 || bt.ie5 || bt.ns5) {
    var s=new createPageSize();
    o.resize(0,0,s.width,s.height);
  }
  else
    if (bt.ns4) location.reload();
}

&lt;/SCRIPT&gt;

&lt;/head&gt;
<span style="color: darkgreen">&lt;!-- need an onResize event to redraw outlookbar after pagesize changes! --&gt;
&lt;!-- OP5 does not support onResize event! use setTimeout every 100ms --&gt;</span>
&lt;body onLoad="resize_op5();" onResize="myOnResize();"&gt;
</pre>
	<br />
	<br />
	<br />

</body>
</html>
