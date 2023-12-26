
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
		

	
	<!-- 파라미터로 넘어온 searchVO+totalRowCount,pageSetting()이 된 searchVO -->
<!-- START : 검색 폼  -->
				<div class="row g-0 justify-content-md-center">
					<div class="col-auto col-sm-5 mb-3">
						<form name="search" action="freeList" method="post">
							<input type="hidden" name="curPage" value="${FreeboardSearchVO.curPage }">
							<input type="hidden" name="rowSizePerPage" value="${FreeboardSearchVO.rowSizePerPage }">
							<div class="input-group">
								<div class="col-sm-2">
									<select id="id_searchType" name="keywordType"
										class="form-control input-sm">
										<option value="T" ${FreeboardSearchVO.keywordType eq "T" ? "selected='selected'":"" }>제목</option>
										<option value="W" ${FreeboardSearchVO.keywordType eq "W" ? "selected='selected'":"" }>작성자</option>
										<option value="C" ${FreeboardSearchVO.keywordType eq "C" ? "selected='selected'":"" }>내용</option>
									</select>
								</div>



		

	
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
			 <div style="display: flex; justify-content: space-between;">
			<form action="${page.Context.request.contextPath }/free/search" method="get" id="searchFoam" name="search-form">
				        <select name="type" class="type-box">
							<option value="">검색 유형 선택</option>
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select>
					<td colspan="2">
		          <input class="inputId" type="search" name="keyword" placeholder="검색어 입력">
		        	</td>
					<td>
			          <input class="submitBtn" type="submit" value="검색하기">
					</td>
				</form>
				</div>
			<table class="table table-striped table-bordered table-hover">
			
				<colgroup>
					<col width="10%" /><col width="15%" /><col /><col width="10%" /><col width="15%" /><col width="10%" />
				</colgroup>
					
				
				<thead>
					<tr>
						<th>글번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
					</tr>
				</thead>
				<tbody>
				     <c:forEach items="${freeList }" var="free">
						<tr class="text-center">
							<td>${free.boardNo }</td>
							<td class="text-left">
								<a href="freeView?boNo=${free.boardNo }">${free.boardTitle }</a>
							</td>
							<td>${free.memId }</td>
							<td>${free.updateDate eq null ? free.createDate:free.updateDate }</td>
							<td>${free.boardHit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="${pageContext.request.contextPath}/freeWrite">
				    <button type="button" class="btn btn-primary">글쓰기</button>
				</a>
								
			</div>
			<!--  페이징 부분 -->
			<nav aria-label="...">
				  <ul class="pagination  justify-content-center">
				    <li class="page-item disabled">
				      <a class="page-link">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active" aria-current="page">
				      <a class="page-link" href="#">2</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				</nav>
			
			
		</div>
		<!-- container -->
	</section>
	
	
</body>
<!-- <script type="text/javascript">
</script> -->

</html>






