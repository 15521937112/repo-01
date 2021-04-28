package com.jiaying.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jiaying.student.Student;

//通用的数据操作方法
public class DBUtil {
	private static final String URL  ="jdbc:mysql://localhost:3306/t_user?serverTimezone=UTC" ;
	private static final String USERNAME  ="root" ;
	private static final String PASSWORD  ="123456" ;
	public static PreparedStatement pstmt = null ;
	public static Connection connection = null ;
	public static ResultSet rs = null ; 
	//获取连接
		public static Connection getConnection() throws ClassNotFoundException, SQLException {
			 Class.forName("com.mysql.cj.jdbc.Driver") ;
			 return  DriverManager.getConnection( URL,USERNAME,PASSWORD ) ;
		}
		
		//关闭连接
		public static void closeAll(ResultSet rs,Statement stmt,Connection connection)
		{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(connection!=null)connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			
			
		}
			
	      //创建prepareStatement
       public static PreparedStatement createPreParedStatement(String sql,Object[] params) throws ClassNotFoundException, SQLException {
			  pstmt = getConnection() .prepareStatement( sql) ;
			  if(params!=null ) {
				  for(int i=0;i<params.length;i++) {
					  pstmt.setObject(i+1, params[i]);
				  }
			  }
			  return pstmt;
		}
		
	//通用的：查询总数
	public static int getTotalCount(String sql ) {//select count(*) from xx ;
		int count = -1 ;
		try {
			pstmt = createPreParedStatement(sql, null) ;
			rs = pstmt.executeQuery() ;//88
			if(rs.next()) {
				count= rs.getInt( 1 ) ;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, connection);
		}
		return count ;
	}
	


	
	
	
	
	//通用的增删改
	  public static boolean executeUpdate(String sql,Object[] params) {
		try {  
			
			  pstmt = createPreParedStatement(sql,params);
			  int count = pstmt.executeUpdate() ;
			  if(count>0)
				  return true ;
			  else 
				  return false ;
			  
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			  return false ;
		} catch (SQLException e) {
			e.printStackTrace();
			  return false ;
		}catch (Exception e) {
			e.printStackTrace();
			return false ;
		}
		finally {
			closeAll(null,pstmt,connection);
		}
}
	
	
		//通用的查  :通用 表示  适合与 任何查询
		public static ResultSet executeQuery( String sql ,Object[] params) {//select xxx from xx where name=? or id=?
//			Student student = null;
//		
//			List<Student> students = new ArrayList<>();
			try {
				
				
				
				pstmt = createPreParedStatement(sql,params);
				 rs =  pstmt.executeQuery() ;
				  return rs ;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return null ; 
			} catch (SQLException e) {
				e.printStackTrace();
				return null ; 
			}catch (Exception e) {
				e.printStackTrace();
				return null ; 
			}
	
		}
	
	
	
	
	
}
