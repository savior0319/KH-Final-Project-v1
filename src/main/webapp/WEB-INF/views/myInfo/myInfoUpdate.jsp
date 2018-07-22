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
				<form action="/updateMyInfo.diet" method="post" onsubmit="return checkInfo();">
					<div class="myInfoUpdateContents">
						<div class="gender_Image">
							<c:if test="${sessionScope.member.mbGender=='f'}">
								<div class="gender_Img1">
									<img id="femailImage" class="genderImage"
										src="${sessionScope.member.mbImage}" />

									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="female" name="gender"
											value="f" checked> <label>여 자</label>
									</div>
								</div>
								<div class="gender_Img1">
									<img id="mailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="male" name="gender"
											value="m"> <label>남 자</label>
									</div>
								</div>
								<script>
									$("#male").attr("disabled", true);
								</script>
							</c:if>
							<c:if test="${sessionScope.member.mbGender==null}">
								<div class="gender_Img1">
									<img id="femailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="female" name="gender"
											value="f"> <label>여 자</label>
									</div>
								</div>
								<div class="gender_Img1">
									<img id="mailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="male" name="gender"
											value="m"> <label>남 자</label>
									</div>
								</div>
							</c:if>
							<c:if test="${sessionScope.member.mbGender=='m'}">
								<div class="gender_Img1">
									<img id="mailImage" class="genderImage"
										src="${sessionScope.member.mbImage}" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="male" name="gender"
											value="m" checked> <label>남 자</label>
									</div>
								</div>
								<div class="gender_Img1">
									<img id="femailImage" class="genderImage"
										src="http://upload.inven.co.kr/upload/2014/11/01/bbs/i3464037277.jpg" />
									<div class="ui radio checkbox">
										<input type="radio" class="radioBtn" id="female" name="gender"
											value="f"> <label>여 자</label>
									</div>
								</div>
								<script>
									$("#female").attr("disabled", true);
								</script>
							</c:if>
						</div>
						<div class="Btn">
							<button type="button" class="ui yellow button"
								id="updatePictureBtn1" onclick="updatePictureBtn();"
								style="width: 140px;">사진등록/변경</button>
							<br>
							<button type="button" class="ui button" id="deletePictureBtn1"
								onclick="deletePictureBtn();"
								style="margin-top: 10px; width: 140px;">사진 삭제</button>
						</div>
						<br>

						<div class="myInfoTable">
							<table class="ui celled table">
								<tbody>
									<tr>
										<td class="firstTd" style="width: 250px;"><h3>
												<i class="shield alternate icon"></i>등급
											</h3></td>
										<td><strong>${sessionScope.member.mbGrade}&nbsp;&nbsp;</strong>
									<button type="button" class="ui button">
												<strong>등급안내</strong>
											</button></td>
									</tr>
									<tr>
										<td class="firstTd"><h3>
												<i class="shield alternate icon"></i>계정
											</h3></td>
										<td>
											<div class="ui input focus">
												<input type="text" id="account" name="mbId"
													value="${sessionScope.member.mbId}" readonly
													placeholder="아이디.." style="width: 300px;">
											</div>
										</td>
									</tr>
									<tr>
										<td class="firstTd"><h3>
												<i class="shield alternate icon"></i>비밀번호 재설정
											</h3></td>
										<td>
											<div class="ui input focus">
												<input type="password" placeholder="변경할 비밀번호.."
													id="password" name="mbPwd" style="width: 300px;">
											</div>
										</td>
									</tr>
									<tr>
										<td class="firstTd"><h3>
												<i class="shield alternate icon"></i>닉네임
											</h3></td>
										<td>
											<div class="ui input focus">
												<input type="text" placeholder="닉네임.." id="nickName"
													value="${sessionScope.member.mbNickName}" name="mbNickName"
													style="width: 300px;">
											</div>
										</td>
									<tr>
										<td class="firstTd"><h3>
												<i class="shield alternate icon"></i>핸드폰번호
											</h3></td>
										<td>
											<div class="ui input focus">
												<input type="text" placeholder="폰번호.." id="phone"
													value="${sessionScope.member.mbPhone}" name="mbPhone"
													style="width: 300px;">
											</div>
										</td>
									</tr>
									<tr>
										<td class="firstTd"><h3>
												<i class="shield alternate icon"></i>다짐
											</h3></td>
										<td><div class="ui input focus">
												<input type="text" placeholder="한 줄 다짐.." id="promise"
													value="${sessionScope.member.mbPromise}" name="mbPromise"
													style="width: 500px;">
											</div></td>
									</tr>

									<tr>
										<td class="firstTd"><h3>
												<i class="shield alternate icon"></i>키
											</h3></td>
										<c:if test="${member.mbHeight!=0}">
											<td><div class="ui input focus">
													<input type="text" placeholder="키.." id="mbHeight"
														value="${member.mbHeight}" name="mbHeight"
														style="width: 100px;"> <span
														style="margin-top: 14px; margin-left: 5px; font-size: 18px; font-weight: 800;"><strong>cm</strong></span>
												</div></td>
										</c:if>
										<c:if test="${member.mbHeight==0}">
											<td><div class="ui input focus">
													<input type="text" placeholder="키.." id="mbHeight" 
														name="mbHeight" style="width: 100px;"> <span
														style="margin-top: 14px; margin-left: 5px; font-size: 18px; font-weight: 800;"><strong>cm</strong></span>
												</div></td>
										</c:if>
									</tr>
									<tr>
										<td class="firstTd"><h3>
												<i class="shield alternate icon"></i>몸무게
											</h3></td>
										<c:if test="${member.mbWeight!=0}">
											<td>
												<div class="ui input focus">
													<input type="text" placeholder="몸무게.." id="mbWeight"
														value="${member.mbWeight}" name="mbWeight"
														style="width: 100px;"> <span
														style="margin-top: 14px; font-size: 18px; margin-left: 5px; font-weight: 800;"><strong>Kg</strong></span>
												</div>
											</td>
										</c:if>
										<c:if test="${member.mbWeight==0}">
											<td>
												<div class="ui input focus">
													<input type="text" placeholder="몸무게.." id="mbWeight" 
														name="mbWeight" style="width: 100px;"> <span
														style="margin-top: 14px; font-size: 18px; margin-left: 5px; font-weight: 800;">
														<strong>Kg</strong>
													</span>
												</div>
											</td>
										</c:if>
									</tr>
								</tbody>
							</table>
							<h4>※ 키와 몸무게를 입력하시면 맞춤 정보를 제공해 드립니다~</h4>
							<input type="submit" value="수정" class="ui red button" id="updateInfoBtn" /> 
							<input type="reset" value="취소" class="ui button" id="updateCancleBtn" /> <br> <br> <br>	
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
			<form name="imgupload" id="data"
				action="/API/newmember_user_img_reg.asp" method="post"
				enctype="multipart/form-data">
				<div class="description">
					<div class="ui header">
						<div class="fileBox">
							<input type="text" class="fileName" id="fileName"
								readonly="readonly" /> <label for="uploadBtn" class="btn_file">찾아보기
							</label><input type="file" id="uploadBtn" class="uploadBtn"
								name="uploadFile" />
						</div>
					</div>
				</div>
				<div class="actions">
					<button type="button" class="ui yellow button"
						onclick="updateProfileBtn();">
						사진업데이트 <i class="checkmark icon"></i>
					</button>
					<button type="button" class="ui black button">취소</button>
				</div>
			</form>
			<input type="hidden" value="${sessionScope.member.mbId}"
				id="memberId" />
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	/* 정보업데이트 시 별명 null 아닌지 */


	function checkInfo(){
		var nickName = $("#nickName").val();
		var height = $("#mbHeight").val();
		var weight = $("#mbWeight").val();
		if(height == "" || weight == "") {
			$("#mbHeight").val('0');
			$("#mbWeight").val('0');
		}
		
		if(nickName==""){
			alert("별명을 입력해주세요");
			location.reload();
			return false;

		}else{
			console.log(result);
			return true;
			
		}
		
		
	}
	
	/*사진등록,변경 */
	function updateProfileBtn() {
		var formData = new FormData();
		formData.append("uploadFile", $("input[name=uploadFile]")[0].files[0]);
		$.ajax({
			url : "/updateMyPicture.diet",
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result) {
				alert("업로드 성공!!");
			},
			error : function() {
				alert("사진업데이트 실패 되었습니다.");
			}
		});
	}

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
	function deletePictureBtn() {
		var chkRadio = $(":input:radio[name=gender]:checked").val();
		console.log(chkRadio);
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
					success : function(data) {

					},
					error : function() {
					}
				});
				alert("여자사진 삭제 성공 하셨습니다.");
			} else if (chkRadio === 'm') {
				$("#mailImage").attr("src", "");
				$.ajax({
					url : "/deleteMyPicture.diet",
					type : 'POST',
					data : {
						mbId : memberId
					},
					success : function(data) {
					},
					error : function() {
					}
				});
				alert("남자사진 삭제 성공 하셨습니다.");
			}
		} else {
			alert("사진 삭제 취소하셨습니다.");
		}
	}

	/* 사진 변경 업로드 */
	var return_rt;
	var rs_folder;
	var IMGNAME;

	$("form#data").submit(function(event) {
		//disable the default form submission
		event.preventDefault();

		var sex = $(':radio[name="sex"]:checked').val();
		$("#hiddensex").val(sex);

		//grab all form data  
		var formData = new FormData($(this)[0]);
		alert("g");
		$.ajax({
			url : '/updateMyPicture.diet',
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(returndata) {
				alert("성공");
				return_rt = returndata.split("|");
				rs_folder = return_rt[0];
				IMGNAME = return_rt[1];

				if (rs_folder != 'none') {
					setPicture(rs_folder, IMGNAME);
				} else {
					alert('등록할 사진을 첨부해주세요.');
				}
				return;
			}

		});

		return false;
	});
</script>

</html>