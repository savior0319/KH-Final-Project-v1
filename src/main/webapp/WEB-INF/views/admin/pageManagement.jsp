<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>관리자 - 페이지 관리</title>
</head>

<!-- CSS -->
<style>
body {
	margin-left: 240px;
}
.adselect:hover{
	cursor: pointer;
	background: rgb(240,240,240);
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>


	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<div class="ui center aligned segment">
			<h1>페이지 광고 변경</h1>  
		</div>
		<div class="ui large header">페이지 광고 변경</div>
		<div class="ui red message"><div class="ui medium header">※ 광고는 716 x 258 (가로 x 세로) 사이즈로 올려주세요!</div></div>
		<table class="ui celled table">
			<thead>
				<tr align="center">
					<th colspan="4"><div class="ui medium header">현재 광고</div></th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>
						<img src="#" style="width: 100%;" id="image1">
					</td>
					<td>
						<img src="#" style="width: 100%;" id="image2">
					</td>
					<td>
						<img src="#" style="width: 100%;" id="image3">
					</td>
					<td>
						<img src="#" style="width: 100%;" id="image4">
					</td>
				</tr>
				<form id="frm" action="/logoImageUpload.diet" method="post">
					<tr align="center">
						<td>
							<input type="file" name="uploadfile1" class="files" onchange="imageURL(this,1)" style="width:90%;" />
						</td>
						<td>
							<input type="file" name="uploadfile2" class="files" onchange="imageURL(this,2)" style="width:90%;"/>
						</td>
						<td>
							<input type="file" name="uploadfile3" class="files" onchange="imageURL(this,3)" style="width:90%;"/>
						</td>
						<td>
							<input type="file" name="uploadfile4" class="files" onchange="imageURL(this,4)" style="width:90%;"/>
						</td>  
					</tr>
					<tr align="center">
						<td colspan="4">
						<input type="button" class="tiny ui button" style="background:rgb(250,40,40); color: white;" id="uploadbutton" value="변경" />
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">

/* 아아아아아앙ㅇ아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ */

$(function(){
	$("#uploadbutton").click(function(){
		var form = $('form')[0];
		var formData = new FormData(form);
		$.ajax({
			url: '/logoImageUpload.diet',
			data: formData,
			cache : false,
			contentType : false,
			processData : false,
			encType : "multipart/form-data",
			type: 'POST',
			success: function(result){
				alert("광고 이미지 변경 완료");
				location.reload();
			},
			error: function(){
				alert('변경할 광고 4장을 전부 넣어주세요');
			}
		});
	});
})

function imageURL(input,num) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#image'+num).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

/* 이미지 불러오기 */
$(document).ready(function() {
	$.ajax({
		url : '/advertiseImageLoad.diet',
		type : 'post',
		success : function(img){
			$("#image1").attr("src",img[0].path1);
			$("#image2").attr("src",img[1].path1);
			$("#image3").attr("src",img[2].path1);
			$("#image4").attr("src",img[3].path1);

		},
		error : function(){
			console.log('[ERROR] - 이미지 불러오기 오류');
		}
	});
});

</script>

</html>