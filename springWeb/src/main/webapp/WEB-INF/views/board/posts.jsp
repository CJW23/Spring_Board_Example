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
    <title>Dashboard - SB Admin</title>
    <link href="../resources/board/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <form role="form" id="actionform" method="get">
        <input type="hidden" name="id" value="${posts.id}">
        <input type="hidden" name="curPage" value="${cri.curPage}">
        <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
    </form>
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
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon">
                                    <i class="fas fa-table"></i>
                                </div> Tables
                            </a>
                            <a class="nav-link" href="register.html">
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
                            <label class="small mb-1" for="inputFirstName">제목</label>
                            <input class="form-control py-4" name="title" type="text" value="${posts.title}" readonly/>
                            <div class="form-group">
                                <label class="small mb-1" for="inputEmailAddress">내용</label>
                                <textarea class="form-control py-4" rows="10" style="resize:none" name="des" aria-describedby="emailHelp" readonly>${posts.des}</textarea>
                            </div>
                            <div class="row">
                                <div class="col-sm">
                                    <button type="submit" id="update" class="btn btn-primary btn-block">수정</button>
                                </div>
                                <div class="col-sm">
                                    <button type="submit" id="remove" class="btn btn-light btn-block">삭제</button>
                                </div>
                                <div class="col-sm">
                                    <button type="submit" id="list" class="btn btn-secondary btn-block">돌아가기</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </main>

        </div>
    </div>

    <div>
        replyer
        <input type="text" name='replyer' id='newReplyWriter'> reply text
        <input type="text" name='replytext' id='newReplyText'>
        <button id="replyAddbtn">ADD</button>
    </div>
    <div id='modDiv' style="display : none">
        <div class="modal-title">
        </div>
        <div>
            <input type='text' id='replytext'>
        </div>
        <div>
            <button type="button" id="replyModBtn">Modify</button>
            <button type="button" id="replyDelBtn">DELETE</button>
            <button type="button" id="closeBtn">Close</button>
        </div>
    </div>
    <ul id="replies">

    </ul>
    <ul class="pagination"></ul>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/assets/demo/chart-area-demo.js"></script>
    <script src="../resources/board/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/assets/demo/datatables-demo.js"></script>
        <script>
        var bid = '${posts.id}';
        var id;
        var replyPage = 1;
        getPageList(1); //초기

        $(".pagination").on("click", "li a", function (event) {
            event.preventDefault();
            replyPage = $(this).attr("href");
            console.log("href" + replyPage);
            getPageList(replyPage);
        });

        $("#replyAddbtn").on("click", function () {
            $.ajax({
                type: 'post',
                url: '/replies',
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({
                    bid: bid,
                    replyer: $("#newReplyWriter").val(),
                    replytext: $("#newReplyText").val()
                }),
                success: function (result) {
                    if (result == "SUCCESS") {
                        getPageList(replyPage);
                    }
                }
            })
        });

        $("#replies").on("click", ".replyLi button", function () {
            var reply = $(this).parent();
            id = reply.attr("data-id");
            var replytext = reply.text();

            $(".modal-title").html(id);
            $("#replytext").val(replytext);
            $("#modDiv").show();
            //alert(id + " " + replytext);
        });

        $("#closeBtn").on("click", function () {
            $("#modDiv").hide();
        });

        $("#replyModBtn").on("click", function () {
            $.ajax({
                type: 'put',
                url: '/replies/' + id,
                headers: {
                    "Content-Type": "application/json"
                },
                dataType: 'text',
                data: JSON.stringify({
                    replytext: $("#replytext").val()
                }),
                success: function (result) {
                    if (result == "SUCCESS") {
                        alert("modify complete");
                        $("#modDiv").hide();
                        getPageList(replyPage);
                    }
                }
            })
        });

        $("#replyDelBtn").on("click", function () {
            $.ajax({
                type: 'delete',
                url: '/replies/' + id,
                header: {
                    "Content-Type": "application/json"
                },
                dataType: 'text',
                success: function (result) {
                    if (result == "SUCCESS") {
                        alert("remove complete");
                        $("#modDiv").hide();
                        getPageList(replyPage);
                    }
                }
            })
        });

        function getPageList(page) {
            $.getJSON("/replies/" + bid + "/" + page, function (data) {
                var str = "";
                $(data.list).each(function () {
                    str += "<li data-id='" + this.id + "' class='replyLi'>" + this.id + ":" + this.replytext + "<Button>modify</Button></li>";
                });
                $("#replies").html(str);
                printPaging(data.pm);
            })
        }
        function printPaging(pageMaker) {
            var str = "";

            if (pageMaker.prev) {
                str += "<li><a href='" + (pageMaker.startPage - 1) + "'> prev </a></li>";
            }
            for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
                var strClass = pageMaker.cri.page == i ? 'class=active' : '';
                str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
            }
            if (pageMaker.next) {
                str += "<li><a href='" + (pageMaker.endPage + 1) + "'> next </a></li>";
            }
            $(".pagination").html(str);
        }
    </script>
    <script>
        var form = $("form[role='form']");
        $("#update").on("click", function () {
            form.attr("action", "/modify");
            form.attr("method", "get");
            form.submit();
        });

        $("#remove").on("click", function () {
        	form.attr("action", "/remove");
            form.attr("method", "get");
            form.submit();
        });
        $("#list").on("click", function () {
            
        	form.attr("action", "/board");
            form.attr("method", "get");
            form.submit();
        });
    </script>
</body>

</html>