<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ page session="true"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.vlab.login.actions.*"%>

<!--
    Guacamole - Pure JavaScript/HTML VNC Client
    Copyright (C) 2010  Michael Jumper

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->

<html>

    <head>
        <link rel="icon" type="image/png" href="images/guacamole-icon-64.png"/>
        <link rel="stylesheet" type="text/css" href="guacamole.css"/>
        <link rel="stylesheet" type="text/css" href="keyboard.css"/>
        <title>Remote Triggered Virtual Lab</title>
		<script type="text/javascript">
			function controlParent(){
				
				document.getElementsByName("initialiseLab")[0].disabled = true;				
			}
		
			function loadingRLab(){
				//alert("Loading...");
				var remoteInstrDivv = document.getElementById("remoteInstrDiv");
				remoteInstrDivv.style.display = "none";
				//make multile divs for differnt instruments image
				//and depending upon the experiments id display the relevant instruments div or live video feed
			}
		</script>
        
    </head>

    <body onload="loadingRLab()" onunload="controlParent()">
        <!-- Menu -->
        <div id="menu">				
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
				document.write("<td nowrap align=right><font size=1 face='verdana' color='#ebeff6'>Virtual Proteomics Lab, IIT-Bombay &nbsp;&nbsp;")
				document.write("<b>"+dayarray[day]+", "+montharray[month]+" "+daym+", "+year+"</b>")
				document.write("</font></td></tr>")
				</script>
				</table><!--
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
            --><!-- Clipboard -->
            <button id="showClipboard">Show Clipboard</button>
            <div id="clipboardDiv">
                <h2>Clipboard</h2>
                <p>
                Text copied/cut within Remote Lab will appear here. Changes to the text will affect the Remote Lab clipboard, and will be pastable within Remote Lab. Use the textbox below as an interface between the you and Remote Lab clipboards.
                </p>
                <textarea rows="10" cols="40" id="clipboard"></textarea>
            </div>

            <button id="showKeyboard">Show Keyboard</button>
<!--             <button id="CtrlAltDelete">Ctrl-Alt-Delete</button> -->

			<button id="showRemoteInstr">Show Remote Instrument</button>
            <div id="remoteInstrDiv" >                
                Instruments shown here are currently active at real time and you are performing real time experiment<br> 
                <img alt="" src="2dsds_idief.jpg"><img alt="" src="GE_ImageScannerIII_2.jpg">
            </div>			
            <!-- Logo and status -->
<!--             <img id="logo" src="images/guacamole-logo.png" alt="Guacamole"/> -->
            <span id="state"></span>

