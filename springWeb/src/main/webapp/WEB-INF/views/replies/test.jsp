<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    #modDiv{
        width:300px;
        height:100px;
        background-color: gray;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -50px;
        margin-left: -150px;
        padding: 10px;
        z-index: 1000;
    }
</style>
</head>
<body>
    <div>
        replyer <input type="text" name='replyer' id='newReplyWriter'>
        reply text <input type="text" name='replytext' id='newReplyText'>
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
    
    <script>
        var bid = 15;
        var id;
        var replyPage = 1;
        getPageList(1); //초기

        $(".pagination").on("click", "li a", function(event){
            event.preventDefault();
            replyPage = $(this).attr("href");
            console.log("href" + replyPage);
            getPageList(replyPage);
        });
        
        $("#replyAddbtn").on("click", function(){
            $.ajax({
                type:'post',
                url:'/replies',
                headers:{
                    "Content-Type" : "application/json",
                    "X-HTTP-method-Override" : "POST"
                },
                dataType : 'text',
                data : JSON.stringify({
                    bid: bid,
                    replyer: $("#newReplyWriter").val(),
                    replytext: $("#newReplyText").val()
                }),
                success : function(result){
                    if(result == "SUCCESS"){
                        getPageList(replyPage);
                    }
                }
            })
        });
        
        $("#replies").on("click", ".replyLi button", function(){
            var reply = $(this).parent();
            id = reply.attr("data-id");
            var replytext = reply.text();
            
            $(".modal-title").html(id);
            $("#replytext").val(replytext);
            $("#modDiv").show();
            //alert(id + " " + replytext);
        });

        $("#closeBtn").on("click", function(){
            $("#modDiv").hide();
        });

        $("#replyModBtn").on("click", function(){
            $.ajax({
                type:'put',
                url:'/replies/' + id,
                headers:{
                    "Content-Type" : "application/json"
                },
                dataType : 'text',
                data : JSON.stringify({
                    replytext: $("#replytext").val()
                }),
                success : function(result){
                    if(result == "SUCCESS"){
                        alert("modify complete");
                        $("#modDiv").hide();
                        getPageList(replyPage);
                    }
                }
            })
        });

        $("#replyDelBtn").on("click", function(){
            $.ajax({
                type:'delete',
                url:'/replies/' + id,
                header:{
                    "Content-Type" : "application/json"
                },
                dataType : 'text',
                success: function(result){
                    if(result == "SUCCESS"){
                        alert("remove complete");
                        $("#modDiv").hide();
                        getPageList(replyPage);
                    }
                }
            })
        });

        function getPageList(page){
            $.getJSON("/replies/" + bid + "/" + page, function(data){
                var str="";
                $(data.list).each(function(){
                    str += "<li data-id='"+this.id+"' class='replyLi'>" + this.id + ":" + this.replytext + "<Button>modify</Button></li>";
                });
                $("#replies").html(str);
                printPaging(data.pm);
            })
        }
        function printPaging(pageMaker){
            var str = "";

            if(pageMaker.prev){
                str += "<li><a href='"+(pageMaker.startPage-1)+"'> prev </a></li>";
            }
            for(var i=pageMaker.startPage; i <= pageMaker.endPage; i++){
                var strClass=pageMaker.cri.page == i?'class=active':'';
                str += "<li " + strClass+"><a href='"+i+"'>"+i+"</a></li>";
            }
            if(pageMaker.next){
                str += "<li><a href='"+(pageMaker.endPage+1)+"'> next </a></li>";
            }
            $(".pagination").html(str);
        }
    </script>
</body>
</html>