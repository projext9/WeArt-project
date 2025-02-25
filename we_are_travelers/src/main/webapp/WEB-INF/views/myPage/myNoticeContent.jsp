<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1문의</title>
</head>
<body>
	<main style = "margin : 10% 10% 10% 10%;">
		
		<table class = "table">
			<thead>
				<tr style = "text-align:center;">
					<th>문의 유형</th><th>제목</th><th>내용</th><th>작성일</th><th>처리상태</th>
				</tr>
			</thead>
			
			<tbody class = "table-group-divider">
				<c:forEach var="boardVo" items="${myNoticeContent}">
					<tr>
						<th>제목</th>
						<td>${boardVo.board_subject}</td>
						
						<td>
							<c:choose>
								<c:when test ="${boardVo.board_code eq 'm_notice'}"></c:when>
							</c:choose>
						</td>
						<td><a href = "${pageContext.request.contextPath}/myNoticeContent.do?board_idx=${boardVo.board_idx}">${boardVo.board_subject}</a></td>
						<td>${boardVo.board_content}</td>
						<td>${boardVo.board_date}</td>
						<td>
							<c:choose>
								<c:when test = "${boardVo.board_reply eq 0}">처리중</c:when>
								<c:otherwise>처리완료</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>