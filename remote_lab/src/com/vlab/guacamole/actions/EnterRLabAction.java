package com.vlab.guacamole.actions;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.vlab.common.actions.BaseAction;
import com.vlab.guacamole.model.RLabScheduleInfo;
import com.vlab.login.actions.UserForm;
import com.vlab.login.model.UserLogin;

public class EnterRLabAction extends BaseAction{

	public ActionForward executeAction(ActionMapping mapping,
			ActionForm form, 
			HttpServletRequest request, 
			HttpServletResponse response)
	throws Exception 
	{
		boolean action_perform=false;
		String action_target;
		boolean sch_matched = false;
		UserLogin u;
		
		ActionMessages errors_mesg = new ActionMessages();
			HttpSession session = request.getSession();
			
			UserForm uf = (UserForm) session.getAttribute("userDetails");
			System.out.println("Printing from EnterRLabAction :: "+uf);
			
			RLabScheduleInfo rLabScheduleInfo = new RLabScheduleInfo();					
			
			if(uf!=null){				
				sch_matched = rLabScheduleInfo.getLabScheduleInCurrSlot(uf);
				action_perform = true;				
			}

			if (action_perform == false) {
				errors_mesg.add("submitError", new ActionMessage("errors.login.fail"));
				saveErrors(request, errors_mesg);
				action_target = "failure";
			} else {
				System.out.println("userDetails :: "+uf);
				session.setAttribute("userDetails", uf);
	            session.setAttribute("logined","true");
	            session.setAttribute("sch_matched",sch_matched);
	            session.setAttribute("context", new java.util.Date());
				action_target = "success";
			}			

		return mapping.findForward(action_target);
	}

}
