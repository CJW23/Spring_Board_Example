<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">게시글</h3>
                                </div>
                                <div class="card-body">
                                    <form role="form" method="POST">
                                        <input type="hidden" name="id" value="${board.id}">
                                        <input type="hidden" name="curPage" value="${cri.curPage}">
                                        <input type="hidden" name="perPageNum" value="${cri.perPageNum}">

                                        <label class="small mb-1" for="inputFirstName">제목</label>
                                        <input class="form-control py-4" name="title" type="text" value="${board.title}"/>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputEmailAddress">내용</label>
                                            <textarea class="form-control py-4" rows="10" style="resize:none" name="des" aria-describedby="emailHelp">${board.des}</textarea>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm">
                                                <button type="submit" id="save" class="btn btn-primary btn-block">수정</button>
                                            </div>
                                            <div class="col-sm">
                                                <button type="button" onclick="history.back(-1);" id="cancel" class="btn btn-light btn-block">취소</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../resources/board/js/scripts.js"></script>
    <script>
        var form = document.actionform;
        $("#save").on("click", function () {
            form.attr("action", "/modify");
            form.submit();
        });
    </script>
</body>

</html>