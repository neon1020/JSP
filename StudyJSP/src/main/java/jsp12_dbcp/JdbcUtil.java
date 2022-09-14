package jsp12_dbcp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {
	
	// 1. DB 접속을 수행하는 getConnection() 메소드 정의
	// => 파라미터 : 없음   리턴타입 : java.sql.Connection(con)
	public static Connection getConnection() {
		// DBCP 를 활용한 Connection 객체 리턴하기
		Connection con = null;
		
		// -------------------------------------------------------------------------------------------
		try {
			// context.xml 에 설정된 DBCP(커넥션풀)로부터 Connection 객체 가져오기
			// 1. 톰캣으로부터 context.xml 파일의 <Context> 태그 부분 객체 가져오기
			// => InitialContext 객체 생성하여 Context 타입으로 업캐스팅
			Context initCtx = new InitialContext();
			
			// 2. 생성된 Context 객체(initCtx)로부터 context.xml 파일의 <Resource> 태그 부분 객체 가져오기
			// => Context 객체의 lookup() 메소드를 호출하여 찾아올 리소스 지정
			// => 파라미터로 "java:comp/env" 문자열 전달
			// => 리턴되는 Object 타입 객체를 Context 타입 객체로 다운캐스팅하여 저장
			// Context envCtx = (Context)initCtx.lookup("java:comp/env");
			
			// 3. <Resource> 태그가 복수개 있을 경우 각각의 리소스를 구분하기 위해 지정한 이름(JNDI)을
			//    사용하여 해당 리소스 가져오기
			// => 생성된 Context 객체(envCtx)의 lookup() 메소드를 호출하여 찾아올 리소스의 이름(name 속성값) 지정
			// => 주의! context.xml 파일에 지정된 이름에 따라 문자열 내용은 변함
			// => 리턴되는 Object 타입 객체를 javax.sql.DataSource 타입으로 다운캐스팅하여 저장
			// DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQL");
			
			// 2번과 3번 작업 하나로 결합
			// 2번과 3번에서 지정한 문자열을 결합하여 하나의 lookup() 메서드를 통해 접근
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/MySQL");
			
			// 4. 커넥션 풀을 관리하는 DataSource 객체로부터 미리 생성되어 있는 Connection 객체 가져오기
			// => DataSource 객체의 getConnection() 메소드 호출(리턴타입 : java.sql.Connection)
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	// -----------------------------------------------------------------------------------------------
	
	// 2. DB 자원 반환을 수행하는 close() 메소드 정의
	// => 반환해야하는 대상 객체 : Connection, PreparedStatement, ResultSet
	// => 메소드 이름은 close() 로 통일하고, 파라미터 타입만 다르게 하는 오버로딩 활용하여 정의
	public static void close(Connection con) {
		try {
			if(con != null) { con.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt != null) { pstmt.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null) { rs.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}