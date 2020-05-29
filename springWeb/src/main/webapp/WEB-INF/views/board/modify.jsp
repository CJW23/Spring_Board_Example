<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
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
	<form role="form" name="actionform" method="post">
		<input type="hidden" name="id" value="${board.id}">
		<input type="hidden" name="curPage" value="${cri.curPage}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<div class="container-contact100">
			<div class="wrap-contact100">
				<span class="contact100-form-title"> POSTS </span>
				<div class="wrap-input100 validate-input"
					data-validate="Please enter your name">
					<input class="input100" type="text" value="${board.title}"
						name="title" placeholder="Title"> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<textarea class="input100" name="des" placeholder="Description">
					${board.des}
				</textarea>
				</div>

				<div class="container-contact100-form-btn">
					<button type="submit" id="save" class="contact100-form-btn">
						<span> save </span>
					</button>
					&emsp;
					<button type="button" onclick="history.back(-1);" id="cancel" class="contact100-form-btn">
						<span> cancel </span>
					</button>
				</div>
			</div>
		</div>
	</form>
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
		var form = document.actionform;
		$("#save").on("click", function() {
			form.attr("action", "/modify");
			form.submit();
		});
	</script>
</body>
</html>
