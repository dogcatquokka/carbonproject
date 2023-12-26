<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>CARINA - carbon reduce now</title>
<link
	href="${pageContext.request.contextPath}/resources/css/neumorphism.css"
	rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
</head>
<style>

#dataTable {
    max-height: 200px;
    overflow-y: auto;
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
    border-radius: 20px;
}

#dataTable th,
#dataTable td {
    padding: 10px; 
    text-align: left;
    border-bottom: 1px solid #dee2e6;
}

#dataTable th {
    background-color: #218838;
    color: #fff;
}

#dataTable th:first-child {
    border-top-left-radius: 20px; /* 처음 */
}

#dataTable th:last-child {
    border-top-right-radius: 20px; /* 마지막 */
}

#dataTable tbody tr:hover {
    background-color: #c3e6cb;
}

#dataTable tbody tr:first-child:hover {
    background-color: #c3e6cb; /*첫번째 색깔 */
    color: #fff; 
}






</style>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<!-- 년도 선택 -->
	<div style="margin-top: 120px;" class="btn-group mb-2 mr-2">
		<label for="yearclick" class="my-1 mr-2 ml-2-u shadow-soft"></label> <select
			id="yearclick" class="custom-select my-1 mr-sm-2 shadow-soft">

			<c:forEach var="yearbox" items="${year}">
				<option value="${yearbox}" ${yearbox eq year ? 'selected' : ''}>${yearbox}</option>
			</c:forEach>
		</select>
	</div>

	<!-- Display total carbon emissions -->
	<div class="row mb-5-updated">
		<div class="col-12 col-md-6 col-lg-6 mb-5 mb-lg-0 mx-auto">
			<div class="card bg-primary shadow-soft border-light p-4">
				<!-- Header -->
				<div id="totalCarbonEmissionsContainer" class="card-body">
					<ul class="list-unstyled mb-4">

						<li class="list-item pb-2"><img
							src="${pageContext.request.contextPath}/assets/img/carbon/co2.png"
							width="150px" height="150px">
							<h3>
								<strong>총 배출량:</strong>
							</h3> <span id="totalCarbonEmissions" class="highlight"></span>
							<h3>(tonCO2eq)</h3></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6 col-lg-6 mb-5 mb-lg-0 mx-auto">
			<div class="card bg-primary shadow-soft border-light p-4">
				<!-- Header -->
				<div id="totalabsorptionContainer" class="card-body">
					<ul class="list-unstyled mb-4">
						<li class="list-item pb-2"><img
							src="${pageContext.request.contextPath}/assets/img/carbon/tree.png"
							width="150px" height="150px">
							<h3>
								<strong>산림흡수량:</strong>
							</h3> <span id="totalabsorption" class="highlight"></span>
							<h3>(tonCO2eq)</h3></li>
					</ul>
				</div>
			</div>
		</div>
	</div>



		<div class="row">
    <section class="page-section col-lg-6" id="contact" style="margin-top: 20px;">
     <p class="text-right"><strong>단위 : tonCO2eq</strong></p>

<canvas id="myChart" class="card bg-primary shadow-soft border-light" height="270"></canvas>
    </section>
    <div class="col-lg-6">
        <!-- 두 번째 열에 테이블 추가 -->
        <div id="tableContainer" style="margin-top: 20px;">
          <p class="text-right"><strong>단위 : tonCO2eq</strong></p>

            
            <table id="dataTable" class="table shadow-soft rounded" >
                <thead>
                    <tr>
                        <th>도시</th>
                        <th><strong>탄소배출량 </strong></th>
                        <th><strong>탄소흡수량 </strong></th>
                        <th><strong>총계 </strong></th>
                    </tr>
                </thead>
                <tbody>
                  
                </tbody>
            </table>
       
        </div>
    </div>  
</div>


</body>


<!-- ... (previous code) ... -->

<!-- ... (previous code) ... -->

