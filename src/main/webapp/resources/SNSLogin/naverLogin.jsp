<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.net.URLEncoder" %>
	<%@ page import="java.security.SecureRandom" %>
	<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트</title>
</head>

<!-- CSS -->
<style>

</style>

<body>
		<div class="snsLogin">
			<h4>SNS 계정으로 로그인</h4>
			<%
		    String clientId = "dLGZqiGmEAaTdfOSAIv1";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://127.0.0.1/views/member/naverCallBack.jsp", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    session.setAttribute("state", state);
		 	%>
			<ul class="snsList">
			<br>
				<li><a href="<%=apiURL%>"><img src="/img/loginByNaver.PNG" class="img-responsive"></a></li>
			<br>
			</ul>
		</div>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
   
</script>

</html>