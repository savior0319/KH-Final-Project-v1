<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#up-scroll {
	width:50px; 
	height:50px;
	margin-left: 80%;
	margin-top: 70%;
	position: fixed;
	z-index:999;
	border:1px solid lightgrey;
	border-radius:25%;
}
</style>

<a id="up-scroll" href="javascript:scroll(0,0)"><i class="angle red double up icon" style="margin-left:15px; margin-top:15px;"></i></a>
<style type="text/css" media="screen">
/* 모바일용 아닌 사이즈 */
@media ( min-width : 550px) {
	#up-scroll {
		display: none;
	}
}
/* 모바일용 사이즈 */
@media ( max-width : 549px) {
	#up-scroll {
		display: block;
	}
}
</style>