<script>
    $(document).ready(function () {
        // 차트 선언
        var myChart;

        var populateData = function (data) {
            var canvas = document.getElementById('myChart');
            var ctx = canvas.getContext('2d');

            if (myChart) {
                myChart.destroy();
            }

            var carbonValues = data.map(entry => entry.carbonEmissions);
            var absorptionValues = data.map(entry => entry.carbonAbsorption);
            var electricValues = data.map(entry => entry.electricity);
            var gasValues = data.map(entry => entry.greenhouseGas);
            var totalValues = data.map(entry => entry.total);
            var cityLabels = data.map(entry => entry.city);

            myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: cityLabels,
                    datasets: [
                    	{
                    	    label: '탄소배출량',
                    	    data: carbonValues,
                    	    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    	    borderColor: 'rgba(75, 192, 192, 1)',
                    	    borderWidth: 1,
                    	    stack: 'stack1'  
                    	},
                    	{
                    	    label: '탄소흡수량',
                    	    data: absorptionValues,
                    	    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    	    borderColor: 'rgba(255, 99, 132, 1)',
                    	    borderWidth: 1,
                    	    stack: 'stack2'  
                    	},
                    	{
                    	    label: '전기',
                    	    data: electricValues,
                    	    backgroundColor: 'rgba(255, 205, 86, 0.2)',
                    	    borderColor: 'rgba(255, 205, 86, 1)',
                    	    borderWidth: 1,
                    	    stack: 'stack1'  
                    	},
                    	{
                    	    label: '가스',
                    	    data: gasValues,
                    	    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    	    borderColor: 'rgba(54, 162, 235, 1)',
                    	    borderWidth: 1,
                    	    stack: 'stack1'  
                    	},
                    	

                    ]

                },
                options: {
                	 indexAxis: 'y', // 호라이즌 가로막대형
                    scales: {
                        x: {
                        	
                            type: 'linear',
                            beginAtZero: true,
                            ticks: {
                                font: {
                                    weight: 'bold'
                                },
                                color: 'blue',
                                callback: function (value, index, values) {
                                    return value.toLocaleString() + ''; // 숫자 3자리마다 쉼표 표시
                                },
                                suggestedMax: 50000000,
                                maxTicksLimit: 20,
                                stepSize: 10000000,
                            }
                        },
                        
                        y: {
                        	stacked: true,
                            ticks: {
                                font: {
                                    weight: 'bold'
                                },
                                color: 'green',
                                maxTicksLimit: 20,
//                                 maxRotation: 0, 
//                                 minRotation: 0, 
                            }
                        }
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: '탄소 시각화',
                            font: {
                                weight: 'bold',
                                size: 30
                            }
                        },
                        legend: {
                            display: true,
                            labels: {
                                font: {
                                    weight: 'bold'
                                }
                            }
                        }
                    }
                }
            });

            var tableBody = $('#dataTable tbody');
            tableBody.empty();

            for (var i = 0; i < cityLabels.length; i++) {
                var row = $('<tr>').append(
                    $('<td>').text(cityLabels[i]),
                    $('<td>').text(numberWithCommas(carbonValues[i])), // 숫자 3자리마다 쉼표 추가
                    $('<td>').text(numberWithCommas(absorptionValues[i])), // 숫자 3자리마다 쉼표 추가
                    $('<td>').text(numberWithCommas(totalValues[i])) // 숫자 3자리마다 쉼표 추가
                );
                tableBody.append(row);
            }

            //계산하고 보여주기 전체 탄소량 흡수량 (총계)
            var totalCarbonEmissions = carbonValues.reduce(function (sum, value) {
                return sum + value;
            }, 0);
            var totalCarbonAbsorption = absorptionValues.reduce(function (sum, value) {
                return sum + value;
            }, 0);

            $('#totalCarbonEmissions').text(numberWithCommas(totalCarbonEmissions)); // 숫자 3자리마다 쉼표 추가
            $('#totalabsorption').text(numberWithCommas(totalCarbonAbsorption)); // 숫자 3자리마다 쉼표 추가

            // 숫자에 3자리마다 쉼표 추가하는 함수
            function numberWithCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }

        };
        // 초기년도 2022년도 세팅
        var initialYear = 2022;
        $('#yearclick').val(initialYear);

      
        $.ajax({
            type: 'POST',
            url: '<c:url value="/getcarbon" />',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({ year: initialYear }),
            success: function (data) {
                console.log(data);

                // 호출 
                populateData(data);
            },
            error: function (xhr, status, error) {
                console.error('Failed:', error);
                console.log(xhr.responseText);
            }
        });
        $('#yearclick').change(function () {
            var selectedYear = $('#yearclick').val();
			
            console.log("Selected Year: " + selectedYear);

            var json_data = {
                year	: selectedYear
            };

            $.ajax({
                type: 'POST',
                url: '<c:url value="/getcarbon" />',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify(json_data),
                success: function (data) {
                    console.log(data);

                 	// 다시 호출 populateData function 년도 선택할때마다
                    populateData(data);
                },
                error: function (xhr, status, error) {
                    console.error('Failed:', error);
                    console.log(xhr.responseText);
                }
            });
        });
    });
</script>


</body>
</html>
