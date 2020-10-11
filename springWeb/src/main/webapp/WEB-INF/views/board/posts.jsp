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
    <title>Dashboard - SB Admin</title>
    <link href="../resources/board/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <style>
        #replyer-input:focus {
            outline: none;
        }

        textarea {
            resize: none;
            overflow: hidden;
            width: 100%;
            min-height: 50px;
            max-height: 300px;
        }
    </style>
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
                <form role="form" id="actionform" method="get">
                    <input type="hidden" name="id" value="${posts.id}">
                    <input type="hidden" name="curPage" value="${cri.curPage}">
                    <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
                </form>
                <div class="container-fluid">
                    <h1 class="mt-4"></h1>

                    <div class="card mb-4">
                        <div class="card-header">게시글 등록</div>
                        <div class="card-body">
                            <label class="small mb-1" for="inputFirstName">제목</label>
                            <input class="form-control py-4" name="title" type="text" value="${posts.title}" readonly />
                            <div class="form-group">
                                <label class="small mb-1" for="inputEmailAddress">내용</label>
                                <textarea oninput="auto_grow(this)" class="form-control py-4" style="resize: none" name="des" aria-describedby="emailHelp"
                                    readonly>${posts.des}</textarea>
                            </div>
                            <div class="row">
                                <c:if test="${login.id == posts.writer}">
                                    <div class="col-sm">
                                        <button type="submit" id="update" class="btn btn-primary btn-block">수정</button>
                                    </div>
                                    <div class="col-sm">
                                        <button type="submit" id="remove" class="btn btn-light btn-block">삭제</button>
                                    </div>
                                </c:if>
                                <div class="col-sm">
                                    <button type="submit" id="list" class="btn btn-secondary btn-block">돌아가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    댓글 작성
                    <br>
                    <br>
                    <div class="card mb-4">
                        <div class="card-header">
                            <input type="hidden" id='uid' value='${login.id}'>
                            <input type="text" class="form-control py-4" name='replyer' id='newReplyWriter'>
                        </div>
                        <div class="card-body">
                            <textarea oninput="auto_grow(this)" class="form-control py-4" rows="1" style="resize: none" name='replytext' id='newReplyText'></textarea>
                            <button id="replyAddbtn" class="btn btn-primary">ADD</button>
                        </div>
                    </div>


                    <!--댓글-->
                    <div id="replies">

                    </div>
                    <ul class="pagination"></ul>
                </div>

            </main>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/assets/demo/chart-area-demo.js"></script>
    <script src="../resources/board/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/assets/demo/datatables-demo.js"></script>

    <script id="template" type="text/x-handlebars-template">
        {{#each .}}
        <div data-id={{id}} class='card mb-4 replycard'>
            <div class='card-header row-fluid replyLi' style='font-size:30px'>
                <input id='replyer-input{{id}}' type:text value={{replyer}} style='border: none; background: transparent;' readonly>
                {{#ReplyerCheck uid}}
                <Button id='openModify{{id}}' class='btn float-right btn-primary openModify'>수정</Button>
                {{/ReplyerCheck}}
                <span id='modDiv{{id}}' style='display: none'>
                    <button class="btn float-right btn-primary" type='button' id='replyModBtn{{id}}'>Modify</button>
                    <button class="btn float-right btn-primary" type='button' id='replyDelBtn{{id}}'>Delete</button>
                    <button class="btn float-right btn-primary" type='button' id='closeBtn{{id}}'>Close</button>
                </span>
            </div>
            <div class="card-body replyLi2">
                <textarea oninput="auto_grow(this)" id="replyer-des{{id}}" style='border: none; background: transparent;' readonly>{{replytext}}
                </textarea>
            </div>
        </div>
        {{/each}}
    </script>


    <script>
        var bid = '${posts.id}';
        var id;
        var replyTitle;
        var replyDes;
        var replyPage = 1;
        getPageList(1); //초기

        //페이징 버튼
        $(".pagination").on("click", "li a", function (event) {
            event.preventDefault();
            replyPage = $(this).attr("href");
            console.log("href" + replyPage);
            getPageList(replyPage);
        });

        //댓글 달기 버튼
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
                    uid: $("#uid").val(),
                    replyer: $("#newReplyWriter").val(),
                    replytext: $("#newReplyText").val()
                }),
                success: function (result) {
                    if (result == "SUCCESS") {
                        getPageList(replyPage);
                    }
                    $("#newReplyWriter").val("");
                    $("#newReplyText").val("");
                }
            })
        });


        //수정 버튼 눌렀을 때
        function openReplyButton() {
            $("#modDiv" + id).show();
            $("#openModify" + id).hide();
            $("#replyer-input" + id).attr("readonly", false);
            $("#replyer-des" + id).attr("readonly", false);

            //닫기 버튼
            $("#closeBtn" + id).on("click", function () {
                closeReplyButton();
            });
            //댓글 수정
            $("#replyModBtn" + id).on("click", function () {
                $.ajax({
                    type: 'put',
                    url: '/replies/' + id,
                    headers: {
                        "Content-Type": "application/json"
                    },
                    dataType: 'text',
                    data: JSON.stringify({
                        replytext: $("#replyer-des" + id).val()
                    }),
                    success: function (result) {
                        if (result == "SUCCESS") {
                            $("#modDiv" + id).hide();
                            $("#openModify").show();
                            id = "undefined";
                            getPageList(replyPage);
                        }
                    }
                })
            });
            //댓글 지우기
            $("#replyDelBtn" + id).on("click", function () {
                $.ajax({
                    type: 'delete',
                    url: '/replies/' + id,
                    header: {
                        "Content-Type": "application/json"
                    },
                    dataType: 'text',
                    success: function (result) {
                        if (result == "SUCCESS") {
                            getPageList(replyPage);
                        }
                    }
                })
            });

        }
        //수정 버튼
        $("#replies").on("click", ".replycard .replyLi .openModify", function () {
            var reply = $(this).parent().parent();
            if (id != "undefined") {
                closeReplyButton();
            }
            id = reply.attr("data-id");

            //댓글 제목
            replyTitle = reply.children('.replyLi').children('input').attr('value');
            //댓글 설명
            replyDes = reply.children('.replyLi2').children('#replyer-des' + id).val();
            console.log(id);
            console.log(replyDes);
            openReplyButton();
        });
        //닫기 버튼 눌렀을 때
        function closeReplyButton() {
            $("#modDiv" + id).hide();
            $("#openModify" + id).show();
            $("#replyer-input" + id).val(replyTitle);
            $("#replyer-input" + id).attr("readonly", true);
            $("#replyer-des" + id).attr("readonly", true);
            $("#replyer-des" + id).val(replyDes);
        }



        //댓글 리스트
        function getPageList(page) {
            $.getJSON("/replies/" + bid + "/" + page, function (data) {
                var source = $("#template").html();
                var template = Handlebars.compile(source);
                $("#replies").html(template(data.list));
                printPaging(data.pm);
            })
        }

        //페이징
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

        Handlebars.registerHelper("ReplyerCheck", function (uid, block) {
            var accum = '';
            if (uid == '${login.id}') {
                accum += block.fn(this);
            }
            console.log(accum);
            return accum;
        });
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


    <script>
        //textarea 자동 조절
        function auto_grow(element) {
            element.style.height = "5px";
            element.style.height = (element.scrollHeight) + "px";
        }
    </script>
</body>

</html>