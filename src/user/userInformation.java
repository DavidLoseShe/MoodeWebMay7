package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class userInformation {
	String url="jdbc:mysql://localhost/down";
	String driver="com.mysql.jdbc.Driver";
	Connection conn;
	Statement stmt;
	ResultSet rs;
	public userInformation()
	{
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,"root","123456");
			
			stmt=conn.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void openConnection()
	{
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,"root","123456");
			stmt=conn.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void closeConnection() throws SQLException
	{

		if(conn!=null){
		      conn.close();
		}
	}
	public boolean selectUser(String name,String password)
	{
		String sql="select * from user where username='"+name+"' and password='"+
				password+"'";
		try {
			this.openConnection(); 
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				//rs.close();
				//System.out.println()
			//	this.closeConnection();
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return false;
	}
	public users selectUserInf(String name){
		users u =new users();
		String sql="select * from user where username='"+name+"'";
		try {
			this.openConnection(); 
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				u.setUsername(rs.getString(1));
				u.setPassword(rs.getString(2));
				u.setClass1(rs.getString(3));
				u.setLike(rs.getString(6));
				u.setPersonal(rs.getString(5));
				u.setSex(rs.getString(4));
			}
		//	this.closeConnection();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return u;
	}
	public ResultSet selectjilu(){

		ResultSet rs1=null;
		String sql="select * from jilu";
		try {
			this.openConnection(); 
			rs1=stmt.executeQuery(sql);
			while(rs.next()){
			/*	j.setName(rs.getString(1));
				j.setTime(rs.getString(2));
				j.setKind(rs.getString(3));*/
			}}
		
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		return rs1;
	}
	
}