<!--             <a href="agpl-3.0-standalone.html"><img id="license" src="images/agpl-logo.png" alt="AGPLv3"/></a> -->
        </div>


        <!-- Display -->
        <div id="display" class="loading">
            <!-- On-screen keyboard -->
            <div id="keyboardContainer"></div>

        </div>


        <!-- Error Dialog-->
        <div id="errorDialog" class="errorDialogOuter">
            <div class="errorDialogMiddle">
                <div class="errorDialog">
                    <h1>Error</h1>
                    <p id="errorText"></p>
                    <div class="buttons"><button id="reconnect">Reconnect</button></div>
                </div>
            </div>
        </div>


        <!-- Scripts -->
        <script type="text/javascript" src="javascript/keymap.js"></script>
        <script type="text/javascript" src="javascript/keyboard.js"></script>
        <script type="text/javascript" src="javascript/mouse.js"></script>
        <script type="text/javascript" src="javascript/layer.js"></script>
        <script type="text/javascript" src="javascript/message.js"></script>
        <script type="text/javascript" src="javascript/guacamole.js"></script>
        <script type="text/javascript" src="javascript/oskeyboard.js"></script>

        <!-- Init -->
        <script type="text/javascript">

            var menu = document.getElementById("menu");
            var display = document.getElementById("display");
            var logo = document.getElementById("logo");

            var errorDialog = document.getElementById("errorDialog");
            var errorDialogText = document.getElementById("errorText");

            // Position display correctly
            window.onresize = function() {
                display.style.top = menu.offsetHeight + "px"; 
            };

            window.onresize();

            // Instantiate client
            var vncClient = new VNCClient(display);

            var state = document.getElementById("state");
            vncClient.setOnStateChangeHandler(function(clientState) {

                    switch (clientState) {
                        case 0:
                            state.textContent = "Idle."
                            break;
                        case 1:
                            state.textContent = "Connecting...";
                            break;
                        case 2:
                            state.textContent = "Connected, waiting for first update...";
                            break;
                        case 3:
                            display.className = display.className.replace(/loading/, '');
                            menu.className = "connected";
                            state.textContent = "Connected.";
                            break;
                        case 4:
                            state.textContent = "Disconnecting...";
                            break;
                        case 5:
                            state.textContent = "Disconnected.";
                            break;
                        default:
                            state.textContent = "Unknown";
                    }
            });

            // Cache error image (might not be available when error occurs)
            var guacErrorImage = new Image();
            guacErrorImage.src = "images/noguacamole-logo.png";

            vncClient.setErrorHandler(function(error) {
                menu.className = "error";
                logo.src = guacErrorImage.src;
                errorDialogText.textContent = error;
                errorDialog.style.visibility = "visible";
            });

            // Reconnect button
            var reconnect = document.getElementById("reconnect");
            reconnect.onclick = function() {
                window.location.reload();
            };

            // Connect
            vncClient.connect();

            // Disconnect on close
            window.onunload = function() {
                vncClient.disconnect();
            }

            // Handle clipboard events
            var clipboardElement = document.getElementById("clipboard");
            clipboardElement.onchange = function() {

                var text = clipboardElement.value;
                vncClient.setClipboard(text);

            };

            // Ignore keypresses when clipboard is focused
            clipboardElement.onfocus = function() {
                vncClient.disableKeyboard();
            };

            // Capture keypresses when clipboard is not focused
            clipboardElement.onblur = function() {
                vncClient.enableKeyboard();
            };

            // Server copy handler
            vncClient.setClipboardHandler(
                function(data) {
                    clipboardElement.value = data;
                }
            );


            // Show/Hide clipboard
            var clipboardDiv = document.getElementById("clipboardDiv");
            var showClipboard = document.getElementById("showClipboard");
            showClipboard.onclick = function() {

                var displayed = clipboardDiv.style.display;
                if (displayed != "block") {
                    clipboardDiv.style.display = "block";
                    showClipboard.innerHTML = "Hide Clipboard";
                }
                else {
                    clipboardDiv.style.display = "none";
                    showClipboard.innerHTML = "Show Clipboard";
                    clipboardElement.onchange();
                }

            };

            // Show/Hide remote instruments
            var remoteInstrDiv = document.getElementById("remoteInstrDiv");
            var showRemoteInstr = document.getElementById("showRemoteInstr");
            showRemoteInstr.onclick = function() {

                var displayed = remoteInstrDiv.style.display;
                if (displayed != "block") {
                	remoteInstrDiv.style.display = "block";
                	showRemoteInstr.innerHTML = "Hide Remote Instruments";
                }
                else {
                	remoteInstrDiv.style.display = "none";
                	showRemoteInstr.innerHTML = "Show Remote Instruments";
                    //clipboardElement.onchange();
                }

            };


            // Show/Hide keyboard
            var keyboardContainer = document.getElementById("keyboardContainer");
            var showKeyboard = document.getElementById("showKeyboard");
            showKeyboard.onclick = function() {

                var displayed = keyboardContainer.style.display;
                if (displayed != "block") {
                    keyboardContainer.style.display = "block";
                    showKeyboard.textContent = "Hide Keyboard";
                }
                else {
                    keyboardContainer.style.display = "none";
                    showKeyboard.textContent = "Show Keyboard";
                }

            };

            // On-screen keyboard
            var osKeyboard = new GuacamoleOnScreenKeyboard("layouts/en-us-qwerty.xml");
            keyboardContainer.appendChild(osKeyboard);

            osKeyboard.setKeyPressedHandler(
                    function(keysym) {
                        vncClient.pressKey(keysym);
                    }
            );

            osKeyboard.setKeyReleasedHandler(
                    function(keysym) {
                        vncClient.releaseKey(keysym);
                    }
            );

            // Send Ctrl-Alt-Delete
            var CtrlAltDelete = document.getElementById("CtrlAltDelete");

            CtrlAltDelete.onclick = function() {
                vncClient.pressKey(KEYSYM_CTRL);
                vncClient.pressKey(KEYSYM_ALT);
                vncClient.pressKey(KEYSYM_DELETE);
                vncClient.releaseKey(KEYSYM_DELETE);
                vncClient.releaseKey(KEYSYM_ALT);
                vncClient.releaseKey(KEYSYM_CTRL);
            }
			
			function help(){
				alert("Module is under development");
			}
			function home(){
				//window.history.go(-1);
				vncClient.disconnect();
				document.forms[0].submit(); 

			}
			function logout(){
				vncClient.disconnect();
				document.forms[1].submit(); 
			}			
  
        </script>
<html:form action="doLogin"></html:form>
<html:form action="doLogout"></html:form>
    </body>

</html>
