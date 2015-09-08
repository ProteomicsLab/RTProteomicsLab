package com.vlab.login.actions;

import org.apache.struts.validator.ValidatorForm;

public class UserForm extends ValidatorForm{
	
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
    private String submitError;
    private int LabTime;
    private String LabDate;
    private int userId;

    public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getLabTime() {
		return LabTime;
	}
	public void setLabTime(int labTime) {
		LabTime = labTime;
	}
	public String getLabDate() {
		return LabDate;
	}
	public void setLabDate(String labDate) {
		LabDate = labDate;
	}
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
