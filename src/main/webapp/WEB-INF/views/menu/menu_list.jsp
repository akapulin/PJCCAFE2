<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 목록</title>
<%@ include file="../incl/link.jsp" %>
</head>
<body>
<%@ include file="../incl/header.jsp" %>
<nav id="menuSnb">
<h2 class="hidden">메뉴 타입 선택</h2>
	<form action="viewMenuList" method="get">
		<ul>
			<li>
				<button type="submit" value="C" name="choiceMenu" id="menuC">커피</button>
			</li>
			<li>
				<button type="submit" value="B" name="choiceMenu" id="menuB">음료</button>
			</li>
			<li>
				<button type="submit" value="F" name="choiceMenu" id="menuF">푸드</button>
			</li>
		</ul>
	</form>
</nav>
<section id="menuListContent">
	<h2>메뉴 목록</h2>
	<div id="menuListWrap">
		<form name="updateMenuForm" action="removeMenu" method="post">
			<input type="submit" name="updateMenu" value="추가" id="addMenu" />
			<input type="submit" name="updateMenu" value="수정" id="updateMenu" />
			<input type="submit" name="updateMenu" value="삭제" id="removeMenu" />
			<table>
				<caption class="hidden">메뉴 목록</caption>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
				<tr>
					<th scope="col" id="menuImg">이미지</th>
					<th scope="col" id="menuName">이름</th>
					<th scope="col" id="menuPrice">가격</th>
					<th scope="col" id="stock">재고유무</th>
					<th scope="col" id="choice">선택</th>
				</tr>
				</thead>
				<c:forEach var="m" items="${menus}">
				<tr>
					<td headers="menuImg"><img src="${m.imgPath}"/></td>
					<td headers="menuName">${m.menuName}</td>
					<td headers="menuPrice">${m.menuPrice}</td>
					<td headers="stock">${m.stock}</td>
					<td headers="choice"><input type="radio" name="choiceItem" value="${m.id}" /></td>
					<td></td>
				</tr>
				</c:forEach>
			</table>
			<input class="hidden" value="${choiceMenu}" name="choiceMenu" type="text"/>
		<script>
			$("#addMenu").click(function(e) {
				e.preventDefault();
				popupUpdateMenu("popAddMenu");
			})
			$("#updateMenu").click(function(e) {
				e.preventDefault();
				popupUpdateMenu("popUpdateMenu");
			})
			
			function popupUpdateMenu(goUrl) {
				
				let popUpdateMenuUrl = getContextPath() + "/menu/" + goUrl;
				let popUpdateMenuOption = "width=500px, height=300px, top=300px, left=500px";
				let popUpdateMenuTitle = "메뉴 업데이트";
				
				window.open(popUpdateMenuUrl, popUpdateMenuTitle, popUpdateMenuOption);
				
				let updateMenuForm = document.updateMenuForm;
				updateMenuForm.target = popUpdateMenuTitle;
				updateMenuForm.action = popUpdateMenuUrl;
				
				updateMenuForm.submit();
			}
		</script>
		</form>
	</div>
</section>
</body>
</html>