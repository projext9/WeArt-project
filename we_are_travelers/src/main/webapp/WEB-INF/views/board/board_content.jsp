<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">
<script>
	$(function() {
		$("*>img").css("max-width", "100%");
		$(".image").css("text-align", "center");
		$(".image-style-side").css("text-align", "end");
		$("input[id=${boardVo.board_delyn}]").prop("disabled", true);
		
		// font-size 입력 값 그대로 적용
		$(".text-huge").css("font-size", "1.8em");
		$(".text-big").css("font-size", "1.4em");
		$(".text-small").css("font-size", "0.85em");
		$(".text-tiny").css("font-size", "0.7em");

		$("#board_content").on("propertychange change paste input", function() {
			if($("#board_content").val().replace(/\s+/g,"")=="") {
				$("#board_content").val(null);
			}
		});
		
		if("${member_idx}"!="") {

			$("*>#before_like${boardVo.board_idx}").click(function() {
				
				let board_idx = "${boardVo.board_idx}";
				let board_like = "1";
				
				$.ajax({
					url:"${pageContext.request.contextPath}/update_like.do",
					method:"POST",
					data: {"board_idx":board_idx, "board_like":board_like},
					success: function(data) {
						$("*>#before_like${boardVo.board_idx}").css("display", "none");
						$("*>#after_like${boardVo.board_idx}").css("display", "");
						like_count();
					},
					error: function(error) {
						alert("실패");
					}
				});
			});
			
			$("*>#after_like${boardVo.board_idx}").click(function() {
				
				let board_idx = "${boardVo.board_idx}";
				let board_like = "0";
				
				$.ajax({
					url:"${pageContext.request.contextPath}/update_like.do",
					method:"POST",
					data: {"board_idx":board_idx, "board_like":board_like},
					success: function(data) {
						$("*>#after_like${boardVo.board_idx}").css("display", "none");
						$("*>#before_like${boardVo.board_idx}").css("display", "");
						like_count();
					},
					error: function(error) {
						alert("실패");
					}
				});
			});
			
		}
		
		$("#insert_reply").click(function() {
			
			let board_idx = "${boardVo.board_idx}";
			let board_content = $("#board_content").val();
			let board_code = "${boardVo.board_code}";

			if(board_content!="") {
				$.ajax({
					type:'post',
					url:"${pageContext.request.contextPath}/insert_reply.do",
					data: {"board_idx":board_idx, "board_code":board_code, "board_content":board_content},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: "json",
					success: function(data) {
						location.reload();
					},
					error: function(error) {
						alert("실패");
					}
				});
			}
		});
		
		function like_count() {
			
			let board_idx = "${boardVo.board_idx}";
			
			$.ajax({
				url:"${pageContext.request.contextPath}/like_count.do",
				method:"POST",
				data:{"board_idx":board_idx},
				success:function(data) {
					$("*>#like_count"+board_idx).html(data);
				},
				error: function(error) {
					alert("실패");
				}
			});
		}
		like_count();
		
		$("#reply_write").click(function() {
			$("#reply_write").css("display", "none");
			$("#reply_content").css("display", "");
		});
		
		$("#reply_cancel").click(function() {
			$("#reply_content").css("display", "none");
			$("#reply_write").css("display", "");
		});
		
		$("#modify_board_delyn").click(function() {
			
			let board_idx = ${boardVo.board_idx};
			let board_delyn = $("input:radio[name=board_delyn]:checked").val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/modify_delyn.do",
				method:"post",
				data: {"board_idx":board_idx, "board_delyn":board_delyn},
				success: function(data) {
					location.href = "${pageContext.request.contextPath}/admin_board_content.do?board_idx="+board_idx;
				},
				error: function(error) {
					alert("실패");
				}
			});
		});
	});
