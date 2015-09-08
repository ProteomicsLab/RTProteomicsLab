package com.vlab.register.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.vlab.util.ConnectionUtils;
import com.vlab.util.DbUtils;

public class UserRegistration extends User{

	private static final long serialVersionUID = 1L;
	
	public boolean newuserregistration() throws Exception
	{
		PreparedStatement psUserRegistration = null;
		String sqlUserRegistration = null;
		
		boolean isRegistered = false;
		
		Connection conn = ConnectionUtils.getConnection();
		
/*		sqlUserRegistration = "insert into user_master(sEmail, sPassword, sFirstName," +
							  " sLastName, cGender, iUserType, sCreatedDate, cStatus,sUserID)" +
							  " values(?,md5(?),?,?,?,1,sysdate(),'A',?)";
		
*/		sqlUserRegistration = 	"INSERT INTO remote_lab.user_master "+ 
								"(user_name, password, f_name, l_name, sex, email_id, profession, institution,created_date)  "+
								"VALUES (?, md5(?), ?, ?, ?,?, ?,?,sysdate()) ";

		
		try{
			psUserRegistration = conn.prepareStatement(sqlUserRegistration);
			psUserRegistration.setString(1, this.getUserId());
			psUserRegistration.setString(2, this.getPassword());
			psUserRegistration.setString(3, this.getFirstName());
			psUserRegistration.setString(4, this.getLastName());
			psUserRegistration.setString(5, this.getGender());
			psUserRegistration.setString(6, this.getEmail());
			psUserRegistration.setString(7, this.getProfession());
			psUserRegistration.setString(8, this.getInstitution());
			psUserRegistration.executeUpdate();
			
			isRegistered=true;
		}
		catch(Exception e)
		{
			String errorMessage=e.getMessage(); 
		    e.printStackTrace();
		    if(errorMessage.indexOf("Duplicate entry")>=0)
		    {
		    	this.setDbError("error");
		    }
			isRegistered=false;
			e.printStackTrace();
		}
		DbUtils.close(psUserRegistration, conn);
		
		return isRegistered;
	}
}
