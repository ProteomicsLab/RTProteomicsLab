<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ page session="true"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.vlab.login.actions.*"%>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="welcome1.css">
		<title>Welcome Registered successfully</title>
			<script type="text/javascript">
				function help(){
					alert("Module is under development");
				}
				
				function logout(){
					document.forms[1].submit(); 
				}
				function getUserData(){
					<%UserForm uf = (UserForm)session.getAttribute("userDetails");%>
					//alert("Hello : "+'<//%=uf.getUsername()%>');
					document.forms["frm_available_booking"].user_name = <%=uf.getUsername()%>;
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

			</script>
	</head>

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
<!--	<a href="index.jsp;" id="home"></a>-->
	
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
	<!--  <p>&nbsp;</p>-->
	<br><br>
	
	<form method="post" action="GetConnectionPage" name="">
		<table bgcolor="white" border="0" width="100%">
			<tr><td colspan="3" align="right" > <font color="green" face="calibri" ><b>WELCOME &nbsp;&nbsp;<%=uf.getUsername()%></b> </font></td></tr>
<!--			<tr><td colspan="3" align="center" ><b>Instructions and Options to access REMOTE TRIGGERED V-LAB</b></td></tr>-->
<!--			<tr><td></td><td><font color="red"><html:errors property="submitError"/></font></td><td></td></tr>-->
<!--			<tr><td>1.</td><td> Instructions need to be followed </td><td></td></tr>-->
<!--			<tr><td>2.</td><td> Instructions need to be followed </td><td><input type="submit" value="Start Lab" id="StartLab"></td></tr>-->
				<tr><td colspan="3" align="center" ><font size="6"><b>An Overview of Remote Triggered Proteomics Laboratory</b></font></td></tr>
				<tr><td>
				<div style="background-color:" >
<!-- 					<div style="background-color:skyblue ;margin-left:15%;  margin-right:15%;border-style:; " > -->
<!-- 						<font size="4" face="calibri" > -->
<!-- 						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Proteomics is the systemic study of entire set of proteins expressed by the genome of an organism under specific conditions in a high-throughput format. In gel-based proteomics the complex proteome of any organism is being separated using poly acrylamide gels. Gel-based proteomics includes classical 1D, native PAGE, and 2D electrophoresis (1-DE and 2-DE), as well as 2D -differencegel electrophoresis (2D-DIGE). 2-DE is a versatile tool for the separation and visualization of complex protein mixtures. It is a protein profiling technique that carries out separation using isoelectric focussing (IEF) in the first dimension, which separates proteins based on their isoelectric points (pI), followed by SDS-PAGE in the second, orthogonal dimension, which leads to the further separation of the proteins based on their relative molecular mass. -->
<!-- 						</font> -->
<!-- 					</div> -->
<!-- 						<br> -->
<!-- 					<div align="center" style="background-color:skyblue ;margin-left:15%;  margin-right:15%;border-style:none; " > -->
<!-- 						<img alt="" border="3" align="middle" height="30%" width="30%" src="mod1.jpg"> -->
<!-- 					</div>				 -->
<!-- 						<br> -->
<!-- 					<div style="background-color:skyblue ;margin-left:15%;  margin-right:15%;border-style:; " >						 -->
<!-- 						<font size="4" face="calibri" >						 -->
<!-- 						In this module we have provided the technological details of 2-DE for different types of biological samples including human serum in light of disease biomarker detection, bacterial proteome for elucidation of drug action and plant proteome to analyse the stress responses. Technical details for each of the extraction and sample processing procedure have been depicted with the help of real time Remote Triggered Laboratory. You may give any relevant feedback at the end of every experiment. -->
<!-- 						</font>						 -->
					<div class="note blue"">												
						<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspProteomics is the comprehensive study of the complete magnitude of proteins encoded by a genome for their expression, localization, interaction and post-translational modifications. Proteome level analysis is highly complex and challenging due to the diversity of protein content across the living organisms and dynamic changes in protein expression levels with time, and in response to the external stimulus or environmental circumstances. Proteins have a closer correlation with biological functions and disorders as compared to genes; and provide better insight about the pathobiological status under diseased states, since they are the ultimate effector molecules in living systems. Over the last two decades, massive advancements in high-throughput proteomic technologies lead to an exceptional uprising in proteomics research and as a consequence this emerging platform has propelled its growth in manifold disciplines of life sciences. Eventually, the potential “bed-side” applications of clinical proteomics for early detection, rational therapeutic targeting, and patient-tailored therapy are being investigated with substantial importance.</p> 
						<p>&nbsp&nbsp&nbsp&nbsp&nbspNow-a-days, considering the rising impact of proteomics on clinical and industrial research, academic and research institutions are integrating proteomics as an important parts of their course curriculum. Although proteomics has been included as a prominent part of biotechnology course work in multiple institutes, establishment of several high-throughput technological facilities in academic settings remains challenging owing to the shrinking educational budgets, mainly in the developing countries. To this end, various e-learning and open-learning programs particularly static and remotely triggered virtual labs have started incorporating theoretical or practical aspects of different proteomic techniques as a component of their course materials. Addition of virtual labs as an element of regular course curriculum will definitely be useful for the developing countries like India, where the number of qualified students is much higher than the number of well-equipped universities having the required infrastructures for advanced practical instruction.</p>
						<p>&nbsp&nbsp&nbsp&nbsp&nbspStatic virtual labs cannot provide the learners first hand experiences of performing any experiment; while, remote triggered virtual labs can enhance those opportunities by adding the component of hands-on-experience in a real-time manner. In remote-triggered virtual proteomics learners will be allowed the monitor sophisticated equipments associated with proteomics directly from remote places through dedicated software and operating systems. After getting immense success in development of a static Virtual Proteomics Lab as a part of Sakshat Virtual Labs program, we have taken an initiative for developing a Remote Triggered Virtual Lab dedicated to proteomic technologies to create highly realistic virtual environments that can give the learners a first hands experience of performing different proteomic technologies.The overall course material is organized in eight different experiments; including global and differential proteomic analysis and their applications in elucidation of mechanism of drug action, identification of autoantibody response in diseased samples, studying protein interactions, and post translational modifications. To access this e-Learning facility, remote users have to register into the real-time remote lab system hosted on the IIT-Bombay, Proteomics Lab server, with unique user name and password.  After successful registration, users will be allowed to login into the system. Users have to reserve slots for the specific experiments as per their requirements.</p>											
					</div>


				</div>
				</td></tr>
		</table>		
	</form>	
	
<html:form action="doLogout">
	
</html:form>
<html:form action="availableBooking">
		<html:hidden property="user_name" value="<%=uf.getUsername()%>"/>
</html:form>	
<html:form action="homePageAction">
	
</html:form>
<html:form action="enterRLabAction">
	
</html:form>

</body>
</html>