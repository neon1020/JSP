package jsp13_java_mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// 자바 메일 기능 사용 시 메일 서버 (ex Gmail 등) 인증을 위한 인증 정보 관리하는
// javax.mail.Authenticator 클래스를 상속받는 서브클래스 정의
public class GoogleSMTPAuthenticator extends Authenticator {
	// 인증 정보(아이디, 패스워드) 관리할 javax.mail.Authenticator 클래스 타입 변수 선언
	PasswordAuthentication passwordAuthentication;

	// 기본 생성자 정의
	public GoogleSMTPAuthenticator() {
		// 인증에 사용할 아이디와 패스워드 정보를 갖는 PasswordAuthentication 객체 생성
		// => 파라미터로 계정명과 패스워드 전달
		// => Gmail 기준 2단계 인증 미사용 시 Gmail 계정명, 패스워드 전달
		// => Gmail 기준 2단계 인증 사용 시 Gmail 계정명과 함께 패스워드 대신 2단계 인증을 우회하는 앱비밀번호 전달
		//    (구글 계정 설정 - 보안 - Google 에 로그인 항목의 앱 비밀번호 설정 필요)
		//    (생성 항목 : 앱선택 = 메일, 기기 선택 = Windows 컴퓨터)
		//    => 생성 완료 시 나타나는 앱 비밀번호를 사용해야함
		passwordAuthentication = new PasswordAuthentication("sdyeon95", "rchdhlhntdjdwdir");
	}

	// 인증 정보를 관리하는 PasswordAuthentication 객체를 외부로 리턴하는 getPasswordAuthentication() 메소드 오버라이딩
	// => 주의! Getter 메소드 정의 시 변수명에 따라 메소드명이 달라질 수 있으므로 직접 정의하지 말 것!
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
}