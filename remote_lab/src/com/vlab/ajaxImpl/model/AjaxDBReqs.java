package com.vlab.ajaxImpl.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.vlab.util.ConnectionUtils;
import com.vlab.util.DbUtils;

public class AjaxDBReqs {
	public boolean checkLabAvailability(String lab_time, String lab_date,int avail_expr) {

		boolean isExist= false;
		try{
		  try{
			Connection conn = ConnectionUtils.getConnection();
			
			//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/mm/dd");
		    //Date convertedDate = (Date) dateFormat.parse(lab_date);
		    
			String delims = "-";
			String[] tokens = lab_date.split(delims);
			
			lab_date=tokens[2]+"-"+tokens[1]+"-"+tokens[0];
			
			
		    java.sql.PreparedStatement psChkLabAvail = null;
		    ResultSet rsChkLabAvail = null;

		    String sqlCkhLabAvail = "SELECT idlab_booking, user_master_id, slot_master_id, booking_date, created_date, status "+
									"FROM remote_lab.lab_booking_tb "+
									"WHERE booking_date=? and slot_master_id=? and exp_id = ?";
			
			psChkLabAvail = conn.prepareStatement(sqlCkhLabAvail);
			psChkLabAvail.setString(1, lab_date);
			psChkLabAvail.setInt(2, Integer.parseInt(lab_time));
			psChkLabAvail.setInt(3, avail_expr);
			
			rsChkLabAvail = psChkLabAvail.executeQuery();
			
			if(rsChkLabAvail.next())
			{
				isExist = true; 
			}
			DbUtils.close(rsChkLabAvail, psChkLabAvail, conn);
		  }
		  catch (SQLException s){
			System.out.println("SQL code does not execute.");
		  }    
		}
		catch (Exception e){
		  e.printStackTrace();
		}
		
		return isExist;
  }

}
