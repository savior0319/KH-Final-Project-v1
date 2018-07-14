<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<br>
			<br>
			<br>
			<br>
			<div class="ui large message">
				<div class="ui large header">칼로리 처방 받기</div>
			</div>
			<form action="#" method="GET">
				<table class="ui celled table">
					<thead>
						<tr>
							<th style="width: 15%;">성별</th>
							<td>
								<input type="radio" name="gender" value="f" required>
								여자
								<input type="radio" name="gender" style="margin-left: 20px;" value="m" required>
								남자
							</td>
						</tr>
						<tr>
							<th>연령</th>
							<td>
								<select name="age" class="ui dropdown" required>
									<option value="1930">1930</option>
									<option value="1931">1931</option>
									<option value="1932">1932</option>
									<option value="1933">1933</option>
									<option value="1934">1934</option>
									<option value="1935">1935</option>
									<option value="1936">1936</option>
									<option value="1937">1937</option>
									<option value="1938">1938</option>
									<option value="1939">1939</option>
									<option value="1940">1940</option>
									<option value="1941">1941</option>
									<option value="1942">1942</option>
									<option value="1943">1943</option>
									<option value="1944">1944</option>
									<option value="1945">1945</option>
									<option value="1946">1946</option>
									<option value="1947">1947</option>
									<option value="1948">1948</option>
									<option value="1949">1949</option>
									<option value="1950">1950</option>
									<option value="1951">1951</option>
									<option value="1952">1952</option>
									<option value="1953">1953</option>
									<option value="1954">1954</option>
									<option value="1955">1955</option>
									<option value="1956">1956</option>
									<option value="1957">1957</option>
									<option value="1958">1958</option>
									<option value="1959">1959</option>
									<option value="1960">1960</option>
									<option value="1961">1961</option>
									<option value="1962">1962</option>
									<option value="1963">1963</option>
									<option value="1964">1964</option>
									<option value="1965">1965</option>
									<option value="1966">1966</option>
									<option value="1967">1967</option>
									<option value="1968">1968</option>
									<option value="1969">1969</option>
									<option value="1970">1970</option>
									<option value="1971">1971</option>
									<option value="1972">1972</option>
									<option value="1973">1973</option>
									<option value="1974">1974</option>
									<option value="1975">1975</option>
									<option value="1976">1976</option>
									<option value="1977">1977</option>
									<option value="1978">1978</option>
									<option value="1979">1979</option>
									<option value="1980">1980</option>
									<option value="1981">1981</option>
									<option value="1982">1982</option>
									<option value="1983">1983</option>
									<option value="1984">1984</option>
									<option value="1985">1985</option>
									<option value="1986">1986</option>
									<option value="1987">1987</option>
									<option value="1988">1988</option>
									<option value="1989">1989</option>
									<option value="1990" selected>1990</option>
									<option value="1991">1991</option>
									<option value="1992">1992</option>
									<option value="1993">1993</option>
									<option value="1994">1994</option>
									<option value="1995">1995</option>
									<option value="1996">1996</option>
									<option value="1997">1997</option>
									<option value="1998">1998</option>
									<option value="1999">1999</option>
									<option value="2000">2000</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
								</select>
								년
							</td>
						</tr>
						<tr>
							<th>키</th>
							<td>
								<span class="ui form">
									<input type="text" name="height" placeholder="키 입력" style="width: 40%;" id="numberCheck1" maxlength="3" required>
								</span>
								<span class="ui medium header" style="line-height: 40px;"> cm </span>
							</td>
						</tr>
						<tr>
							<th>몸무게</th>
							<td>
								<span class="ui form">
									<input type="text" name="weight" placeholder="몸무게 입력" style="width: 40%;" id="numberCheck2" maxlength="3" required>
								</span>
								<span class="ui medium header" style="line-height: 40px;"> kg </span>
							</td>
						</tr>
						<tr>
							<th>체중감량기간</th>
							<td>
								<span class="ui form">
									<input type="text" name="period" placeholder="기간 입력" style="width: 40%;" id="numberCheck3" maxlength="3" required>
								</span>
								<span class="ui medium header" style="line-height: 40px;">
									<input type="radio" name="periodUnit" value="month" required style="margin-left: 10px;"> 개월
									<input type="radio" name="periodUnit" value="day" required style="margin-left: 10px;"> 일
								</span>
							</td>
						</tr>
						<tr>
							<th>평소 활동량</th>
							<td>
								<span class="ui form">
									<input type="radio" name="activeMass" value="step1" required> 활동안함<br>
									<input type="radio" name="activeMass" value="step1" required> 가벼운 활동<br> 
									<input type="radio" name="activeMass" value="step1" required> 보통 활동<br> 
									<input type="radio" name="activeMass" value="step1" required> 많은 활동<br>
									<input type="radio" name="activeMass" value="step1" required> 격심한 활동<br>
								</span>
							</td>
						</tr>
					</thead>
				</table>
				
				<button class="ui blue button" type="submit">전송</button>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
$(document).ready(function() {

	var regExp = /^[0-9]*$/;

	$("#numberCheck1").focus(function() {
		if (!regExp.test($("#numberCheck1").val())) {
			alert("숫자만 입력하세요");
			$("#numberCheck1").val("");
		}
	});

	$("#numberCheck1").keyup(function() {
		if (!regExp.test($("#numberCheck1").val())) {
			alert("숫자만 입력하세요");
			$("#numberCheck1").val("");
		}
	});

	$("#numberCheck2").focus(function() {
		if (!regExp.test($("#numberCheck2").val())) {
			alert("숫자만 입력하세요");
			$("#numberCheck2").val("");
		}
	});

	$("#numberCheck2").keyup(function() {
		if (!regExp.test($("#numberCheck2").val())) {
			alert("숫자만 입력하세요");
			$("#numberCheck2").val("");
		}
	});

	$("#numberCheck3").focus(function() {
		if (!regExp.test($("#numberCheck3").val())) {
			alert("숫자만 입력하세요");
			$("#numberCheck2").val("");
		}
	});

	$("#numberCheck3").keyup(function() {
		if (!regExp.test($("#numberCheck3").val())) {
			alert("숫자만 입력하세요");
			$("#numberCheck2").val("");
		}
	});
});
</script>

</html>