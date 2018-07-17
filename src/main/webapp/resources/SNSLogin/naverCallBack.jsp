<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
    String clientId = "fAzL7esFrw6RrU99XyKO";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "jmT7U3eQQX";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://127.0.0.1/index.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.println("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      int temp = 0;
       while ((inputLine = br.readLine()) != null) {
         res.append(inputLine);
         if(temp == 1){
	         access_token = inputLine;
         }
       	 temp++;
       }
      br.close();
      if(responseCode==200) {
    	  String str = access_token.replace("access_token", "");
    	    access_token = str.replace(":", "");
    	    str = access_token.replace("\"", "");
    	    access_token = str.replace(",", "");

    	  System.out.println("inputLine : " + access_token);
        out.println(res.toString());
      }
      
      
    } catch (Exception e) {
      System.out.println(e);
    }
    
    RequestDispatcher view = request.getRequestDispatcher("/navercallback");
    request.setAttribute("token", access_token);
    view.forward(request, response);
    
  %>
  
</body>
</html>