package com.vlab.login.actions;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.vlab.login.model.UserLogin;

public class UserAuthAction extends Action{

	public ActionForward execute(ActionMapping mapping,
			ActionForm form, 
			HttpServletRequest request, 
			HttpServletResponse response)
	throws Exception 
	{
//		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
//		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
//		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
//		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility 

/*		if (this.userIsLoggedIn(request)) {
			//ActionMessages errors_mesg = new ActionMessages();
			 //errors_mesg.add("submitError", new ActionMessage("errors.login.sessionended"));
	         //this.saveErrors(request, errors_mesg);
	         //return mapping.findForward("sessionEnded");
		}
*/						
		    //request.getSession().invalidate();

		    boolean action_perform = false;
			String action_target;
			UserLogin u = new UserLogin();
			ActionMessages errors_mesg = new ActionMessages();
			UserForm uf = (UserForm) form;
			if (form != null) {
				u.setUsername(uf.getUsername());
				u.setPassword(uf.getPassword());
				action_perform = u.doLogin();
			}
			if (action_perform == false) {
				errors_mesg.add("submitError", new ActionMessage("errors.login.fail"));
				saveErrors(request, errors_mesg);
				action_target = "failure";
			} else {
				System.out.println("userDetails :: "+uf);
				request.getSession().setAttribute("userDetails", uf);
	            HttpSession session = request.getSession();
	            session.setAttribute("logined","true");
	            session.setAttribute("context", new java.util.Date());
				action_target = "success";
			}
			return mapping.findForward(action_target);

	}

}
