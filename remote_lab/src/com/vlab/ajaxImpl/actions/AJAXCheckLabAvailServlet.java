package com.vlab.ajaxImpl.actions;

import javax.servlet.*;
import javax.servlet.http.*;

import com.vlab.ajaxImpl.model.AjaxDBReqs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class AJAXCheckLabAvailServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7819556983536701800L;

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		//colleting the parameters from jsp
		String lab_time = request.getParameter("lab_time");
		String lab_date = request.getParameter("lab_date");
		String avail_expr = request.getParameter("avail_expr");
		
		AjaxDBReqs ajaxDataBaseReqs = new AjaxDBReqs();
		PrintWriter writer = response.getWriter(); 
		StringBuffer responseXML = null;
		
		boolean isExist = ajaxDataBaseReqs.checkLabAvailability(lab_time,lab_date.substring(0, 10).trim(),Integer.parseInt(avail_expr));

		//response.setContentType("text/html");
		response.setContentType("text/xml");
		response.setHeader("Cache-Control", "no-cache");
		
		if(isExist){			
			//response.getWriter().write("Lab slot NOT-AVAILABLE, try some-other slot.");			
			responseXML = new StringBuffer("\r\n<ajaxresponse>");
			responseXML.append("\r\n<availmessage>"+"Lab slot is NOT-AVAILAIBLE, try some-other slot."+"</availmessage>");
			responseXML.append("\r\n<availflag>"+0+"</availflag>");
			responseXML.append("\r\n</ajaxresponse>");
			response.getWriter().write(responseXML.toString());
		}
		else{
			//response.getWriter().write("Lab slot is availaible, go ahead with booking.");
			responseXML = new StringBuffer("\r\n<ajaxresponse>");
			responseXML.append("\r\n<availmessage>"+"Lab slot is availaible, go ahead with booking."+"</availmessage>");
			responseXML.append("\r\n<availflag>"+1+"</availflag>");
			responseXML.append("\r\n</ajaxresponse>");
			response.getWriter().write(responseXML.toString());
		}
	}


}