package com.vlab.register.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.vlab.register.model.UserRegistration;

public class UserRegistrationAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        boolean action_perform = false;
        String action_target;

        UserRegistration u = new UserRegistration();

        ActionMessages errors_mesg = new ActionMessages();

        UserRegisterForm uf = (UserRegisterForm) form;

        if (form != null) {
            u.setEmail(uf.getEmailid());
            u.setPassword(uf.getPassword());
            u.setFirstName(uf.getFirstname());
            u.setLastName(uf.getLastname());
            u.setGender(uf.getGender());
            u.setUserId(uf.getUserId());
            u.setInstitution(uf.getInstitution());
            u.setProfession(uf.getProfession());
            
            action_perform = u.newuserregistration();

            String sError=u.getDbError();
            if(sError.equalsIgnoreCase("error"))
            {
                errors_mesg.add("submitError",
                    new ActionMessage("errors.user.registration.email.duplicate"));
                saveErrors(request,errors_mesg);
            }
        }

        if (action_perform == false) {
            errors_mesg.add("submitError",
                    new ActionMessage("errors.user.registration.fail"));
            saveErrors(request, errors_mesg);
            action_target = "failure";
        } else {
            errors_mesg.add("submitError",
                    new ActionMessage("errors.user.registration.success"));
            saveErrors(request, errors_mesg);
            action_target = "success";
        }

        return mapping.findForward(action_target);
    }
}