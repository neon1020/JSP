package jsp12_dbcp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// study_jsp3.board 테이블의 데이터 처리 작업 담당하는 BoardDAO 클래스 정의
public class BoardDAO {
	
	// alt + shift + z : try-catch
	
	// 글쓰기 작업 수행하는 insert 메소드
	public int insert(BoardDTO board) {
		// 블럭과 관계없이 사용하기 위해 여기서 선언
		int insertCount = 0; // 리턴할 데이터를 저장하는 변수 선언
		
		// 변수 선언
		// 복수개의 구문을 각각 실행해야 할 경우 같은 타입 변수 복수개 선언
		// => Resource leak(자원 누수) 방지 위해 변수 각각 선언
		Connection con = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;

		try {
			// 0 ~ 2 단계 공통 작업
			// DB 연결 작업 수행하는 공통 메소드 getConnection() 호출하여 Connection 객체 리턴
			con = JdbcUtil.getConnection();

			// board 테이블에 폼 파라미터 사용하여 글쓰기 작업 수행(INSERT)
			// 글번호(idx) = 가장 큰 번호 + 1 으로 설정
			// 작성일(date) = 데이터베이스의 now() 함수 사용 (자바 함수 x)
			// 조회수(readcount) = 기본값 0으로 설정

			// 1) 새 글 번호 계산 : 데이터베이스 max() 함수 활용
			int idx = 1; // 새 글 번호 저장할 변수 선언 (기본값 1)

			// 3단계
			// MAX(컬럼명) 함수 사용하여 특정 컬럼에서 가장 큰 값 조회 가능
			String sql = "SELECT MAX(idx) FROM board";
			pstmt = con.prepareStatement(sql);

			// 4단계
			rs = pstmt.executeQuery();

			if (rs.next()) {
				idx = rs.getInt(1) + 1;
			}

			// 2) 글 등록하기 (INSERT)
			// 3단계
			sql = "INSERT INTO board VALUES(?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);

			// 작성자, 패스워드, 제목, 내용은 BoardDTO 객체에 저장되어 있으므로
			// BoardDTO 객체의 Getter 메소드 호출하여 각 데이터 꺼내서 전달
			pstmt2.setInt(1, idx);
			pstmt2.setString(2, board.getName());
			pstmt2.setString(3, board.getPasswd());
			pstmt2.setString(4, board.getSubject());
			pstmt2.setString(5, board.getContent());

			// 4단계
			// insertCount 변수에 저장 후 리턴
			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - insert() : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 예외 발생 여부 관계 없이 마지막에 항상 실행되는 블럭
			// try-catch 블럭 내에서 return 문 만나더라도 finally 블럭 실행 후 리턴됨
			// DB 애플리케이션에서 주로 자원반환 등의 용도로 사용되는 블럭
			// 관련 객체에서 지원하는 close() 메소드 호출하여 자원 반환 가능
			// 주의! 자원을 사용하기 위해 생성한 역순으로 반환해야함
//			try {
//				rs.close();
//				pstmt.close();
//				con.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
			
			// 별도로 정의된 close() 메소드 호출하여 자원 반환할 객체를 파라미터로 전달
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}

		return insertCount;
	}
}