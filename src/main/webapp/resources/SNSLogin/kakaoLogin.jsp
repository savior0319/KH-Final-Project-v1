<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('7b287e68e4697fdbefefb672e3ed43de');
    // 카카오 로그인 버튼을 생성합니다.
     Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        var token = authObj.access_token;
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
        	  console.log(res.properties);
           // location.href="./result?name="+res.propertise.nickname;
          	$.ajax({
          		url : '/kakaoCallback.diet',
          		data : {'kakaoId' : res.id,
          			'kakaoToken' : token      			
          		},
          		success : function(){
          			alert(res.properties.nickname+'님 환영합니다.');
          			location.href="/index.jsp"
          		}
          	});
          
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
