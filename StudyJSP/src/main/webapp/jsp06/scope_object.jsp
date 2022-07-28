<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
[ 영역(Scope) 객체 ]
- JSP 내장 객체 중 각기 다른 영역(Scope)을 갖는 4대 영역 객체
  = page, request, session, application 영역에 대응하는 pageContext, request, session, application 객체
- 각 영역 객체에 저장되는 데이터를 속성(Attribute) 이라고 하며, 저장 및 가져오는 메소드가 동일
  => 데이터를 저장하는 메소드 : setAttribute()
       데이터를 가져오는 메소드 : getAttribute()

[ 각 영역 객체별 특징 ]
1. page 영역의 pageContext 객체
  - 현재 페이지 정보를 저장하고 관리하는 객체
  - 현재 페이지 내에서만 접근 가능
    => 페이지가 변경(이동)되면 현재 페이지 정보가 저장된 pageContext 객체가 제거되므로
         현재 페이지 정보는 사라지고, 새로운 페이지 정보를 관리하는 pageContext 객체가 생성됨

2. request 객체(매우 중요!)
  - 현재의 요청(request) 정보를 저장하고 관리하는 객체
  - 현재 요청에서부터 응답(response) 페이지까지는 접근 가능
    ex) "a.jsp" 페이지의 form 태그에서 "b.jsp" 페이지로 요청이 발생할 경우
         새로운 request 객체가 생성되고 응답 페이지인 "b.jsp" 페이지까지 request 객체가 유지됨
         (request.getParameter() 메소드)
    ex2) "a.jsp" 페이지에서 "Dispatcher 방식"의 포워딩(forward() 메소드 사용)을 통해 페이지를 이동할 경우
          새로운 request 객체가 생성되지 않고 그대로 request 객체가 유지됨
  - 만약, 새로운 요청이 발생하면 기존 request 객체가 제거되므로
    기존에 저장되어 있던 요청 정보가 사라지고 새로운 request 객체가 생성됨
    (새로운 요청이란? response.sendRedirect(), 하이퍼링크, 자바스크립트 location.href, URL 직접 입력 등)
  - 주의사항!
    form 태그 또는 URL 을 통해 전달된 파라미터값은 request.getParameter() 메소드로 가져올 수 있으며
    request.setAttribute() 메소드로 저장되어 전달받은 데이터는 request.getAttribute() 메소드로만 가져올 수 있다!

3. session 객체(중요!)
   - 클라이언트와 서버 간의 연결 정보를 저장하고 관리하는 객체
   - 페이지와 무관하게 웹브라우저가 동작하는 동안 유지되는 객체
   - 웹브라우저를 완전히 종료하거나, 세션 타이머가 만료되거나(= 기본값 1800초 = 30분),
     invalidate() 메서드를 호출하여 세션을 초기화하면 session 객체 정보가 제거됨
     (removeAttribute() 메소드는 단일 세션 속성 제거 가능한 메소드)
   ex) 로그인 시 세션 객체에 아이디를 저장하고, 로그아웃 수행 시 세션에 저장된 아이디 제거
   ex2) 쇼핑몰에서 비회원 상태에서 장바구니에 상품을 담고, 웹브라우저 종료 시 세션에 저장된 장바구니 제거

4. application 객체
   - 웹 애플리케이션 서버(WAS = 웹컨테이너 = 톰캣)에 대한 정보를 관리하는 객체
   - 웹 애플리케이션(= 프로젝트) 당 하나의 application 객체만 생성됨
     => 애플리케이션 전체 영역에서 하나의 객체를 공유함
        (세션은 접속자마다, 브라우저마다 새로운 session 객체 생성)
   - 서버가 시작되면 application 객체가 생성되고, 서버가 중단되면 객체가 제거됨

=======================================================================
[ 영역 객체의 공통 메서드 ]
1. setAttribute(String key, Object value)
   - key 에 해당하는 이름으로 value 에 해당하는 데이터를 저장(= 매핑)
   - key 에 해당하는 이름은 객체의 데이터를 구분하는 용도로 사용하며
     중복되는 key 값이 지정될 경우, 기존의 데이터를 덮어쓰게 됨
     => 하나의 key 에 저장될 수 있는 value(데이터)는 동시에 하나뿐이다!
   - Object 타입으로 전달되는 value(데이터)는 모든 타입을 사용 가능(= 만능 타입)
   ex) 사물함의 특정 번호를 key 로 지정하고, 해당 사물함 번호에 물건(value)을 저장하는 것

2. getAttribute(String key)
   - key 에 해당하는 value(데이터) 를 리턴(= 가져오기)
   - 리턴타입이 Object 타입(어떤 데이터든 모두 Object 타입으로 리턴됨)
     => 따라서, 상황에 따라 변수에 저장 등의 경우 형변환 연산자를 통해 데이터타입을 변환해야 할 수 있음
   ex) 사물의 번호를 key 로 사용하여 사물함 내에 저장된 물건(value)을 꺼내는 것

3. removeAttribute(String key)
   - key 값으로 등록되어 있는 key 와 value 를 모두 제거
 -->
</body>
</html>