package com.vlab.labBooking.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.mysql.jdbc.Statement;
import com.vlab.login.actions.UserForm;
import com.vlab.util.ConnectionUtils;
import com.vlab.util.DbUtils;
import com.vlab.labBooking.model.*;

public class LabBooking {

	public ArrayList getBookingHistory(UserForm uf) throws Exception {
		// TODO Auto-generated method stub

		PreparedStatement psBookingHist = null;
		ResultSet rsBookingHist = null;
		String sqlBookingHist = null;

		boolean isLoginValidate = false;
		ArrayList alBookingHistory = new ArrayList();
		Connection conn = ConnectionUtils.getConnection();
		BookingHistData bkngHistData;
		
		
		sqlBookingHist = 	"SELECT idlab_booking, a.user_master_id,  b.slot_name,  a.booking_date, a.created_date, c.status_desc, d.exp_name "+ 
							"FROM lab_booking_tb a, slot_master b ,status_master c, exp_master d "+
							"WHERE user_master_id = (select id_user_master from user_master where user_master.user_name = ?) "+
							"and (a.slot_master_id=b.idslot_master) and (a.status = c.id_status) and (a.exp_id = d.exp_id) order by a.booking_date desc";

		
		psBookingHist = conn.prepareStatement(sqlBookingHist);
		psBookingHist.setString(1, uf.getUsername().toUpperCase());		
		rsBookingHist = psBookingHist.executeQuery();

		while(rsBookingHist.next()){			
			bkngHistData = new BookingHistData();
			bkngHistData.setBooking_date(rsBookingHist.getDate("a.booking_date"));
			bkngHistData.setUser_master_id(rsBookingHist.getInt("a.user_master_id"));
			//bkngHistData.setSlot_master_id(rsBookingHist.getInt("slot_master_id"));
			bkngHistData.setSlot_desc(rsBookingHist.getString("b.slot_name"));
			//bkngHistData.setStatus(rsBookingHist.getInt("status"));
			bkngHistData.setStatus_desc(rsBookingHist.getString("c.status_desc"));
			bkngHistData.setAvail_expr(rsBookingHist.getString("d.exp_name"));
			alBookingHistory.add(bkngHistData);
		}
		
		DbUtils.close(rsBookingHist, psBookingHist, conn);

		return alBookingHistory;
	}

	//for populating Lab time combo-box on available_bookings.jsp page
	public HashMap getLabSlotCombo() throws Exception { 
		// TODO Auto-generated method stub
		HashMap hmLabslotCombo = new HashMap();
		Connection conn = ConnectionUtils.getConnection();
		
		ResultSet rsSlotCombo = null;
		String sqlSlotCombo = null;		

		sqlSlotCombo = "SELECT idslot_master, slot_name " +
					   "FROM remote_lab.slot_master;";
		
		java.sql.Statement stmtSlotCombo = conn.createStatement();
		rsSlotCombo = stmtSlotCombo.executeQuery(sqlSlotCombo);
		
		while(rsSlotCombo.next()){
			hmLabslotCombo.put(rsSlotCombo.getInt("idslot_master"), rsSlotCombo.getString("slot_name"));			
		}
		
		return hmLabslotCombo;
	}

	//public boolean doLabBooking(UserForm uf) throws Exception {
	public boolean doLabBooking(BookingDataBean bDB) throws Exception {
	
		// TODO Auto-generated method stub
		String bookingDate = bDB.getBookingDate();
		int avail_expr = bDB.getAvail_expr();
		String delims = "-";
		String[] tokens = bookingDate.split(delims);
		
		bookingDate=tokens[2]+"-"+tokens[1]+"-"+tokens[0];

		Connection conn = ConnectionUtils.getConnection();
		PreparedStatement psdoLabBook = null;
		int decision=0;
		String sqldoLabBook = null;

		sqldoLabBook = 	"INSERT INTO remote_lab.lab_booking_tb "+
						"(user_master_id, slot_master_id, booking_date, created_date, status,exp_id) "+ 
						"VALUES ((select id_user_master from user_master where user_master.user_name = ?), " +
						"?, ?, current_timestamp, 1,?) ";
		
		psdoLabBook = conn.prepareStatement(sqldoLabBook);
		psdoLabBook.setString(1, bDB.getUser_name().toUpperCase());		
		psdoLabBook.setInt(2, bDB.getTimeSlot());
		psdoLabBook.setString(3, bookingDate);
		psdoLabBook.setInt(4, avail_expr);
		decision = psdoLabBook.executeUpdate();

		if(decision !=0){
			return true;
		}else{
			return false;
		}
		
	}

	public HashMap getAvailExpr(UserForm uf) throws Exception {
		// TODO Auto-generated method stub
		HashMap hmAvailExpr = new HashMap();
		Connection conn = ConnectionUtils.getConnection();
		
		ResultSet rsAvailExpr = null;
		String sqlAvailExpr = null;		

		sqlAvailExpr = "SELECT exp_id, exp_name "+
					   "FROM remote_lab.exp_master ";
		
		java.sql.Statement stmtAvailExpr = conn.createStatement();
		rsAvailExpr = stmtAvailExpr.executeQuery(sqlAvailExpr);
		
		while(rsAvailExpr.next()){
			hmAvailExpr.put(rsAvailExpr.getInt("exp_id"), rsAvailExpr.getString("exp_name"));			
		}
		
		return hmAvailExpr;

	}

	public boolean checkLabSlotBlockbySmUsr(UserForm uf) {
		// TODO Auto-generated method stub
		boolean isExist= false;
		try{
		  try{
			Connection conn = ConnectionUtils.getConnection();
			
			//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/mm/dd");
		    //Date convertedDate = (Date) dateFormat.parse(lab_date);
		    String lab_date = uf.getLabDate();
		    int lab_time = uf.getLabTime();
			String delims = "-";
			String[] tokens = lab_date.split(delims);
			
			lab_date=tokens[2]+"-"+tokens[1]+"-"+tokens[0];
			
			
		    java.sql.PreparedStatement psChkLabAvail = null;
		    ResultSet rsChkLabAvail = null;

		    String sqlCkhLabAvail = "SELECT idlab_booking, user_master_id, slot_master_id, booking_date, created_date, status "+
									"FROM remote_lab.lab_booking_tb "+
									"WHERE booking_date=? and slot_master_id=? and user_master_id=(select id_user_master from user_master where user_master.user_name = ?)";
			
			psChkLabAvail = conn.prepareStatement(sqlCkhLabAvail);
			psChkLabAvail.setString(1, lab_date);
			psChkLabAvail.setInt(2, lab_time);
			psChkLabAvail.setString(3, uf.getUsername());
			
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
