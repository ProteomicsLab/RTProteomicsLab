<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<html:html lang="true">
<head>
<title>Login Application</title>
<script type="text/javascript">
function here(){
	alert("Under Development");	
}
</script>
</head>

<!-- <body bgcolor="lightblue" style='background:url(IITBVirtualLab.jpg);position:fixed; top:0; left:30; width:90%; height:80%;'color = "lightblue"> -->
<body>

<table width="100%" height="15%" border="0" cellpadding="0" cellspacing="0">
<tr><td><img src=header.jpg width=100%></td></tr>
<tr><td align="right"><img src=datebar.gif width=101% align="right"></td>
</tr>
</table>

<table class="table" style="background-image: url(datebar.gif); background-repeat:no-repeat; background-color:#2d57ad" width="100%"></td>
<script language="javascript">
var mydate=new Date()
var year=mydate.getYear()
if (year < 1000)
year+=1900
var day=mydate.getDay()
var month=mydate.getMonth()
var daym=mydate.getDate()
if (daym<10)
daym="0"+daym
var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")
document.write("<td nowrap align=right><font size=1 face='verdana' color='#ebeff6'>")
document.write("<b>"+dayarray[day]+", "+montharray[month]+" "+daym+", "+year+"</b>")
document.write("</font></td></tr>")
</script>
</table>

<p>&nbsp;</p>

<font face="verdana,arial" size=-1>
<!-- <table align="right" cellpadding='' cellspacing='0' border='0' id='ap_table'> -->
<table align="right" cellpadding='' cellspacing='0' border='0'>
	<tr align="center" bgcolor=""><td><font color="red"><b><html:errors property="submitError"/></b></font></td></tr>
	<tr><td width="70%"><img src="FrontPage.png" width=80% height="60%" align="middle"></td>	
<!-- 	<td><img src="" width="" height=""> </td>	 -->
	<td bgcolor="" width="30%">
	<table cellpadding='0' cellspacing='0' border='1' width='100%'><tr><td bgcolor="blue" align=center style="padding:2;padding-bottom:4"><b><font size=-1 color="white" face="verdana,arial"><b>Enter your valid credentials!</b></font></th></tr>
		<tr><td bgcolor="white" width="100%" style="padding:5"><br>
		<html:form action="doLogin">
		<table align="right" width="100%">
		<tr><td><font face="verdana,arial" size=-1>Login:</td><td><html:text property="username" /></td><td><html:errors property="username"/></td></tr>
		<tr><td><font face="verdana,arial" size=-1>Password:</td><td><html:password property="password" /></td><td><html:errors property="password"/></td></tr>		
		<tr><td><font face="verdana,arial" size=-1>&nbsp;</td><td><font face="verdana,arial" size=-1><html:submit><bean:message key="button.login"/></html:submit></td></tr>
		<tr><td colspan=2><font face="verdana,arial" size=-1>&nbsp;</td></tr>
		<tr><td colspan=2><font face="verdana,arial" size=-1>Lost your username or password? Find it <a href="javascript:here()">here</a>!</td></tr>
		<tr><td colspan=2><font face="verdana,arial" size=-1>Not member yet? Click <a href="register.jsp">here</a> to register.</td></tr>
		</table>
		</html:form></td></tr>
	</table>
	</td>
	</tr>
</table>
</body>
</html:html>