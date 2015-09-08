package com.vlab.guacamole.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vlab.labBooking.model.BookingHistData;
import com.vlab.login.actions.UserForm;
import com.vlab.util.ConnectionUtils;
import com.vlab.util.DbUtils;

//Getting schedule for current logged in user
public class RLabScheduleInfo {

	public boolean getLabScheduleInCurrSlot(UserForm uf) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement psLabScheduleInCurrSlot = null;
		ResultSet rsLabScheduleInCurrSlot = null;
		String sqlLabScheduleInCurrSlot = null;

		boolean sch_matched = false;
		ArrayList alBookingHistory = new ArrayList();
		Connection conn = ConnectionUtils.getConnection();
		BookingHistData bkngHistData;

		sqlLabScheduleInCurrSlot = "SELECT idlab_booking, "+
			"user_master_id, "+
			"slot_master_id, "+
			"booking_date, "+
			"created_date, "+
			"status,CURRENT_TIME, current_date, b.exp_name "+
			"FROM remote_lab.lab_booking_tb a, remote_lab.exp_master b "+
			"WHERE user_master_id = (select id_user_master from user_master c where c.user_name=?) "+
			"AND booking_date = current_date and (a.exp_id = b.exp_id) "+
			"AND slot_master_id = (SELECT idslot_master from slot_master b where b.slot_time = SUBSTRING(CURRENT_TIME, 1,2)) ";


		psLabScheduleInCurrSlot = conn.prepareStatement(sqlLabScheduleInCurrSlot);
		psLabScheduleInCurrSlot.setString(1, uf.getUsername().toUpperCase());		
		rsLabScheduleInCurrSlot = psLabScheduleInCurrSlot.executeQuery();

/*		while(rsLabScheduleInCurrSlot.next()){			
			bkngHistData = new LabScheduleInCurrSlotData();
			bkngHistData.setBooking_date(rsLabScheduleInCurrSlot.getDate("a.booking_date"));
			bkngHistData.setUser_master_id(rsLabScheduleInCurrSlot.getInt("a.user_master_id"));
			//bkngHistData.setSlot_master_id(rsLabScheduleInCurrSlot.getInt("slot_master_id"));
			bkngHistData.setSlot_desc(rsLabScheduleInCurrSlot.getString("b.slot_name"));
			//bkngHistData.setStatus(rsLabScheduleInCurrSlot.getInt("status"));
			bkngHistData.setStatus_desc(rsLabScheduleInCurrSlot.getString("c.status_desc"));
			alLabScheduleInCurrSlotory.add(bkngHistData);
		}
*/
		if(rsLabScheduleInCurrSlot.next())
		{
			sch_matched = true; 
		}

		DbUtils.close(rsLabScheduleInCurrSlot, psLabScheduleInCurrSlot, conn);
		return sch_matched;

		//return null;

	}

	public boolean updateLabStatus(UserForm uf) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement psupdateLabStatust = null;
		//ResultSet rsLabScheduleInCurrSlot = null;
		String sqlupdateLabStatus = null;
		int iIsUpdateSuccess = 0;
		boolean updateStatus = false;
		ArrayList alBookingHistory = new ArrayList();
		Connection conn = ConnectionUtils.getConnection();
		BookingHistData bkngHistData;

		sqlupdateLabStatus = "UPDATE remote_lab.lab_booking_tb "+
		   					 "SET status = 2 "+//status 2 means it is used
		   					 "WHERE lab_booking_tb.user_master_id = (SELECT id_user_master FROM user_master WHERE user_master.user_name = ?) "+
		   					 "AND lab_booking_tb.slot_master_id = (SELECT idslot_master FROM slot_master b WHERE b.slot_time = SUBSTRING(CURRENT_TIME, 1, 2)) "+
		   					 "AND lab_booking_tb.booking_date = current_date ";
		
		psupdateLabStatust = conn.prepareStatement(sqlupdateLabStatus);
		psupdateLabStatust.setString(1, uf.getUsername().toUpperCase());		
		
		iIsUpdateSuccess = psupdateLabStatust.executeUpdate();
		
		if(iIsUpdateSuccess ==1){
			updateStatus = true;
		}
		
		return updateStatus;
		
	}

	public String getRemoteSysIp(UserForm uf) throws Exception {
		// TODO Auto-generated method stub
		String str_remote_sys_ip = "";
		PreparedStatement psRemSysIp = null;
		Connection conn = ConnectionUtils.getConnection();
		String sqlRemSysIp = null;
		ResultSet rsRemSysIp;

		sqlRemSysIp = "SELECT exp_remote_host_sys_ip "+ 
							"FROM remote_lab.exp_master "+
							"WHERE exp_id = (SELECT a.exp_id "+ 
							"FROM remote_lab.lab_booking_tb a, remote_lab.exp_master b "+
							"WHERE user_master_id = (select id_user_master from user_master c where c.user_name=?) "+
							"AND booking_date = current_date and (a.exp_id = b.exp_id) "+
							"AND slot_master_id = (SELECT idslot_master from slot_master b where b.slot_time = SUBSTRING(CURRENT_TIME, 1,2))) ";
		
		psRemSysIp = conn.prepareStatement(sqlRemSysIp);
		psRemSysIp.setString(1, uf.getUsername().toUpperCase());
		rsRemSysIp = psRemSysIp.executeQuery();
		
		while(rsRemSysIp.next()){
			str_remote_sys_ip = rsRemSysIp.getString("exp_remote_host_sys_ip");			
		}
		return str_remote_sys_ip;
	}

}
