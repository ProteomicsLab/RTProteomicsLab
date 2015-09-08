<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ page session="true"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.vlab.login.actions.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Lab :: Remote-Lab, IIT-Bombay, MHRD, GOI</title>

	<script type="text/javascript">
	function help(){
		alert("Module is under development");
	}
	
	function getUserData(){
		<%UserForm uf = (UserForm)session.getAttribute("userDetails");
		  boolean sch_match = (Boolean)session.getAttribute("sch_matched");	  	  
		  %>
		  var sch_matched = <%=sch_match%>;
		  //alert("Scheduled Matched :: "+sch_matched);
		  <%if(sch_match==true){%>
		  	 
			  document.getElementsByName("initialiseLab")[0].disabled = false;
		<%  }else{
		%>	
			document.getElementsByName("initialiseLab")[0].disabled = true;
		<%}%>
		//document.getElementsByName('initialiseLab').disabled = true;
	}
	function logout(){
		document.forms[1].submit(); 
	}
	function chk_available_booking(){					
		document.forms[2].submit(); 
	}
	function go_to_welcome(){
		document.forms[3].submit();
	}
	function enter_lab(){
		document.forms[4].submit();
	}
	function launchLab(){
		alert("intialiseRemoteLabAction :: ");
		document.getElementsByName("initialiseLab")[0].disabled = true;
		document.forms[0].submit(); 
		
	}
	function myOpenWindow() {
		alert("In manipulating window");
	    myWindowHandle = window.open('intialiseRemoteLabAction','myWindowName','width=1024,height=768,resizable=1,alwaysRaised=1,scrollbars=1');
		//myWindowHandle = window.showModalDialog('intialiseRemoteLabAction','myWindowName','width=800,height=600,directories=no,titlebar=no,toolbar=no,location=0,status=0,menubar=no,modal=yes');
		//myWindowHandle = window.showModalDialog("Hello");
		
		
	}

	 var childW = null;
	 function launchChildW() {
	   if (childW != null) childW.window.close();
	     
	   wopts  = 'width=300,height=500,resizable=1,alwaysRaised=1,scrollbars=1';
	   childW = window.open('', 'childW', wopts);

	   if (childW != null) {
	     childW.document.open()
	     childW.document.bgColor = "ccffcc";
	     childW.document.write('<br>');
	     if (childW.opener == null) {
	       childW.opener = self;
	     }
	   } else {
	       alert("Failed to open child window");
	   }
	 }

	
	</script>

</head>
<body>
<body background="" onload="getUserData()">
	<table width="100%" height="15%" border="0" cellpadding="0" cellspacing="0">
		<tr><td><img src=header.jpg width=100%></td></tr>
		<tr><td align="right"><img src=datebar.gif width=101% align="right"></td>
		</tr>
	</table><!-- Table is for the real time clock -->
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
	<TABLE style="BACKGROUND: url(headbg1.gif) no-repeat" class=table align=right>
	  <TBODY>
	  <TR style="COLOR: #ffffff">
	    <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:go_to_welcome()" style=text-decoration:none;color:#FFFFFF><b>Home</b></a></td>
	    <td>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:enter_lab()" style=text-decoration:none;color:#FFFFFF><b>Enter Lab</b></a></td>
	    <td>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:chk_available_booking()" style=text-decoration:none;color:#FFFFFF><b>Lab Reservation</b></a></td>
	    <TD>&nbsp;&nbsp;|&nbsp;&nbsp;<A style="COLOR: #ffffff; TEXT-DECORATION: none" href="javascript:logout()"><B>Logout</B></A></TD>
	    <td>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:help()" style=text-decoration:none;color:#FFFFFF><b>Help</b></a></td>
	  </TR>
	  </TBODY>
	</TABLE>
	<p>&nbsp;</p>
	<br><br>
	<h1> Loading... <img alt="" src="connecting.gif"> Tunnelling Lab Entrance</h1>
	<%if(sch_match==true){ %>
		<h3><font color="green">You can launch the lab by clicking the Launch Pad</font></h3>
	<% }else{%>
		<h3><font color="red">Current time-slot does not match any Lab reserved by you</font></h3>
	<%} %>
	<html:form action="intialiseRemoteLabAction" target="myWindowName" onsubmit="myOpenWindow()">
		<html:button property="initialiseLab" onclick="launchLab();">Launch-Pad</html:button>
	</html:form>
	
	<html:form action="doLogout">
		
	</html:form>
	<html:form action="availableBooking">
			<html:hidden property="user_name" value="<%=uf.getUsername()%>"/>
	</html:form>	
	<html:form action="homePageAction">
		
	</html:form>
	<html:form action="enterRLabAction">
		
	</html:form>
	<!--
	<form name="launchLab" id="launchLab" >
		<a href="" target="_blank" onclick="launchLab()">Launch Remote Laboratory</a>
	</form>
	
	
--></body>
</html>