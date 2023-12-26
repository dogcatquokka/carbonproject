<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
<<<<<<< .mine
	
||||||| .r64
	h1{
		text-align: center;
	}
=======
h1 {
	text-align: center;
}
>>>>>>> .r65
</style>

<meta charset="UTF-8">
<title>회원조회</title>

</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>

	<div class="row mt-10 justify-content-center">
		<div class="col-md-12 text-center">
			<h1 class="display-2">관리자 페이지</h1>
		</div>
	</div>


	<div class="row g-0 justify-content-md-center mt-5">
		<div class="col-sm-1 mb-3 ml-4">
			<div class="btn-group mb-2">
				<button type="button"
					class="btn btn-tertiary dropdown-toggle dropdown-toggle-split"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					style="width: 150px">이름</button>
				<div class="dropdown-menu dropdown-menu-sm text-center">
					<a class="dropdown-item" href="#">ID</a>
				</div>
			</div>
		</div>
		<div class="col-sm-5 mb-3">
			<div class="input-group mb-4">
				<input class="form-control" id="exampleInputIcon2"
					placeholder="이름 또는 아이디를 입력하세요" aria-label="Input group" type="text">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						id="button-addon2" style="width: 120px">
						<span class="fas fa-search"></span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container mb-5">
		<table class="table shadow-soft rounded text-center">
			<colgroup>
				<col width="10%" />
				<col />
				<col width="10%" />
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<!-- 새로운 열 추가 -->
			</colgroup>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이메일</th>
					<th>이름</th>
					<th>시군구코드</th>
					<th>등록일자</th>
					<th>회원삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>ddd@naver.com</td>
					<td>윤기</td>
					<td>12345</td>
					<td>23/11/01</td>
					<td>

						<button class="btn btn-primary" type="button"
							onclick="deleteData(1)">삭제</button>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>eee@naver.com</td>
					<td>상희</td>
					<td>12589</td>
					<td>23/11/02</td>
					<td>
						<button class="btn btn-primary" type="button"
							onclick="deleteData(2)">삭제</button>
					</td>
				</tr>

			</tbody>
		</table>
	</div>

	<script>
		function deleteData(rowNumber) {
			// 해당 행의 데이터를 삭제하는 로직을 여기에 추가
			console.log("Delete data for row: " + rowNumber);

			// 확인 및 취소 버튼이 있는 confirm 창을 띄우고 사용자의 선택 결과를 받음
			var confirmation = confirm("정말로 데이터를 삭제하시겠습니까?");

			// 사용자가 확인을 선택했을 경우
			if (confirmation) {
				// 여기에 실제 데이터 삭제 로직을 추가할 수 있음
				alert("회원이 성공적으로 삭제되었습니다.");
			} else {
				// 사용자가 취소를 선택했을 경우
				alert("회원 삭제가 취소되었습니다.");
			}
		}
	</script>


	<div class="container d-flex justify-content-center">
		<nav aria-label="Blog page navigation">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					aria-label="first link" href="#"><span
						class="fas fa-angle-double-left"></span></a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link"
					aria-label="first link" href="#"><span
						class="fas fa-angle-double-right"></span></a></li>
			</ul>
		</nav>
	</div>

	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>