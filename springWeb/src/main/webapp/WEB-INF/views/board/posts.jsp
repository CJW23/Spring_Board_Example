<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact V10</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="../resources/register/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/register/css/util.css">
<link rel="stylesheet" type="text/css"
	href="../resources/register/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<form role="form" id="actionform" method="get">
		<input type="hidden" name="id" value="${posts.id}"> 
		<input type="hidden" name="curPage" value="${cri.curPage}"> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	</form>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<span class="contact100-form-title"> POSTS </span>
			<div class="wrap-input100 validate-input"
				data-validate="Please enter your name">
				<input class="input100" type="text" value="${posts.title}"
					name="title" placeholder="Title" readonly> <span
					class="focus-input100"></span>
			</div>

			<div class="wrap-input100 validate-input">
				<textarea class="input100" name="des" placeholder="Description"
					readonly>
						${posts.des}
					</textarea>
			</div>

			<div class="container-contact100-form-btn">
				<button type="submit" id="update" class="contact100-form-btn">
					<span> update </span>
				</button>
				&emsp;
				<button type="submit" id="remove" class="contact100-form-btn">
					<span> remove </span>
				</button>
				&emsp;
				<button type="submit" id="list" class="contact100-form-btn">
					<span> list </span>
				</button>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="../resources/register/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="../resources/register/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/register/vendor/bootstrap/js/popper.js"></script>
	<script
		src="../resources/register/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/register/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="../resources/register/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="../resources/register/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="../resources/register/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/register/js/main.js"></script>
	<script>
		var form = $("form[role='form']");
		$("#update").on("click", function() {
			form.attr("action", "/modify");
			form.attr("method", "get");
			form.submit();
		});

		$("#remove").on("click", function() {
			form.attr("action", "/remove");
			form.attr("method", "get");
			form.submit();
		});
		$("#list").on("click", function() {
			form.attr("action", "/board");
			form.attr("method", "get");
			form.submit();
		});
		if ('${modifyresult}' == 'true') {
			alert("수정 완료");
		}
	</script>
</body>
</html>
