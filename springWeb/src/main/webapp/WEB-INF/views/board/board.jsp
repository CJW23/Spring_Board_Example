<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Spring Board</title>
    <link href="../resources/board/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="index.html">Spring Board</a>
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
                    <a class="dropdown-item" href="login.html">Logout</a>
                </div>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="tables.html">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-table"></i>
                            </div>
                            Tables</a>
                        <a class="nav-link" href="register.html">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-book-open"></i>
                            </div>
                            Register</a>
                    </div>
                </div>
            </nav>
        </div>


        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i>DataTable Example</div>
                        <div class="card-body">
                            <button type="button" class="btn btn-primary" onclick="location.href='/board'">글쓰기</button>
                            <br>
                            <br>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>제목</th>
                                            <th>작성시기</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="boardVO">
                                            <tr>
                                                <td>
                                                    <a href='/posts/${boardVO.id}?curPage=${maker.cri.curPage}&perPageNum=${maker.cri.perPageNum}'>${boardVO.title}</a>
                                                </td>
                                                <td>
                                                    <fmt:formatDate pattern="yyyy-MM-dd  kk:mm:ss" value="${boardVO.regdate}" />
                                                </td>
                                                <td>
                                                    ${boardVO.viewcnt}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                               
                                    <c:if test="${maker.prev}">
                                        <li class="page-item">
                                            <a class="page-link" href="/board?curPage=${maker.startPage-1}&perPageNum=${maker.cri.perPageNum}">prev</a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="${maker.startPage}" end="${maker.endPage}" var="idx">
                                        <li class="page-item" <c:out value="${maker.cri.curPage == idx?'class = active':''}" />>
                                        <a class="page-link" href="/board?curPage=${idx}&perPageNum=${maker.cri.perPageNum}">${idx}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${maker.next && maker.endPage > 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="/board?curPage=${maker.endPage+1}&perPageNum=${maker.cri.perPageNum}">next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>


                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2019</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/js/scripts.js"></script>

    <script src="../resources/board/assets/demo/datatables-demo.js"></script>
    <script>
        if ('${msg}' == 'success') {
            alert("등록 완료");
        }
        if ('${rmresult}' == 'true') {
            alert("삭제 완료");
        }
    </script>
</body>

</html>