<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/weart_item.css" rel="stylesheet" />
    </head>
	<body>
	<header class="header navbar-area">
		<div class="header-middle">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-8 col-md-8 col-10" style="float: none; margin:0 auto;">
						<div class="main-menu-search">
							<div class="navbar-search search-style-5">
								<div class="search-select">
									<div class="select-position">
										<select id="select1">
											<option selected="">All</option>
											<option value="1">option 01</option>
											<option value="2">option 02</option>
											<option value="3">option 03</option>
											<option value="4">option 04</option>
											<option value="5">option 05</option>
										</select>
									</div>
								</div>
								<div class="search-input">
									<input type="text" placeholder="Search">
								</div>
								<div class="search-btn">
									<button><i class="bi bi-search"></i></button>
								</div>
							</div>
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
									<img src="${pageContext.request.contextPath}/resources/img/item/item_sample.png" style="max-width: 500px; max-height: 500px;" alt="#">
								</div>
							</main>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-12">
						<div class="product-info">
							<h2 class="title">쭝꿔러 낚시대</h2>
						    <hr class="featurette-divider">
							<h3 class="price">5천만원<span>1억원</span></h3>
							<p class="info-text">이건 낚시대입니다. 중국산 낚시대. 하나 둘 셋 넷 다섯 여섯 일곱 레인보우 낚시대. 이건 낚시대입니다. 중국산 낚시대. 하나 둘 셋 넷 다섯 여섯 일곱 레인보우 낚시대.</p>
							<p class="info-text">판매자 : ㅇㅇ컴퍼니<br>택배사 : ㅇㅇ택배<br>배송비 : 3000원</p>
	
							<div class="row">
								<div class="col-lg-6 col-md-6 col-6">
									<div class="form-group">
										<label for="color">옵션 선택</label>
										<select class="form-control" id="color">
											<option>1번 옵션</option>
											<option>2번 옵션</option>
											<option>3번 옵션</option>
											<option>4번 옵션</option>
											<option>5번 옵션</option>
										</select>
									</div>
								</div>
	
								<div class="col-lg-6 col-md-6 col-6">
									<div class="form-group quantity">
										<label for="color">수량</label>
										<select class="form-control">
											<option>1개</option>
											<option>2개</option>
											<option>3개</option>
											<option>4개</option>
											<option>5개</option>
										</select>
									</div>
								</div>
							</div> <!-- row -->
	
							<div class="bottom-content">
								<div class="row align-items-end">
									<div class="col-lg-6 col-md-6 col-12" style="margin-top: 20px;">
										<div class="button cart-button">
											<button class="btn" style="width: 100%;">장바구니 담기</button>
										</div>
									</div>
		
									<div class="col-lg-6 col-md-6 col-12" style="margin-top: 20px;">
										<div class="wish-button">
											<button class="btn">바로구매</button>
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
					
						<div class="col-lg-6 col-12">
							<div class="info-body">
								<h4>필수 표기정보</h4>
								<table class="product-details-table">
									<tr>
										<th>품명 및 모델명</th>
										<td>상세페이지 참조</td>
										<th>인증/허가 사항</th>
										<td>상세페이지 참조</td>
									</tr>
									<tr>
										<th>제조국(원산지)</th>
										<td>상세페이지 참조</td>
										<th>제조자(수입자)</th>
										<td>상세페이지 참조</td>
									</tr>
									<tr>
										<th colspan="2">소비자상담 관련 전화번호</th>
										<td colspan="2">상세페이지 참조</td>
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
										<td>상세페이지 참조</td>
										<th rowspan="2">배송비</th>
										<td rowspan="2">상세페이지 참조</td>
									</tr>
									<tr>
										<th>배송사</th>
										<td>ㅇㅇ택배</td>
									</tr>
									<tr>
										<th colspan="2">묶음배송 여부</th>
										<td colspan="2">불가능</td>
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
								<h4>교환/반품 안내</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
								incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
								exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
								irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.</p>
								<h4>Features</h4>
								<ul class="features">
									<li>Capture 4K30 Video and 12MP Photos</li>
									<li>Game-Style Controller with Touchscreen</li>
									<li>View Live Camera Feed</li>
									<li>Full Control of HERO6 Black</li>
									<li>Use App for Dedicated Camera Operation</li>
								</ul>
							</div>
						</div>
						
						<div class="col-lg-6 col-12">
							<div class="info-body">
								<h4>교환/반품 제한사항</h4>
								<ul class="normal-list">
									<li><span>Weight:</span> 35.5oz (1006g)</li>
									<li><span>Maximum Speed:</span> 35 mph (15 m/s)</li>
									<li><span>Maximum Distance:</span> Up to 9,840ft (3,000m)</li>
									<li><span>Operating Frequency:</span> 2.4GHz</li>
									<li><span>Manufacturer:</span> GoPro, USA</li>
								</ul>
								<h4>Shipping Options:</h4>
								<ul class="normal-list">
									<li><span>Courier:</span> 2 - 4 days, $22.50</li>
									<li><span>Local Shipping:</span> up to one week, $10.00</li>
									<li><span>UPS Ground Shipping:</span> 4 - 6 days, $18.00</li>
									<li><span>Unishop Global Export:</span> 3 - 4 days, $25.00</li>
								</ul>
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
								<h4>Details</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
								incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
								exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
								irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.</p>
								<h4>Features</h4>
								<ul class="features">
									<li>Capture 4K30 Video and 12MP Photos</li>
									<li>Game-Style Controller with Touchscreen</li>
									<li>View Live Camera Feed</li>
									<li>Full Control of HERO6 Black</li>
									<li>Use App for Dedicated Camera Operation</li>
								</ul>
							</div>
						</div>
						
						<div class="col-lg-6 col-12">
							<div class="info-body">
								<h4>Specifications</h4>
								<ul class="normal-list">
									<li><span>Weight:</span> 35.5oz (1006g)</li>
									<li><span>Maximum Speed:</span> 35 mph (15 m/s)</li>
									<li><span>Maximum Distance:</span> Up to 9,840ft (3,000m)</li>
									<li><span>Operating Frequency:</span> 2.4GHz</li>
									<li><span>Manufacturer:</span> GoPro, USA</li>
								</ul>
								<h4>Shipping Options:</h4>
								<ul class="normal-list">
									<li><span>Courier:</span> 2 - 4 days, $22.50</li>
									<li><span>Local Shipping:</span> up to one week, $10.00</li>
									<li><span>UPS Ground Shipping:</span> 4 - 6 days, $18.00</li>
									<li><span>Unishop Global Export:</span> 3 - 4 days, $25.00</li>
								</ul>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>


	</section>

		<a href="#" class="scroll-top" style="display: flex;"></a>
        <%@ include file="footer.jsp"%>
    </body>
</html>
