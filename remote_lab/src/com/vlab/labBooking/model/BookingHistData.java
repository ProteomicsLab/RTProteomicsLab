package com.vlab.labBooking.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class BookingHistData implements Serializable{

	private static final long serialVersionUID = 5701504549787507028L;
	
	private int idlab_booking;
	private int user_master_id;
	private int slot_master_id;
	private String slot_desc;
	private Date booking_date; 
	private Timestamp created_date;
	private int status;
	private String status_desc;
	private String avail_expr;
	
	public String getAvail_expr() {
		return avail_expr;
	}
	public void setAvail_expr(String avail_expr) {
		this.avail_expr = avail_expr;
	}
	public String getSlot_desc() {
		return slot_desc;
	}
	public void setSlot_desc(String slot_desc) {
		this.slot_desc = slot_desc;
	}
	public String getStatus_desc() {
		return status_desc;
	}
	public void setStatus_desc(String status_desc) {
		this.status_desc = status_desc;
	}
	public int getIdlab_booking() {
		return idlab_booking;
	}
	public void setIdlab_booking(int idlab_booking) {
		this.idlab_booking = idlab_booking;
	}
	public int getUser_master_id() {
		return user_master_id;
	}
	public void setUser_master_id(int user_master_id) {
		this.user_master_id = user_master_id;
	}
	public int getSlot_master_id() {
		return slot_master_id;
	}
	public void setSlot_master_id(int slot_master_id) {
		this.slot_master_id = slot_master_id;
	}
	public Date getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	public Timestamp getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Timestamp created_date) {
		this.created_date = created_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}

