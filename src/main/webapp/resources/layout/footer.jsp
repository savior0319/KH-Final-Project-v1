<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="ui section divider"></div>
<div class="ui vertical footer segment">
	<div class="ui center aligned container">
		<div class="ui stackable divided grid">
			<div class="five wide column">
				<h3 class="ui header" style="text-decoration:underline;">고객센터</h3>
				<i class="envelope icon"></i>
				<span class="ui small header">savior0319@gmail.com</span><br><br>
				<div style="color: gray;">
					문의사항은 관리자에게 게시판 또는 이메일 주소로<br>
					연락주시면 빠른 시일내에 회신드리도록 하겠습니다<br>
				</div>
				<button class="ui gray button" style="margin-top: 15px;" onclick="question();">관리자에게</button>
			</div>
			<div class="six wide column">
				<h3 class="ui header" style="text-decoration:underline;">사이트 정보</h3>
				<div style="color: gray">
					(주)다이어트 Diet Co.,Ltd. 대표 안형조<br>
					본점 : 사업자등록번호 000-00-00000<br>
					서울시 영등포구 영등포로 00, 000호(당산동1가, 이레빌딩)<br>
					사업자번호조회<br>
					지점 : 사업자등록번호 000-00-00000<br>
					서울시 영등포구 영등포로 00, 0층 (영등포)<br>
					통신판매업신고 제2018-서울영등포0000<br>
					건강기능식품판매업 제2018-0000000 (영등포)<br>
				</div>
			</div>
			<div class="five wide column">
				<h3 class="ui header" style="text-decoration:underline;">공지사항</h3>
				<div style="color: gray;">
					공지 <br>
					공지 <br>
					공지 <br>
					공지 <br>
					공지 <br>
					공지 <br>
					공지 <br>
				</div>
			</div>
		</div>
		<div class="ui section divider" style="margin-bottom: 10px;"></div>
		<div style="color: gray">
			사이트에서 제공하는 모든 콘텐츠의 저작권은 제공처 또는 다이어트에 있으며, 이를 무단 이용 및 재배포하는 경우 저작권 법에 등에 따라 법적책임을 질 수 있습니다<br><br>
		</div>
	</div>
</div>

<!-- 1:1 문의하기 -->
<div class="ui modal" id="questionModal">
	<i class="close icon"></i>
	<div class="ui large header">관리자에게 문의하기</div>
	<div class="ui left aligned basic segment">
		<br>
		<div class="ui form" style="font-weight: 600;">
			<label>제목</label>
			<input type="text" placeholder="제목입력" id="title" style="margin-top: 5px;">
			<br>
			<br>
			<div class="field">
				<label>내용</label>
				<textarea placeholder="내용 입력" style="height: 312px;" id="content"></textarea>
			</div>
		</div>
	</div>
	<div class="ui right aligned basic segment" style="padding-top: 0px; margin-top: 0px;">
		<button class="ui blue button" onclick="questionSub();">문의하기</button>
	</div>
</div>

<script type="text/javascript">
	function question(){
		$('#questionModal').modal({
			centered: false
		}).modal('show');
	}

	function questionSub(){

		var title = $('#title').val();
		var content = $('#content').val();

		$.ajax({
			url : '/question.diet',
			type : 'post',
			data : {'title' : title, 'content' : content},

			success : function(data){
				if(data == '1'){
					alert('문의등록 완료');
					location.href="/"
				} else {
					alert('문의등록 실패');
				}
			}, 
			error : function(){
				alert('문의등록 실패');
			}
		});
	}
</script>