<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="com.vlab.labBooking.model.BookingHistData"%>
<%@ page language="java" import="com.vlab.login.actions.UserForm"%>
<!-- Jsp:name: available_bookings.jsp -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available Bookings</title>

<script language="JavaScript" src="javascript/dp/ts_picker.js">
</script>
<script language="JavaScript" >
	function chkSlotAvail(){
		alert("Checking Slot!");		
	}
	function validate_booking(){		
		//alert("validate_booking!");
		var booking_dt = document.getElementById("dateBook").value;
		var lab_time = document.getElementById("lab_time").value;
		var avail_expr = document.getElementById("avail_expr").value;
		//alert("booking_dt :: "+booking_dt);
		//alert("lab_time :: "+lab_time);
		
		if(booking_dt=='' || lab_time==0 || avail_expr ==0){
			alert("Please select the appropriate details before you hit book");
			return false;		
		}else{
			//alert("In else");
			document.getElementsByName("bookingDate")[0].value = booking_dt;
			document.getElementsByName("timeSlot")[0].value = lab_time;
			document.getElementsByName("avail_expr")[0].value = avail_expr;
			
			//alert("checking on struts ::"+document.getElementsByName("bookingDate")[0].value+"\n lab_time"+document.getElementsByName("timeSlot")[0].value);		
			document.forms[1].submit();
		}
		
	}
	function chk_available_booking(){					
		document.forms[2].submit(); 
	}
	function logout(){
		document.forms[3].submit(); 
	}
	function go_to_welcome(){
		document.forms[4].submit();
	}
	function enter_lab(){
		document.forms[5].submit();
	}
	
	/*
		The java script for ajax implemetation for checking the availability for lab booking 
	*/
	//Start: Ajax request for availability of Lab booking
			var xmlHttp;
		function checkAvailStatus() {
			//alert("Checking...");
			var lab_time = document.getElementById("lab_time").value;
			var lab_date = document.getElementById("dateBook").value;
			var avail_expr = document.getElementById("avail_expr").value;
			
			//alert("lab_time :: "+lab_time +"::"+ lab_date);
			var url = "AJAXCheckLabAvailServlet?lab_time="+lab_time+"&lab_date="+ lab_date+"&avail_expr="+avail_expr;
			
			//alert("URL :: "+url);
			if(window.XMLHttpRequest){
				//alert("in if");
				xmlHttp = new XMLHttpRequest();
				//alert("xmlHttp :: "+xmlHttp);
			}
			else if(window.ActiveXObject){
				//alert("in else");
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//alert("before request is opened");
			xmlHttp.open("Get",url,true);
			//alert("after request is opened");
			xmlHttp.onreadystatechange = callback;
			xmlHttp.send(null);
		}
		
		function callback() {
			if( xmlHttp.readyState==4 ){
				if( xmlHttp.status==200 ) {
					//document.getElementById('availstatus').innerHTML = "<br/><b><font color=\"red\">"+xmlHttp.responseText+"</font></b>";
					//parser=new DOMParser();

					var response = xmlHttp.responseXML;
					//response = parser.parseFromString(response,"text/xml");

					//alert("Entering ::"+response);
					var ajaxresponse = response.getElementsByTagName("ajaxresponse")[0];					
					//alert("Entering ::"+ajaxresponse);
					var availmessage = ajaxresponse.getElementsByTagName("availmessage")[0].firstChild.data; 
										 
					var availflag = ajaxresponse.getElementsByTagName("availflag")[0].firstChild.data;										
					//alert("Avail message ::"+availmessage);
					document.getElementsByName('avail_flag').value = availflag;
					//alert("availflag :: "+availflag);
					if(availflag ==1){
//						alert("Alering :: "+document.getElementById('bookButton').disabled );
						document.getElementById('availstatus').innerHTML = "<br/><b><font color=\"green\">"+availmessage+"</font></b>";
						document.getElementById('bookButton').disabled = false;					
					}else{
						document.getElementById('bookButton').disabled = true;					
						document.getElementById('availstatus').innerHTML = "<br/><b><font color=\"red\">"+availmessage+"</font></b>";
						
					}
				}
			}
		}

	//Stop: Ajax request for availability of Lab booking
	
</script>
<style type="text/css">

#booking {width:800px; height:500px; border: 1px solid #000; padding: 2px; align:center;}
</style> 

<script type="text/javascript">
	function chkData(){
		//alert("in chk data");
		document.forms["frmbookingData"].submit();
	}
	
	function getBookingHistData(){		
		//alert("Gettingn data from booking history!");
		<%UserForm uf = (UserForm)session.getAttribute("userDetails");%>
		<%	ArrayList arlBkngHist = (ArrayList)session.getAttribute("BookingHist");
			BookingHistData BknHistData; 
			Iterator itArlBkngHist = arlBkngHist.iterator();
			int index=0;
			HashMap hmtimeSlot = (HashMap)session.getAttribute("timeSlot");
			Iterator ithmtimeSlot = hmtimeSlot.keySet().iterator();
			
			HashMap hmAvailExpr = (HashMap)session.getAttribute("availExpr");
			Iterator ithmAvailExpr = hmAvailExpr.keySet().iterator(); 

		%>
	}

</script>
</head>

<body onload= "getBookingHistData()">
<table width="100%" height="15%" border="0" cellpadding="0" cellspacing="0">
<tr><td><img src=header.jpg width=100%></td></tr>
<tr><td align="right"><img src=datebar.gif width=101% align="right"></td>
</tr>
</table>

<table class="table" style="background-image: url(datebar.gif); background-repeat:no-repeat; background-color:#2d57ad" width="100%"></td>
<script language="javascript">
var mydate=new Date();
var year=mydate.getYear();
if (year < 1000)
year+=1900;
var day=mydate.getDay();
var month=mydate.getMonth();
var daym=mydate.getDate();
if (daym<10)
daym="0"+daym;
var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")
document.write("<td nowrap align=right><font size=1 face='verdana' color='#ebeff6'>")
document.write("<b>"+dayarray[day]+", "+montharray[month]+" "+daym+", "+year+"</b>")
document.write("</font></td></tr>")
</script>
</table>
<a href="index.jsp;" id="home"></a>
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
<h2 align="center"><font size="6" ><b>Book new laboratory time slot</b></font></h2>
<div style="background-color:skyblue" >
<table align="center" width="70%" border="1px" bordercolor="gray"><tr><td>
	<form name="labBook" action="labBookAction" method="post">		
		<hr align="center" width="90%">
<!--  <div align="center" id="booking" style="background-image: url('images/bck0.png'); background-repeat: repeat;>-->
		
		<table align="center" width="90%" border="1px" bordercolor="sky-blue">
			<tr><!-- replacing dateBook by LabDate -->
				<td>BOOKING DATE</td><td>:</td><td><input id="dateBook" name="dateBook" type="text"></td>
				<td><a href="javascript:show_calendar('document.labBook.dateBook');"><img src="javascript/dp/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the Date"></a></td>
			</tr>
			<tr>
				<td>EXPERIMENT :</td><td>:</td>
				<td width="">
					<select id="avail_expr">
						 <option value=0>[SELECT ONE]</option>
						  <% while(ithmAvailExpr.hasNext()){
							  int aEkey = (Integer) ithmAvailExpr.next();
							  //System.out.println("Error " + aEkey + " means " + errors.get(aEkey));
						  %>
						  <option value=<%=aEkey%>><%= hmAvailExpr.get(aEkey)%></option>
						  <% }%>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>TIME SLOT</td><td>:</td>
				<td width="">
					<select id="lab_time">
						 <option value=0>[SELECT ONE]</option>
						  <% while(ithmtimeSlot.hasNext()){
							  int key = (Integer) ithmtimeSlot.next();
							  //System.out.println("Error " + key + " means " + errors.get(key));
						  %>
						  <option value=<%=key%>><%= hmtimeSlot.get(key)%></option>
						  <% }%>
					</select>
				</td>
				<td><button type="button" value="check lab availability" onclick="checkAvailStatus();">Check Availability</button></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><button type="button" id="bookButton" name="bookButton" onclick="validate_booking()" disabled="disabled">Book Lab</button></td>
				<td><div id="availstatus" ></div></td>
			</tr>
		</table>
				<!--  <h3 align="center"><font color="red">You can only book 3 laboratory slots a month and only one a week</font></h3>-->
		<hr align="center" width="90%">
		<table align="center" border="1" width="90%" bgcolor="sky-blue">		
			<tr>
				<th colspan="5"><font color="black">Your Booking History</font></th>
			</tr>
			<tr bgcolor="yellow">
				<th>SR. NO.</th><th>BOOKING DATE</th><th>EXPERIMENT NAME</th><th>LAB SLOT TIMING</th><th>STATUS</th>			
			</tr>
			<% while(itArlBkngHist.hasNext()){
				index++;
				BknHistData = (BookingHistData)itArlBkngHist.next();
			%>			
				<tr>
					<td align="center"><%=index%></td><td align="center"><%= BknHistData.getBooking_date()%></td><td align="center"><%=BknHistData.getAvail_expr() %></td><td align="center"><%=BknHistData.getSlot_desc() %></td><td align="center"><%=BknHistData.getStatus_desc ()%></td>				
				</tr>
			<%} %>		
		</table>	
		<hr align="center" width="90%">
		
		<input type="hidden" name="user_name" value="<%=uf.getUsername()%>"> 
		<input type="hidden" name="user_id" value="<%=uf.getUserId()%>">
		<input type="hidden" name="avail_flag" value=0>
<!--  </div>-->
	</form>
</td>
</tr></table>
<html:form action="LabBookAction">
	<html:hidden property="bookingDate"/>
	<html:hidden property="timeSlot"/>
	<html:hidden property="avail_expr"/>	
	<html:hidden property="user_name" value="<%=uf.getUsername()%>"/>
</html:form>

<html:form action="availableBooking">
		<html:hidden property="user_name" value="<%=uf.getUsername()%>"/>
</html:form>	
<html:form action="doLogout">
	
</html:form>
<html:form action="homePageAction">
	
</html:form>
<html:form action="enterRLabAction">
	
</html:form>
</div>
</body>
</html>