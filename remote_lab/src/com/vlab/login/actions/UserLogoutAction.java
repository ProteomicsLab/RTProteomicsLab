package com.vlab.login.actions;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.vlab.common.actions.BaseAction;
import com.vlab.guacamole.vnc.VNCClient;
import com.vlab.login.model.UserLogin;

public class UserLogoutAction extends BaseAction{
	public ActionForward executeAction(ActionMapping mapping,
			ActionForm form, 
			HttpServletRequest request, 
			HttpServletResponse response)
	throws Exception 
	{
		boolean action_perform=false;
		String action_target;
		
		UserLogin u;
		
		ActionMessages errors_mesg = new ActionMessages();
			HttpSession session = request.getSession();
			
			UserForm uf = (UserForm) session.getAttribute("userDetails");
			
			System.out.println("UserForm while loggin out :: "+uf);
		    //form = null;
	        
	        session.removeAttribute("logined");
	        session.removeAttribute("context");
	        session.removeAttribute("userDetails");

			uf = (UserForm) session.getAttribute("userDetails");			
			System.out.println("UserForm while loggin out :: "+uf);

	        session.invalidate();
	        //VNCClient.disconnect();
			errors_mesg.add("submitError", new ActionMessage("errors.logout.success"));
			action_target="success";

		return mapping.findForward(action_target);
	}


}
