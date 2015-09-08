package com.vlab.labBooking.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.struts.chain.commands.servlet.ValidateActionForm;
import org.apache.struts.validator.ValidatorForm;

public class BookingDataBean extends ValidatorForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2600467653331966311L;
	private String bookingDate;
	private int timeSlot;
	private String user_name;
	private int avail_expr;
	
	
	public int getAvail_expr() {
		return avail_expr;
	}
	public void setAvail_expr(int avail_expr) {
		this.avail_expr = avail_expr;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public int getTimeSlot() {
		return timeSlot;
	}
	public void setTimeSlot(int timeSlot) {
		this.timeSlot = timeSlot;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
}

