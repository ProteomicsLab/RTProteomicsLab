package com.vlab.ajaxImpl.actions;

import java.io.IOException;
import java.rmi.ServerException;
import javax.servlet.http.*;

public class CharacterDecoderUsingXMLServlet
extends HttpServlet {
	public void doGet( HttpServletRequest
			request, HttpServletResponse response )
	throws ServerException, IOException {
		String strEnteredKey =request.getParameter("key");
		StringBuffer responseXML = null;
		System.out.println("\nUsing XML");
		System.out.println("Entered key: "+strEnteredKey);
		if( strEnteredKey!="" ){
			int num = Integer.parseInt(strEnteredKey);
			responseXML = new StringBuffer("\r\n<converted-values>");
			responseXML.append("\r\n<binary>"+Integer.toBinaryString(num)+"</binary>");
			responseXML.append("\r\n<octal>"+Integer.toString(num,8)+"</octal>");
			responseXML.append("\r\n<decimal>"+num+"</decimal>");
			responseXML.append("\r\n<hexadecimal>"+Integer.toString(num,16)+"</hexadecimal>");
			responseXML.append("</convertedvalues>");
			System.out.println("\n"+responseXML.toString());
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "nocache");
			response.getWriter().write(responseXML.toString());
		}
		else{
			responseXML = new
			StringBuffer("\r\n<converted-values>");
			responseXML.append("\r\n<binary>? </binary>");
			responseXML.append("\r\n<octal>? </octal>");
			responseXML.append("\r\n<decimal>? </decimal>");
			responseXML.append("\r\n<hexadecimal>?</hexadecimal>");
			responseXML.append("</converted-values>");
			System.out.println("\n"+responseXML.toString());
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(responseXML.toString());
		}
	}
}