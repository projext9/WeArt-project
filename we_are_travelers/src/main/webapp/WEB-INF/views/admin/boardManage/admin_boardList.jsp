<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시글 리스트</title>
	<%@include file="../nav/navMain.jsp" %>
</head>
<body style = "margin : 5% 10% 0 10%;">

<h3>게시글 리스트</h3>
<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}/boardList.do" method = "get">
        <table style = "text-align:right">
            <tr>
            	<td>
                    <select name = "board_code">
                   		<option value = "activity">액티비티</option>
                        <option value = "fishing">낚시</option>
                        <option value = "culture">문화</option>
                        <option value = "lodgment">숙박</option>
                        <option value = "camping">캠핑</option>
                    </select>
                </td>
                <td>
                    <select name = "searchType">
                   		<option value = "subject">제목</option>
                        <option value = "writer">작성자</option>
                    </select>
                </td>
                <td>
                    <input type = "text" name = "keyword" size = "30">
                </td>
                <td>
                    <input type = "submit" name = "submit" value = "검색">
                </td>
            </tr>
        </table>
    </form>
	<table class = "table">
		<thead>
			<tr style="text-align:center;">
				<th>번호</th><th>제목</th><th>내용</th><th>종류</th>
				<th>작성일</th><th>작성자</th><th>삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="boardVo" items="${boardList}">
				<tr style="text-align:center;">
					<td>${boardVo.board_idx}</td>
					<td><a href = "${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}">${boardVo.board_subject}</a></td>
					<td>${boardVo.board_content}</td>
					<td>
						<c:choose>
							<c:when test="${boardVo.board_code == 'b_activity'}">액티비티</c:when>
							<c:when test="${boardVo.board_code == 'b_culture'}">문화</c:when>
							<c:when test="${boardVo.board_code == 'b_lodgment'}">숙박</c:when>
							<c:when test="${boardVo.board_code == 'b_fishing'}">낚시</c:when>
							<c:when test="${boardVo.board_code == 'b_camping'}">캠핑</c:when>
						</c:choose>
					</td>
					<td>${boardVo.board_date}</td><td>${boardVo.board_writer}</td>
					<td>${boardVo.board_delyn}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table style="margin-left:auto; margin-right:auto;">
        <tr>
            <td style="width:200px; text-align:right;">
                <c:if test = "${pm.prev == true}">
            		<a href = "${pageContext.request.contextPath}/boardList.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}">◀</a>
            	</c:if>
            </td>
            <td>
            	<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
            		<a href='${pageContext.request.contextPath}/boardList.do?page=${i}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>${i}</a>
            	</c:forEach>
            </td>
            <td style="width:200px; text-align:left;">
            	<c:if test="${pm.next&&pm.endPage > 0}">
            		<a href = '${pageContext.request.contextPath}/boardList.do?page=${pm.endPage + 1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>▶</a>
            	</c:if>
            </td>
        </tr>
    </table>
</body>
</html>