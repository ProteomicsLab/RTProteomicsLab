<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<html:html lang="true">
<head>
<title>User Registration Application</title>
</head>

<body >
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

<table>
<tr>
<td><img src="FrontPage.png" width=80% height="60%"></td><td></td><td></td><td><img src="" width=100% height="100"> </td><td></td>
<td width="">
<table bgcolor="lightblue" align="right" >
<thead><tr><td width=""></td><th><u>Registration Form</u><th><td></td></tr></thead>
<tr><td><font color="red"><html:errors property="submitError"/></font></td></tr>
<tr><td></td><td><html:form action="doRegister"></td><td></td></tr>		
<tr><td>First Name: </td><td><html:text property="firstname" /></td><td><html:errors property="firstname"/></td></tr>
<tr><td>Last Name: </td><td><html:text property="lastname" /></td><td><html:errors property="lastname"/></td></tr>
<tr><td>User Name : </td><td><html:text property="userId" /></td><td><html:errors property="userId"/></td></tr>
<tr><td>Password: </td><td><html:password property="password" /></td><td><html:errors property="password"/></td></tr>
<tr><td>Confirm Password: </td><td><html:password property="cpassword" /></td><td><html:errors property="cpassword"/></td></tr>
<tr><td>Email: </td><td><html:text property="emailid" /></td><td><html:errors property="emailid"/></td></tr>
<tr><td>Gender: </td><td><html:select property="gender">
		<html:option value="">Select Gender</html:option>
		<html:option value="M">Male</html:option>
		<html:option value="F">Female</html:option>
		</html:select>
</td><td><html:errors property="gender"/></td></tr>
<tr><td>Profession: </td><td><html:text property="profession" /></td><td><html:errors property="profession"/></td></tr>
<tr><td>Institution: </td><td><html:text property="institution" /></td><td><html:errors property="institution"/></td></tr>
<tr><td></td><td><html:submit><bean:message key="button.register"/></html:submit></td><td></td></tr>
</html:form>
</table>		
</td>
</tr>
</table>
</body>
</html:html>