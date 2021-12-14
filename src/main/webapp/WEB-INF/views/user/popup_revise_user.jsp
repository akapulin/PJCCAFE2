<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/incl/link.jsp" %>
</head>
<body>
	<header></header>
    <main>
        <form action="updateUser" method="post">
            <h1>PJCCAFE</h1>
            <h2>회원 수정</h2>
            <input type="hidden"  name="close" value="${close}"/>
            <table>
            	<tr>
            		<td>
            			<input type="hidden" name="id" id="userId" value="${user.id}">
            		</td>            		
            	</tr>
                <tr>
                    <th class="title">이름</th>
                    <td>
                        <input type="text" name="customerName" id="name" value="${user.customerName}">
                    </td>
                </tr>
                <tr>
                    <th class="title">휴대폰</th>
                    <td>
                        <input type="text" name="phone" id="phone" value="${user.phone}">
                    </td>
                </tr>
                <tr>
                    <th class="title">생년 월 일</th>
                    <td>
                        <input type="text" name="birth" id="birth" value="${user.birth}">
                    </td>
                </tr>
                <tr>
                    <th>포인트</th>
                    <td>
                        <input type="text" name="point" id="point" value="${user.point}">
                    </td>
                </tr>
            </table>
                <div id="buttonWrap">
                <input type="submit" value="수정하기" id="joinbtn">
                <!-- <input type="button" value="취소하기" id="canclebtn" onclick="close()"> -->
                </div>
        </form>
    </main>
    <script>
    	window.onload = function() {
    		if($("input[name=close]").val() == "close"){
    			opener.parent.reloadPage();
    			self.close();
    		}
    	}
    </script>
    <footer></footer>
</body>
</html>