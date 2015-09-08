package com.vlab.register.actions;

import org.apache.struts.validator.ValidatorForm;

public class UserRegisterForm extends ValidatorForm{

    private static final long serialVersionUID = 1L;

    private String emailid;
    private String password;
    private String cpassword;
    private String firstname;
    private String lastname;
    private String gender;
    private String userId;
    private String profession;
	private String institution;
    
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private String submitError;

    public String getSubmitError() {
        return submitError;
    }
    public void setSubmitError(String submitError) {
        this.submitError = submitError;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmailid() {
        return emailid;
    }
    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }
    public String getCpassword() {
        return cpassword;
    }
    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }
    public String getFirstname() {
        return firstname;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastname() {
        return lastname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
    public String getInstitution() {
		return institution;
	}
	public void setInstitution(String institution) {
		this.institution = institution;
	}

}