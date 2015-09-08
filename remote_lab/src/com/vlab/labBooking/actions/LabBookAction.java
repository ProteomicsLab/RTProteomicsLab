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

public class LabBookAction extends BaseAction{

	public ActionForward executeAction(ActionMapping mapping,
			ActionForm form, 
			HttpServletRequest request, 
			HttpServletResponse response)
	throws Exception 
	{
		boolean action_perform = false;
		String action_target;
		ActionMessages errors_mesg = new ActionMessages();
		
		BookingDataBean bDB = (BookingDataBean)form;
		UserForm uf = new UserForm();
		
		LabBooking lB = new LabBooking();
		HashMap hmLabSlot = new HashMap();
		ArrayList arlLabBkngHist = null;
		if (form != null) {			
			
			hmLabSlot = lB.getLabSlotCombo();
			bDB.setBookingDate(bDB.getBookingDate().substring(0,10).trim());
			uf.setLabDate(bDB.getBookingDate());			
			uf.setLabTime(bDB.getTimeSlot());
			uf.setUsername(bDB.getUser_name());

			if(lB.checkLabSlotBlockbySmUsr(uf)){
				action_perform = false;
			}else{
				lB.doLabBooking(bDB); //booking the lab for you				
				arlLabBkngHist = lB.getBookingHistory(uf);//getting lab booking history for you				
				action_perform = true;
			}					
			
		}

		if (action_perform == false) {
			errors_mesg.add("submitError", new ActionMessage("errors.login.fail"));
			saveErrors(request, errors_mesg);
			action_target = "failure";
		} else {
			request.getSession().setAttribute("userDetails", uf);
			HttpSession session = request.getSession();
			session.setAttribute("logined","true");
			session.setAttribute("BookingHist", arlLabBkngHist);//hold the booking history in arraylist
			session.setAttribute("timeSlot", hmLabSlot);
			session.setAttribute("context", new java.util.Date());
			action_target = "success";
		}
		return mapping.findForward(action_target);
	}
}
