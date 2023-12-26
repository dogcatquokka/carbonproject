<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<!-- 파라미터로 넘어온 searchVO+totalRowCount,pageSetting()이 된 searchVO -->
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="10%" /><col width="15%" /><col /><col width="10%" /><col width="15%" /><col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th><th>분류</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
					</tr>
				</thead>
				<tbody>
				     <c:forEach items="${freeList }" var="free">
						<tr class="text-center">
							<td>${free.boNo }</td>
							<td>${free.boCategoryNm }</td>
							<td class="text-left">
								<a href="freeView?boNo=${free.boNo }">${free.boTitle }</a>
							</td>
							<td>${free.boWriter }</td>
							<td>${free.boModDate eq null ? free.boRegDate:free.boModDate }</td>
							<td>${free.boHit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="freeForm" class="btn btn-primary">글쓰기</a>
			</div>
		</div>
		<!-- container -->
	</section>
</body>
<script type="text/javascript">
</script>

</html>






