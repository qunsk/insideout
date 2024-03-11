<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>내용</title>

    <script>
        $(function(){
            $("#remsg").click(function(){
                console.log("답장 클릭");
                var id = "${msg.send_id}";
                console.log(id);
                $.ajax({
                    type: "POST",
                    url: "./mb_chk.do",
                    data: {"id": id},
                    success: function(data) {
                        if(data == 1) {  // 존재하는 회원
                            window.open("./writemsg.do?recv_id=" + id, "쪽지보내기", "width=600, height=500, left=100, top=50");
                        } else {  // 탈퇴 회원
                            alert("존재하지 않는 회원입니다.");
                            return false;
                        }
                    }
                });
            });

            $("#delmsg").click(function(){
                console.log("삭제 클릭");
                var del = confirm("삭제하시겠습니까?");
                if(del) {
                    var note_no = "${msg.note_no}";
                    $.ajax({
                        type: "POST",
                        url: "./delmsg.do",
                        data: {"note_no": note_no},
                        success: function(data) {
                            if(data == 1) {  // 삭제 처리
                                alert("삭제되었습니다.");
                                <c:if test="${msg.recv_id eq id}">location.href="./recvlist.do?recv_id=${id}&page=${page}";</c:if>
                                <c:if test="${msg.send_id eq id}">location.href="./sendlist.do?id=${id}&page=${page}";</c:if>
                            } else {
                                alert("다시 시도해주세요.");
                                return false;
                            }
                        }
                    });
                } else return false;
            });
        });
    </script>
</head>
<body>
    <div class="container" style="width:90%; margin:0 auto;">
        <div class="title">
            <c:if test="${msg.send_id eq id}">받는이 ${msg.recv_id }</c:if>
            <c:if test="${msg.recv_id eq id}">보낸이 ${msg.send_id }</c:if>
        </div>

        <div class="form-group" style="height:400px;">
            <textarea class="form-control" id="comment" name="text" disabled="true">${msg.message }</textarea>
        </div>

        <div style="text-align:center;">
            <c:if test="${msg.recv_id eq id }">
                <input type="button" id="remsg" class="btn btn-info btn-sm" value="답장" style=" font-size:1.6rem;">
            </c:if>
            <input type="button" id="delmsg" class="btn btn-danger btn-sm" value="삭제" style=" font-size:1.6rem;">
            <c:if test="${msg.recv_id eq id }">
                <input type="button" id="back" value="목록" class="btn btn-secondary btn-sm" onclick="location.href='./recvlist.do?recv_id=${id}&page=${page }'" style=" font-size:1.6rem;">
            </c:if>
            <c:if test="${msg.send_id eq id }">
                <input type="button" id="back" value="목록" class="btn btn-secondary btn-sm" onclick="location.href='./sendlist.do?id=${id}&page=${page }'" style=" font-size:1.6rem;">
            </c:if>
        </div>
    </div>
</body>
</html>
