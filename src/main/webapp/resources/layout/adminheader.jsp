<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<div class="ui sidebar inverted vertical menu">
		<a class="item"> 1 </a>
		<a class="item"> 2 </a>
		<a class="item"> 3 </a>
	</div>
</body>

<script>

$(document).ready(function() {
	$('.ui.sidebar')
	.sidebar('show');
});

</script>