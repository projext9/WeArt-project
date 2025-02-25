<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav.jsp"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/weart_itemdetail.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/weart_itemdetail.js"></script>
		<script>
			$(function() {
			    $(".image").css("text-align", "center");
			    $(".image-style-side").css("text-align", "end");
			});
		</script>
    </head>
	<body>
		<header class="header navbar-area">
			<div class="header-middle">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-8 col-md-8 col-10" style="float: none; margin:0 auto;">
							<div class="main-menu-search">
								<form name="frm">
								<div class="navbar-search search-style-5">
									<div class="search-select">
										<div class="select-position">
											<select id="searchType" name="searchType">
												<option value="subject">상품명</option>
												<option value="content">내용</option>
												<option value="all">상품명+내용</option>
											</select>
											<input type="hidden" id="itemCode" value="${itemCode}">
										</div>
									</div>
									<div class="search-input">
										<input type="text" placeholder="${scri.keyword}" name="keyword">
									</div>
									<div class="search-btn">
										<button onClick="fn_search()"><i class="bi bi-search"></i></button>
									</div>
									&nbsp
									&nbsp
									<a href="${pageContext.request.contextPath}/itemcart.do"><img class="img-icon" src="${pageContext.request.contextPath}/resources/img/icon/icon_cart.png" alt="..." /></a>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		<section class="item-details section">
			<div class="container">
				<div class="top-area">
					<div class="row align-items-center">
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-images">
								<main id="gallery">
									<div class="main-img">
										<img src="${pageContext.request.contextPath}/resources/itemimg/${itemVo.item_img}" style="max-width: 500px; max-height: 500px;" alt="#">
									</div>
								</main>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-info">
								<h2 class="title">${itemVo.item_name}</h2>
							    <hr class="featurette-divider">
								<h3 class="price">&#8361; ${itemVo.item_price}</h3>
								<p class="info-text">${itemVo.item_input1}</p>
								<p class="info-text">판매자 : ${companyVo.company_name}<br>택배회사 : ${itemVo.item_input2}<br>배송비 : ${itemVo.item_postPrice}원</p>

								<div class="row">
									<div class="col-lg-6 col-md-6 col-6">
										<div class="form-group">
											<label for="optionValue">옵션 선택</label>
											<select class="form-control" id="optionValue" onchange="optionSelect(this)">
												<c:forEach var="optionVo" items="${optionList}">
													<c:if test="${optionVo.option_delyn == 'N'}">
														<option value="${optionVo.option_idx}">${optionVo.option_name}(${optionVo.option_price}&#8361;)</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
		
									<div class="col-lg-6 col-md-6 col-6">
										<div class="form-group quantity">
											<label for="color">수량</label>
											<select class="form-control" id="pieceValue" onchange="pieceSelect(this)">
												<option value="1">1개</option>
												<option value="2">2개</option>
												<option value="3">3개</option>
												<option value="4">4개</option>
												<option value="5">5개</option>
											</select>
										</div>
									</div>
								</div> <!-- row -->
		
								<div class="bottom-content">
									<div class="row align-items-end">
										<div class="col-lg-6 col-md-6 col-12" style="margin-top: 20px;">
											<div class="button cart-button">
												<button class="btn" id="additemcart" style="width: 100%;">장바구니 담기</button>
											</div>
										</div>

										<div class="col-lg-6 col-md-6 col-12" style="margin-top: 20px;">
											<div class="wish-button">
												<button class="btn" id="additemcart2" style="width: 100%;">바로구매</button>
											</div>
										</div>
									</div>
								</div>
							</div><!-- product-info -->
						</div>
		
					</div>
				</div>
			</div>
	
			<div class="container">
				<div class="product-details-info">
					<div class="single-block">
						<div class="row">
						
							<div class="col-lg-12 col-12">
								<div class="info-body">
									<h4>상품상세 정보</h4>
									<p>${itemVo.item_content}
									</p>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
	
			<div class="container">
				<div class="product-details-info">
					<div class="single-block">
						<div class="row">
						
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>기본 표기정보</h4>
									<table class="product-details-table">
										<tr>
											<th>품명 및 모델명</th>
											<td>${itemVo.item_input3}</td>
											<th>인증/허가 사항</th>
											<td>${itemVo.item_input4}</td>
										</tr>
										<tr>
											<th>제조국</th>
											<td>${itemVo.item_input5}</td>
											<th>제조자/수입자</th>
											<td>${itemVo.item_input6}</td>
										</tr>
										<tr>
											<th colspan="2">소비자상담 관련 전화번호</th>
											<td colspan="2">${itemVo.item_input7}</td>
										</tr>
									</table>
								</div>
							</div>
							
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>배송정보</h4>
									<table class="product-details-table">
										<tr>
											<th>배송방법</th>
											<td>${itemVo.item_input8}</td>
											<th rowspan="2">배송비</th>
											<td rowspan="2">기본 : ${itemVo.item_postPrice}원<br>-기타배송비-<br>제주도 : ${itemVo.item_input9}원<br>도서산간 : ${itemVo.item_input10}원</td>
										</tr>
										<tr>
											<th>택배회사</th>
											<td>${itemVo.item_input2}</td>
										</tr>
										<tr>
											<th colspan="2">묶음배송 여부</th>
											<td colspan="2">${itemVo.item_input11}</td>
										</tr>
									</table>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
			<div class="container">
				<div class="product-details-info">
					<div class="single-block">
						<div class="row">
						
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>교환/반품/취소 안내</h4>
									<table class="product-details-table">
										<tr>
											<th>교환/반품 비용</th>
										</tr>
										<tr>
											<td>20,000원 미만인 경우 반품비 5,000원
											<br>20,000원 이상인 경우 반품비 2,500원
											</td>
										</tr>
										<tr>
											<th>교환/반품 기준일</th>
										</tr>
										<tr>
											<td>ㆍ단순변심에 의한 상품의 교환/반품은 제품 수령 후 30일 이내까지, 교환/반품 제한사항에 해당하지 않는 경우에만 가능
											<br>(교환/반품 비용 고객부담)
											<br>ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 가능</td>
										</tr>
									</table>

									<table class="product-details-table">
										<tr>
											<th>취소 기준일</th>
											<td>상품발송전(구매당일)</td>
										</tr>
									</table>
								</div>
							</div>
							
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>교환/반품 제한사항</h4>
									<ul class="normal-list">
										<li>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
										<li>ㆍ상품 포장을 개봉 후 사용 또는 설치 완료하여 상품 가치가 훼손된 경우</li>
										<li>(예외 : 내용 확인을 위한 포장 개봉의 경우)</li>
										<li>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
										<li>ㆍ상품 일부 사용, 구성품을 분실 및 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
										<li>ㆍ화면 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</li>
										<li>ㆍ제조사의 사정 (신제품 출시 등) 및 부품 가격 변동 등에 의해 무상 교환/반품을 요청하는 경우</li>
									</ul>
									<h4>상품별 취소/반품 제한 세부사항&nbsp;&nbsp;
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-info btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal1">
									  팝업으로 확인
									</button>
									</h4>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 상품별 취소/반품 제한 세부사항 Modal Start -->
		<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">취소/반품 제한 세부</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<div class="info-body">
							<table class="product-details-table">
								<tr>
									<th>온라인 상품</th>
								</tr>
								<tr>
									<td>ㆍ코드가 발급되어 코드만드로 사용 될 수 있는 상품(유출가능 품목)<br>
										ㆍ이미 사용되어진 상품
									</td>
								</tr>
								<tr>
									<th>의류/잡화/수입명품</th>
								</tr>
								<tr>
									<td>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</td>
								</tr>
								<tr>
									<th>계절상품/식품/화장품</th>
								</tr>
								<tr>
									<td>ㆍ신선/냉장/냉동 식품의 단순변심의 경우<br>
										ㆍ뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,<br>
										   진료 확인서 및 소견서 등을 증빙하면 환불이 가능 (제반비용 고객부담)
									</td>
								</tr>
								<tr>
									<th>전자/가전/설치상품</th>
								</tr>
								<tr>
									<td>ㆍ설치 또는 사용하여 재판매가 어려운 경우, 액정이 있는 상품의 전원을 켠 경우<br>
										ㆍ상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이 적힌 PMP)<br>
										ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우 (노트북, 데스크탑 PC 등)<br>
									</td>
								</tr>
								<tr>
									<th>CD/DVD/GAME/BOOK</th>
								</tr>
								<tr>
									<td>ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우</td>
								</tr>
							</table>
						</div>

					</div>
		    	</div>
		  	</div>
		</div>
		<!-- Modal End -->

		<!-- 비로그인 Modal Start -->
		<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그인 필요</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						로그인 후 사용해 주세요.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/login.do'">로그인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal End -->
		
		<!-- 장바구니 담기 성공 Modal Start -->
		<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">카트 담기 완료</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						상품이 카트에 담겼습니다. 확인 하시겠습니까?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/itemcart.do'">카트 이동</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal End -->

		<a href="${sessionScope.historyBack1}" class="scroll-back" style="display: flex;"><i class="bi bi-arrow-return-left"></i></a>
		<a href="#" class="scroll-top" style="display: flex;"><i class="bi bi-arrow-up"></i></a>
		<%@ include file="../footer.jsp"%>
    </body>
</html>
