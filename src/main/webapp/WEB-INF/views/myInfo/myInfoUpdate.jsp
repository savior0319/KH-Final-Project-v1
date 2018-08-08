<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<title>마이페이지</title>
</head>

<!-- CSS -->
<style>
.myInfoUpdateContents {
	width: 100%;
	height: 100%;
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
	height: auto;
	border: 1px solid lightgray;
	box-sizing: border-box;
}

.Btn {
	border: 1px solid lightgray;
	width: 30%;
	height: 181px;
	position: relative;
	float: left;
	padding-top: 50px;
	border-radius: 31px;
	box-sizing: border-box;
}

.gender_Image>div {
	width: 50%;
	height: 181px;
	border: 1px solid lightgray;
	position: relative;
	float: left;
	border-radius: 31px;
	box-sizing: border-box;
}

.gender_Image img {
	width: 115px;
	height: 125px;
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

	<div class="ui container">
		<div class="ui center aligned basic segment">
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br>
			<c:if test="${sessionScope.member!=null}">
				<form action="/updateMyInfo.diet" method="post"
					onsubmit="return checkInfo();">
					<div class="myInfoUpdateContents">
						<div class="gender_Image">
							<c:if test="${member.mbGender=='f'}">
								<div class="gender_Img1">
									<img id="femailImage" class="genderImage"
										src="${member.mbImage}" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="female" name="gender"
											value="f" checked> <label> <i
											class="female icon"></i> 여 자
										</label>
									</div>
								</div>
								<div class="gender_Img1">
									<img id="mailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="male" name="gender"
											value="m"> <label> <i class="male icon"></i>
											남 자
										</label>
									</div>
								</div>
								<script>
									$("#male").attr("disabled", true);
								</script>
							</c:if>
							<c:if test="${member.mbGender==null}">
								<div class="gender_Img1">
									<img id="femailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="female" name="gender"
											value="f"> <label> <i class="female icon"></i>
											여 자
										</label>
									</div>
								</div>
								<div class="gender_Img1">
									<img id="mailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="male" name="gender"
											value="m"> <label> <i class="male icon"></i>
											남 자
										</label>
									</div>
								</div>
							</c:if>
							<c:if test="${member.mbGender=='m'}">
								<div class="gender_Img1">
									<img id="mailImage" class="genderImage" src="${member.mbImage}" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="male" name="gender"
											value="m" checked> <label> <i
											class="male icon"></i> 남 자
										</label>
									</div>
								</div>
								<div class="gender_Img1">
									<img id="femailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="female" name="gender"
											value="f"> <label> <i class="female icon"></i>
											여 자
										</label>
									</div>
								</div>
								<script>
									$("#female").attr("disabled", true);
								</script>
							</c:if>
						</div>
						<div class="Btn">
							<button type="button" class="ui button" id="updatePictureBtn1"
								onclick="updatePictureBtn();"
								style="font-family: 'Do Hyeon', sans-serif; width: 140px; background: rgb(250, 40, 40); color: white;">사진등록/변경</button>
							<br>
							<button type="button" class="ui button" id="deletePictureBtn1"
								onclick="deletePictureBtn();"
								style="font-family: 'Do Hyeon', sans-serif; margin-top: 10px; width: 140px;">사진
								삭제</button>
						</div>
						<br>

						<div class="myInfoTable">
							<table class="ui celled table">
								<tbody>
									<tr>
										<td class="firstTd"
											style="width: 250px; background-color: rgba(255, 185, 185, 0.5);">
											<h3
												style="font-size: 20px; font-family: 'Sunflower', sans-serif;">
												<i class=" trophy icon"></i> 등급
											</h3>
										</td>
										<td><strong
											style="font-size: 20px; font-family: 'Sunflower', sans-serif;">${sessionScope.member.mbGrade}&nbsp;&nbsp;</strong>
											<button type="button" class="ui button"
												onclick="gradeInfo();">
												<strong style="font-size: 20px;">등급안내</strong>
											</button></td>
									</tr>
									<tr>
										<td class="firstTd"
											style="background-color: rgba(255, 185, 185, 0.5);">
											<h3
												style="font-size: 20px; font-family: 'Sunflower', sans-serif;">
												<i class="shield alternate icon"></i> 계정
											</h3>
										</td>
										<td>
											<div class="ui input focus">
												<input type="text" id="account" name="mbId"
													value="${sessionScope.member.mbId}" readonly
													placeholder="아이디.."
													style="width: 300px; font-family: 'Sunflower', sans-serif;">
											</div>
										</td>
									</tr>
									<tr>
										<td class="firstTd"
											style="background-color: rgba(255, 185, 185, 0.5);">
											<h3
												style="font-size: 20px; font-family: 'Sunflower', sans-serif;">
												<i class="expeditedssl icon"></i> 비밀번호 재설정
											</h3>
										</td>
										<td>
											<div class="ui input focus">
												<input type="password" placeholder="변경할 비밀번호.." id="mbPwd"
													name="mbPwd"
													style="width: 300px; font-family: 'Sunflower', sans-serif;">
											</div>
										</td>
									</tr>
									<tr>
										<td class="firstTd"
											style="background-color: rgba(255, 185, 185, 0.5);">
											<h3
												style="font-size: 20px; font-family: 'Sunflower', sans-serif;">
												<i class="tree icon"></i> 닉네임
											</h3>
										</td>
										<td>
											<div class="ui input focus">
												<input type="text" placeholder="닉네임.." id="nickName"
													value="${sessionScope.member.mbNickName}" name="mbNickName"
													style="width: 300px; font-family: 'Sunflower', sans-serif;">
											</div>
											<div id="checkNick"></div>
										</td>
									<tr>
										<td class="firstTd"
											style="background-color: rgba(255, 185, 185, 0.5);">
											<h3
												style="font-size: 20px; font-family: 'Sunflower', sans-serif;">
												<i class="phone  icon"></i> 핸드폰번호
											</h3>
										</td>
										<td>
											<div class="ui input focus">
												<input type="text" placeholder="폰번호.." id="phone"
													value="${sessionScope.member.mbPhone}" name="mbPhone"
													style="width: 300px; font-family: 'Sunflower', sans-serif;">
											</div>
										</td>
									</tr>
									<tr>
										<td class="firstTd"
											style="background-color: rgba(255, 185, 185, 0.5);">
											<h3
												style="font-size: 20px; font-family: 'Sunflower', sans-serif;">
												<i class="paw  icon"></i> 다짐
											</h3>
										</td>
										<td>
											<div class="ui input focus">
												<input type="text" placeholder="한 줄 다짐.." id="promise"
													value="${sessionScope.member.mbPromise}" name="mbPromise"
													style="width: 500px; font-family: 'Sunflower', sans-serif;">
											</div>
										</td>
									</tr>


								</tbody>
							</table>
							<h4>※정보 수정을 원하시면 수정 버튼을 눌러주세요</h4>
							<input type="submit" value="수정" class="ui red button"
								id="updateInfoBtn" /> <input type="reset" value="취소"
								class="ui button" id="updateCancleBtn" /> <br> <br>

						</div>
					</div>
				</form>
			</c:if>
			<!-- 로그인이 안됐을 때 -->
			<c:if test="${sessionScope.member==null }">
				<script>
					alert("로그인 후 이용해주세요 ~ ");
					location.href = "/";
				</script>
			</c:if>

			<!--  ui container 닫기  -->
		</div>
	</div>

	<!-- 프로필 이미지 변경 모달 -->

	<div class="ui modal" id="updateProfile">
		<i class="close icon"></i>
		<div class="header">프로필 사진 변경</div>
		<div class="image content">
			<form action="/updateMyPicture.diet" method="post"
				enctype="multipart/form-data">
				<div class="description">
					<div class="ui header">
						<div class="fileBox">
							<input type="text" class="fileName" id="fileName"
								readonly="readonly" /> <label for="uploadBtn" class="btn_file">찾아보기</label>
							<input type="file" id="uploadBtn" class="uploadBtn"
								name="uploadFile" />
						</div>
					</div>
				</div>
				<br>
				<div class="actions">
					<button type="submit"
						style="background: rgb(250, 40, 40); color: white;"
						class="ui button">
						사진업데이트 <i class="checkmark icon"></i>
					</button>
					<button type="button" class="ui black button" id="modalOff">취소</button>
				</div>
			</form>
			<input type="hidden" value="${sessionScope.member.mbId}"
				id="memberId" />
		</div>
	</div>
	<div class="ui modal" id="gradeInfoModal" style="width: 600px;">
		<i class="close icon"></i>
		<div class="header">등급 정보 안내</div>
		<div class="image content">
			<div class="description">
				<div class="ui header">
					<div class="ui blue message" style="font-size: 15px;">트레이너회원
						: 개인 or 그룹 PT 프로그램을 등록할 수 있는 트레이너 등급입니다.</div>
					<div class="ui blue message" style="font-size: 15px;">
						일반회원 : 사이트를 이용할 수 있는 일반회원 등급이며,<br> 트레이너 회원 자격 신청시 트레이너 등급으로
						변경이 가능합니다.
					</div>
					<div class="ui blue message" style="font-size: 15px;">카카오 회원
						: SNS 로그인을 통해 가입한 카카오등급 회원입니다.</div>
				</div>
			</div>
			<br> <input type="hidden" value="${sessionScope.member.mbId}"
				id="memberId" />
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	/* 등급 안내 */
	function gradeInfo() {
		$("#gradeInfoModal").modal('show');
	}

	$('#nickName').keyup(function(){
				var nickName = $("#nickName").val();
				var nickNameRegExp = /^[가-힣]{2,5}$/;
				nickNameCheck = nickNameRegExp.test(nickName);
				if (nickNameCheck == true) {
				$.ajax({
					url : "/checkNick.diet",
					type : 'POST',
					data : {
						'nickName' : nickName
					},
					success : function(data) {
						if (data == 0) {
							$('#checkNick').html('* 사용 가능한 닉네임 입니다').css('display', 'block').css('color','blue');		
							
						} else {
							$('#checkNick').html('* 이미 사용 중인 닉네임 입니다').css('display', 'block').css('color', 'red');		
						
						}
					},
					error : function() {
						alert("실패");
					}
			});
		}
	});		
	/* 정보업데이트 시 별명 null 아닌지 */
	/* 비밀번호값 정규표현식에 맞게 되었는지 */
	function checkInfo() {

		var mbPwd = $("#mbPwd").val();
		var pwdRegExp = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,16}$/;
		var resultPwd = pwdRegExp.test(mbPwd);
				if (resultPwd == true) {
					return true;
				} else {
					alert("비밀번호 6~16자리 사이 대문자,소문자,숫자를 섞어서 입력해주세요");
					return false;
				}
		
			}
	/* 모달 창 종료 */
	$("#modalOff").click(function() {
		$("#updateProfile").modal('hide');
	});

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
	$("#updatePictureBtn1").click(function() {
		$("#updateProfile").modal('show');
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
	/* Ajax 중복 호출 방지 용*/
	var ajaxLoadHis = 0;
	var ajaxLoadNowHis = ajaxLoadHis;
	function deletePictureBtn() {
		var chkRadio = $(":input:radio[name=gender]:checked").val();
		var result = window.confirm("사진을 삭제하시겠습니까?");
		var memberId = $("#memberId").val();
		if (result == true) {
			if (chkRadio === 'f') {
				$("#femailImage").attr("src", "");
				$.ajax({
					url : "/deleteMyPicture.diet",
					type : 'POST',
					data : {
						mbId : memberId
					},
					beforeSend : function(data) {
						ajaxLoadHis = ajaxLoadHis + 1;
					},
					success : function(data) {
						if (ajaxLoadNowHis != ajaxLoadHis - 1) {
							console.log("중복출력방지");
						} else {
							alert("프로필 사진 삭제 성공 하셨습니다.");
							location.reload();
						}
					},
					error : function() {
					}
				});

			} else if (chkRadio === 'm') {
				$("#mailImage").attr("src", "");
				$.ajax({
					url : "/deleteMyPicture.diet",
					type : 'POST',
					data : {
						mbId : memberId
					},
					beforeSend : function(data) {
						ajaxLoadHis = ajaxLoadHis + 1;
					},
					success : function(data) {
						if (ajaxLoadNowHis != ajaxLoadHis - 1) {
							console.log("중복출력방지");
						} else {
							alert("프로필 사진 삭제 성공 하셨습니다.");
							location.reload();
						}
					},
					error : function() {
					}
				});

			}
		} else {
			alert("사진 삭제 취소하셨습니다.");
		}
	}
</script>

</html>