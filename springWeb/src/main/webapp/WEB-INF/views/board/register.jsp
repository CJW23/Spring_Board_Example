<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>게시글 등록</title>
    <link href="../resources/board/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="/board">Spring Board</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		</div>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
				 aria-expanded="false">
					<i class="fas fa-user fa-fw"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a>
					<a class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/login">Login</a>
				</div>
			</li>
		</ul>
	</nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="/board">
                                <div class="sb-nav-link-icon">
                                    <i class="fas fa-table"></i>
                                </div> Board
                            </a>
                            <a class="nav-link" href="/register">
                                <div class="sb-nav-link-icon">
                                    <i class="fas fa-book-open"></i>
                                </div> Register
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4"></h1>

                    <div class="card mb-4">
                        <div class="card-header">게시글 등록</div>
                        <div class="card-body">
                            <form role="form" method="POST">
                            	<input type="hidden" name="writer" value="${login.id}"/>
                                <label class="small mb-1" for="inputFirstName">제목</label>
                                <input class="form-control py-4" name="title" type="text" />
                                <div class="form-group">
                                    <label class="small mb-1" for="inputEmailAddress">내용</label>
                                    <textarea class="form-control py-4" rows="10" style="resize:none" name="des" aria-describedby="emailHelp"></textarea>
                                </div>
                                <div class="row">
                                    <div class="col-sm">
                                        <button type="submit" class="btn btn-primary btn-block">등록</button>
                                    </div>
                                    <div class="col-sm">
                                        <button type="button" class="btn btn-light btn-block" onclick="location.href='/board'">취소</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </main>

        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/assets/demo/chart-area-demo.js"></script>
    <script src="../resources/board/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/assets/demo/datatables-demo.js"></script>
</body>

</html>