</script>
</head>
<main style="padding-top:115px;">
	<div class="container" style="padding-top:1em;">
		<div class="card">
			<div class="card-header d-flex">
				<h4 class="mb-0 col-9">${boardVo.board_subject}</h4>
				<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
					<small class="text-muted">${boardVo.board_writer} / ${boardVo.board_date}</small>
				</div>
			</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0" style="font-size:1em;">
					<p>${boardVo.board_content}</p>
				</blockquote>
				<hr>
				<div style="text-align:center; font-size:300%;">
					<c:if test="${likeyn!=1}">
						<span id="before_like${boardVo.board_idx}"><i class="bi bi-heart"></i></span>
						<span id="after_like${boardVo.board_idx}" style="display:none;"><i class="bi bi-heart-fill"></i></span>
						<span id="like_count${boardVo.board_idx}"></span>
					</c:if>
					<c:if test="${likeyn==1}">
						<span id="before_like${boardVo.board_idx}" style="display:none;"><i class="bi bi-heart"></i></span>
						<span id="after_like${boardVo.board_idx}"><i class="bi bi-heart-fill"></i></span>
						<span id="like_count${boardVo.board_idx}"></span>
					</c:if>
				</div>
				<hr>
				<div class="d-flex justify-content-between align-items-center">
					<small class="text-muted">
						<c:if test="${likeyn!=1}">
							<span id="before_like${boardVo.board_idx}"><i class="bi bi-heart"></i></span>
							<span id="after_like${boardVo.board_idx}" style="display:none;"><i class="bi bi-heart-fill"></i></span>
							<span id="like_count${boardVo.board_idx}"></span>
						</c:if>
						<c:if test="${likeyn==1}">
							<span id="before_like${boardVo.board_idx}" style="display:none;"><i class="bi bi-heart"></i></span>
							<span id="after_like${boardVo.board_idx}"><i class="bi bi-heart-fill"></i></span>
							<span id="like_count${boardVo.board_idx}"></span>
						</c:if>
						<i class="bi bi-chat-dots" name="board_reply" id="board_reply"></i> ${boardVo.board_reply}
						<i class="bi bi-eye" name="board_hits" id="board_hits"></i> ${boardVo.board_hits}
					</small>
					<c:if test="${boardVo.member_idx==member_idx}">
						<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
							<small class="text-muted">
								<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board_modify.do?board_idx=${boardVo.board_idx}'">수정</button>
								<button type="button" data-bs-toggle="modal" data-bs-target="#delete_board" class="btn btn-outline-danger btn-sm">삭제</button>
							</small>
							<!-- Modal -->
							<div class="modal fade" id="delete_board" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">게시글 삭제</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
										</div>
										<div class="modal-body">
											게시글을 삭제하시겠습니까?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/delete_board.do?board_idx=${boardVo.board_idx}&code=${boardVo.board_code}'">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${member_grade==1}">
						<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
								<!-- 순서 정렬 -->
								<div class="btn-group g-1" role="group">
									<input type="radio" class="btn-check" name="board_delyn" id="N" value="N">
									<label class="btn btn-outline-primary btn-sm" for="N" data-bs-toggle="modal" data-bs-target="#modify_delyn">활성</label>
									<input type="radio" class="btn-check" name="board_delyn" id="S" value="S">
									<label class="btn btn-outline-secondary btn-sm" for="S" data-bs-toggle="modal" data-bs-target="#modify_delyn">정지</label>
									<input type="radio" class="btn-check" name="board_delyn" id="Y" value="Y">
									<label class="btn btn-outline-danger btn-sm" for="Y" data-bs-toggle="modal" data-bs-target="#modify_delyn">삭제</label>
								</div>
							<!-- Modal -->
							<div class="modal fade" id="modify_delyn" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">게시글 상태 변경</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
										</div>
										<div class="modal-body">
											게시글 상태를 변경하시겠습니까?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											<button type="button" class="btn btn-outline-primary" id="modify_board_delyn">게시글 상태 변경</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<span class="input-group-text" style="margin-top:0.5em;">댓글
			<c:if test="${member_idx!=null}">
				<button class="btn btn-outline-primary btn-sm" id="reply_write" style="margin-left:auto;">댓글 쓰기</button>
			</c:if>
		</span>
		<form class="row g-1 needs-validation" id="reply_content" novalidate style="display:none;">
			<div class="col-md-12" style="margin-top:0.5em;">
				<textarea class="form-control" name="board_content" id="board_content" placeholder="내용을 입력하세요" required></textarea>
				<div class="invalid-feedback">
					내용을 입력하세요
				</div>
				<div style="float:right; margin-top:0.3em;">
					<button type="submit" class="btn btn-outline-primary btn-sm" id="insert_reply">확인</button>
					<button type="button" class="btn btn-outline-danger btn-sm" id="reply_cancel">취소</button>
				</div>
			</div>
		</form>
		<c:forEach var="boardVo" items="${board_reply}">
			<div class="list-group col-12" style="margin-top:0.5em;">
				<div class="d-flex align-items-center" style="display: inline-block !important;">
					<div class="card">
						<div class="card-body">
							<div class="d-flex">
								<h5 class="mb-0 col-6 col-sm-7 col-md-8 col-lg-9">${boardVo.board_content}</h5>
								<div class="d-flex justify-content-end align-items-start" style="margin-left:auto;">
									<small class="text-muted">${boardVo.board_writer} / <c:set var="date" value="${boardVo.board_date}"/>${fn:substring(date,2,11)}</small>
								</div>
							</div>
							<div class="d-flex justify-content-start">
								<c:if test="${boardVo.member_idx==member_idx}">
									<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
										<button type="button" data-bs-toggle="modal" data-bs-target="#delete_reply${boardVo.board_idx}" class="btn btn-outline-danger btn-sm">삭제</button>
										<!-- Modal -->
										<div class="modal fade" id="delete_reply${boardVo.board_idx}" tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">댓글 삭제</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
													</div>
													<div class="modal-body">
														댓글을 삭제하시겠습니까?
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/delete_reply.do?board_idx=${boardVo.board_idx}&board_originidx=${boardVo.board_originidx}'">확인</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 페이지네이션 -->
	<div style="margin-top:1em;">
		<ul class="pagination justify-content-center">
		    <c:if test="${pm.prev==true}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?page=${pm.startPage-1}">Previous</a>
			    </li>
			</c:if>
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<c:choose>
					<c:when test="${i==scri.page}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}&page=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}&page=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		    <c:if test="${pm.next&&pm.endPage>0}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}&page=${pm.endPage+1}">Next</a>
			    </li>
			</c:if>
		</ul>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
</main>
</html>
<%@ include file="../footer.jsp"%>