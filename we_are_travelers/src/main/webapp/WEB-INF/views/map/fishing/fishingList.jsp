<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="We-Art Project" />
<meta name="author" content="team We-Art" />
<title>We-Art Project</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/weart_map.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Activity Map</title>


</head>
<body>

	<br>
	<br>
	<br>




	<table style="margin-left: auto; margin-right: auto; width: 100%; height: auto; border-collapse: collapse;">
		<tr>
			<td style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td style="border: 1px solid #444444; vertical-align: top; text-align: center;">
				<h3 style="margin-left: 25px; font-size: 13px;">
					<strong> 액티비티 소개></strong> <strong><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
</svg></strong> <strong>전국 액티비티 소개</strong>

				</h3> <c:set var="i" value="0" /> <c:forEach var="mapVo" items="${mapList}">
					<c:if test="${mapVo.map_code == 3}">
						<div class="btn-group">

							<button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${mapVo.map_region}</button>

							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">${mapVo.company_name}</a></li>
							</ul>

						</div>

						<c:set var="i" value="${i+1}" />

						<c:if test="${i == 3}">
							<c:set var="i" value="0" />
							<br>
							<br>
						</c:if>


					</c:if>

				</c:forEach>



			</td>
			<td style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</table>
	<div class="btn-group" role="group" style="float: right">
		<input type="hidden" id="mapSelect" value="">
		<button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" name="map_region">지역별 보기</button>

		<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
			<li value="All"><a class="dropdown-item" href="${pageContext.request.contextPath}/fishingList.do" target="_self">전체리스트</a></li>
			<li value="전북"><a class="dropdown-item" href="${pageContext.request.contextPath}/jeonBuk_fishing.do" target="_self">전북</a></li>
			<li value="전남"><a class="dropdown-item" href="${pageContext.request.contextPath}/jeonNam_fishing.do" target="_self">전남</a></li>
			<li value="충북"><a class="dropdown-item" href="${pageContext.request.contextPath}/chungBuk_fishing.do" target="_self">충북</a></li>
			<li value="충남"><a class="dropdown-item" href="${pageContext.request.contextPath}/chungNam_fishing.do" target="_self">충남</a></li>
			<li value="경북"><a class="dropdown-item" href="${pageContext.request.contextPath}/gyeongBuk_fishing.do" target="_self">경북</a></li>
			<li value="경남"><a class="dropdown-item" href="${pageContext.request.contextPath}/gyeongNam_fishing.do" target="_self">경남</a></li>
			<li value="울산"><a class="dropdown-item" href="${pageContext.request.contextPath}/ulSan_fishing.do" target="_self">울산</a></li>
			<li value="부산"><a class="dropdown-item" href="${pageContext.request.contextPath}/buSan_fishing.do" target="_self">부산</a></li>
			<li value="광주"><a class="dropdown-item" href="${pageContext.request.contextPath}/gwangJu_fishing.do" target="_self">광주</a></li>
			<li value="대전"><a class="dropdown-item" href="${pageContext.request.contextPath}/daeJeon_fishing.do" target="_self">대전</a></li>
			<li value="강원도"><a class="dropdown-item" href="${pageContext.request.contextPath}/gangWondo_fishing.do" target="_self">강원도</a></li>
			<li value="경기도"><a class="dropdown-item" href="${pageContext.request.contextPath}/gyeongGi_do_fishing.do" target="_self">경기도</a></li>
			<li value="서울" id="null"><a class="dropdown-item" href="${pageContext.request.contextPath}/seoul_fishing.do" target="_self">서울</a></li>
			<li value="제주도"><a class="dropdown-item" href="${pageContext.request.contextPath}/jeJu_fishing.do" target="_self">제주</a></li>
		</ul>

	</div>

	<br>


	<hr>
	<div id="List">
		<c:forEach var="mapVo" items="${mapList}">
			<c:if test="${mapVo.map_code == 3}">


				<div class="card mb-3" style="max-width: 87%; margin-left: 100px;">

					<div class="row g-0">
						<div class="col-md-4">

							<img src="${pageContext.request.contextPath}/resources/img/Map_image/fishing/${mapVo.map_image}.jpg" class="img-fluid" alt="이미지가없습니다." style="width: 450px; height: 270px;">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">업체명 : ${mapVo.company_name}</h5>
								<br>
								<p class="card-text">주소지 : ${mapVo.map_addr}</p>
								<p class="card-text">
									<small class="text-muted">
										<button type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/fishingMap.do?map_idx=${mapVo.map_idx}'">위치보기</button>

									</small>
								</p>
								<span class="card-text">&nbsp;&nbsp;&nbsp;&nbsp;지역 : ${mapVo.map_region}</span> <br>

							</div>
						</div>
					</div>
				</div>


				<hr>

			</c:if>
		</c:forEach>
	</div>



	<%@ include file="../../footer.jsp"%>

</body>
</html>