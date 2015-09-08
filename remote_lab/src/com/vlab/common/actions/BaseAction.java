package com.vlab.common.actions;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public abstract class BaseAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException, Exception {
		ActionForward af = new ActionForward();
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility 

		if (!this.userIsLoggedIn(request)) {
			ActionErrors errors = new ActionErrors();
			errors.add("error", new ActionMessage("logon.sessionEnded"));   

			this.saveErrors(request, errors);
			return mapping.findForward("sessionEnded");
		}
		try {
			af = executeAction(mapping, form, request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return af;
		//Commented by Bhushan N Kharbikar
		//return executeAction(mapping, form, request, response); 
	}
	protected abstract ActionForward executeAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException, Exception;      
	private boolean userIsLoggedIn(HttpServletRequest request) {
		//if (request.getSession().getAttribute("User") == null) {
		if (request.getSession().getAttribute("userDetails") == null) {
			return false;
		}
		return true;
	}
}