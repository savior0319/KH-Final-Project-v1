<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>마이페이지</title>
</head>

<!-- CSS -->
<style>
.myInfoUpdateContents {
	width: 100%;
	height: 505px;
	position: relative;
	box-sizing: border-box;
}

.gender_Image {
	width: 70%;
	height: 35%;
	float: left;
	box-sizing: border-box;
}

.myInfoTable {
	margin-top: 180px;
	width: 100%;
	height: 60.5%;
	border: 1px solid lightgray;
	box-sizing: border-box;
}

.Btn {
	border: 1px solid lightgray;
	width: 30%;
	height: 35%;
	position: relative;
	float: left;
	padding-top: 50px;
	border-radius: 31px;
	box-sizing: border-box;
}

.gender_Image>div {
	width: 50%;
	height: 100%;
	border: 1px solid lightgray;
	position: relative;
	float: left;
	border-radius: 31px;
	box-sizing: border-box;
}

.gender_Image img {
	width: 115px;
	height: 115px;
	border-radius: 51px;
	overflow: hidden;
	margin-top: 25px;
	box-sizing: border-box;
}

.firstTd {
	background-color: lightgray;
}

.selected {
	background: orange;
}

.fileBox .fileName {
	display: inline-block;
	width: 190px;
	height: 30px;
	padding-left: 10px;
	margin-right: 5px;
	line-height: 30px;
	border: 1px solid #aaa;
	background-color: #fff;
	vertical-align: middle
}

.fileBox .btn_file {
	display: inline-block;
	border: 1px solid #000;
	width: 100px;
	height: 30px;
	font-size: 0.8em;
	line-height: 30px;
	text-align: center;
	vertical-align: middle
}

.fileBox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="ui container">
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br>
			<div class="myInfoUpdateContents">
				<div class="gender_Image">
					<div class="gender_Img1">
						<img id="femailImage"
							src="https://st2.depositphotos.com/1432405/11185/v/950/depositphotos_111854370-stock-illustration-woman-icon-simple-style.jpg" />
						<div class="ui radio checkbox">
							<input type="radio" class="radio" id="female" name="gender"
								value="F" checked="checked"> <label>여 자</label>
						</div>
					</div>
					<div class="gender_Img1">
						<img id="mailImage"
						
							src="https://st.depositphotos.com/1010146/4669/v/950/depositphotos_46693561-stock-illustration-formal-man-icon.jpg" />
						<div class="ui radio checkbox">
							<input type="radio" class="radio" id="male" name="gender"
								value="M"> <label>남 자</label>
						</div>
					</div>
				</div>
				<div class="Btn">
					<button type="button" class="ui yellow button"
						id="updatePictureBtn" style="width: 140px;">사진등록/변경</button>
					<br>
					<button type="button" class="ui button" id="deletePictureBtn" onclick="deletePictureBtn();"
						style="margin-top: 10px; width: 140px;">사진 삭제</button>
				</div>
				<br>
				
				<div class="myInfoTable">
				<form action = "/myInfoUpdate.do" method = "post">
					<table class="ui celled table">
						<tbody>
							<tr>
								<td class="firstTd" style="width: 250px;"><h3>
										<i class="shield alternate icon"></i>등급
									</h3></td>
								<td><strong>입문 다이어터&nbsp;&nbsp;</strong>
									<button class="ui button">
										<strong>등급안내</strong>
									</button>
								</td>
							</tr>
							<tr>
								<td class="firstTd"><h3>
										<i class="shield alternate icon"></i>계정
									</h3></td>
								<td>
									<div class="ui input focus">
										<input type="text" id="account" name="account" value=""
											readonly placeholder="이메일 계정" style="width: 300px;">
									</div>
								</td>
							</tr>
							<tr>
								<td class="firstTd"><h3>
										<i class="shield alternate icon"></i>비밀번호 재설정
									</h3>
								</td>
								<td>
									<div class="ui input focus">
										<input type="password" placeholder="비밀번호" id="password"
											name="password" style="width: 300px;">
									</div>
								</td>
							</tr>
							<tr>
								<td class="firstTd"><h3>
										<i class="shield alternate icon"></i>닉네임
									</h3>
								</td>
								<td>
									<div class="ui input focus">
										<input type="text" placeholder="닉네임" id="nickName"
											name="nickName" style="width: 300px;">
									</div>
								</td>
							</tr>
							<tr>
								<td class="firstTd"><h3>
										<i class="shield alternate icon"></i>다짐
									</h3>
								</td>
								<td><div class="ui input focus">
										<input type="text" placeholder="한 줄 다짐" id="promise"
											name="promise" style="width: 500px;">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="submit" value = "수정" class="ui red button" id="updateInfoBtn" />
					<input type="reset"  value = "취소" class="ui button" id="updateCancleBtn" /> 
					</form>
				</div>
			</div>

			<!--  ui container 닫기  -->
		</div>
	</div>
	
	<!-- 프로필 이미지 변경 모달 -->

	<div class="ui modal" id="updateProfile">
		<i class="close icon"></i>
		<div class="header">프로필 사진 변경</div>
		<div class="image content">
			<div class="description">
				<div class="ui header">
					<div class="fileBox">
						<input type="text" class="fileName" readonly="readonly"> <label
							for="uploadBtn" class="btn_file">찾아보기</label> <input type="file"
							id="uploadBtn" class="uploadBtn">
					</div>
				</div>
			</div>
			<div class="actions">
				<div class="ui positive right labeled icon button">
					업데이트 <i class="checkmark icon"></i>
				</div>
				<div class="ui black deny button">취소</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	/*사진등록,변경 이미지 클릭시 배경색 변경*/
	$(document).ready(function() {
		$(".gender_Image>div").each(function() {
			$(this).click(function() {
				$(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
				$(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
			});
		});
	});
	/* 사진등록,변경버튼 클릭시 모달 보여주기 */
	$("#updatePictureBtn").click(function() {
		$('#updateProfile').modal('show');
	});
	
	/* 모달 파일 input 부분 스크립트 */
	var uploadFile = $('.fileBox .uploadBtn');
	uploadFile.on('change', function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$(this).siblings('.fileName').val(filename);
	});
	
	/* 프로필 사진 삭제  */
	
	function deletePictureBtn(){
		var result = window.confirm("사진을 삭제하시겠습니까?");
		if(result){
			alert("사진 삭제가 완료되었습니다.");
		}else{
			alert("사진 삭제 취소하셨습니다.");
		}
	}
</script>

</html>