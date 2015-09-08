package com.vlab.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.vlab.util.DbUtils;

import com.vlab.util.ConnectionUtils;

public class UserLogin extends User{

	private static final long serialVersionUID = 1L;
	
	public boolean doLogin() throws Exception
	{
		PreparedStatement psDoLogin = null;
		ResultSet rsDoLogin = null;
		String sqlDoLogin = null;
		
		boolean isLoginValidate = false;
		
		Connection conn = ConnectionUtils.getConnection();
		
		sqlDoLogin = "Select * from user_master " +
				     "  where user_name=? and password= md5(?)";
		
		psDoLogin = conn.prepareStatement(sqlDoLogin);
		psDoLogin.setString(1, this.getUsername());
		psDoLogin.setString(2, this.getPassword());
		rsDoLogin = psDoLogin.executeQuery();
		
		if(rsDoLogin.next())
		{
			isLoginValidate = true; 
		}

		DbUtils.close(rsDoLogin, psDoLogin, conn);
		
		return isLoginValidate;
	}
}
