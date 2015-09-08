package com.vlab.labBooking.actions;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.vlab.login.actions.UserForm;
import com.vlab.labBooking.model.*;

public class availableBookingAction extends BaseAction{

	public ActionForward executeAction(ActionMapping mapping,
			ActionForm form, 
			HttpServletRequest request, 
			HttpServletResponse response)
	throws Exception 
	{
		boolean action_perform = false;
		ArrayList arlLabBkngHist = null;
		HashMap hmLabSlot = null;
		HashMap hmAvailExpr = null;
		String action_target;
		ActionMessages errors_mesg = new ActionMessages();
		UserForm uf = (UserForm) form;
		LabBooking lB = new LabBooking();

		if (form != null) {			
			uf.setUsername(request.getParameter("user_name"));
			hmAvailExpr = lB.getAvailExpr(uf);//Dropdown for available experiments
			hmLabSlot = lB.getLabSlotCombo();//Dropdown for lab expr timing			
			arlLabBkngHist = lB.getBookingHistory(uf);
			action_perform = true;
		}

		if (action_perform == false) {
			errors_mesg.add("submitError", new ActionMessage("errors.login.fail"));
			saveErrors(request, errors_mesg);
			action_target = "failure";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("userDetails", uf);			
			session.setAttribute("logined","true");
			session.setAttribute("BookingHist", arlLabBkngHist);//hold the booking history in arraylist
			session.setAttribute("availExpr", hmAvailExpr);
			session.setAttribute("timeSlot", hmLabSlot);
			session.setAttribute("context", new java.util.Date());
			action_target = "success";
		}
		return mapping.findForward(action_target);

	}
}