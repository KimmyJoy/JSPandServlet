<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchResult {
		width: 70%;
		height: 650px;
		border: 1px solid red;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
/* widow.onload = function(){
	
}

	$(식별자).함수() */
	$(document).ready(function() {
		$('button').click(function() {
			let searchDate = $('#searchDate').val().split('-').join('')//데이터를 뽑아서 배열로 만들고 스플릿으로 -단위로 잘라서 조인한다는 명령
			console.log(searchDate)
		//	$('#searchResult').empty() //empty는 하위 애들만 지워지는 것 이 자리에 있어도 되고,
			//alert('click')
			//버튼을 누를때 이 함수를 실행해 줘~ 하는 것
			// 2023-06-21 박스 오피스 요청 -> 비동기 통신을 통해서 요청하고 싶은 것
			$.ajax({//이게 jquery ajax임 이게 메소드임
			url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
			type: 'get', //타입이 get과 post 형식을 기재해줌
			data: { 
				key: '031f49c1761536139e22f380f695ba7c',
				//targetDt: '20230622',
				targetDt: searchDate,
				itemPerPage: '5'//이렇게 하면 5순위까지 나옴 원래 댓글도 이렇게 하는거임...댓글서비스를 가져와서 ....하는건데....댓글은 ajax를 쓴다 원래 있던 것 위에 새것이 들어와야해서(화면의 일부분만 수정하는 방식)
			},			//응답 결과는 function의 매개변수로 날아옴 따라서 하단 success function에 변수를 넣어줘야 함
			success: callback,
				/* function(result) {
				console.log(result)
				alert('성공') *///200이면 얘가 뜨고
				error: function(){
				alert('실패')//404 혹은 500이 발생되면 에러를 호출한다
			}
			})
		})
	})
	function callback(result){
		$('#searchResult').empty()//여기에 존재해도 된다
		//아래의 리스트는 함수 내부 값이므로 f12 개발자 도구에서 list를 확인해도 값이 안나옴. 이 경우 전역변수로하고 list로 검색하면 list 배열이 나오고, list[0] 이런 식으로 가면 그에 해당하는 정보들이 다 보인다
		let list = result.boxOfficeResult.dailyBoxOfficeList
		for(let i = 0; i< list.length; i++){
			let movieInfo = list[i]
			let name = movieInfo.movieNm
			let rank = movieInfo.rank
			let audiCnt = movieInfo.audiCnt
			
			$('#searchResult').append('<h4>' + rank +'위</h4>')//동적으로 가져오고 수정할 수 있도록 하는 것 div 안에서만 수정하게 하려고 하는 것
			//화면의 일부만 수정해서  추출해서 특정한 영역(div/span 이런곳)에 뿌리게 하는 것 그래서 dom(도큐먼트) 제어하는 언어를 잘 알아야한다
			$('#searchResult').append('<strong>' + name + '</strong> (' + audiCnt + '명)<br>')//strong도 b랑 유사하지만 좀 중요하다고 생각하는 곳에 적는 것
			$('#searchResult').append('<button>상세보기</button>')//상세보기를 할건데 이걸 하려면 추가 api를 가져와야하고, 공통되는걸 보면 movieCd가 있음...
			$('#searchResult').append('<hr>')
		}
		}
		//등수, 타이틀, 몇명이나 봤는지 한번 찍어 볼 것
	//지도 api는 ajax를 써도되고 안되도 되고...근데 여튼 써야됨 댓글도 ajax dom에서 내가 누구 정보를 알아서~ 하는걸 잘 알아야한다(해야한다)
		//append가 아닌 prepend를 쓰면 앞에다 붙이는 거라서 5위부터 나옴
</script>
</head>
<!-- 이벤트가 발생되려면 body가 다 수행되고 나서 하게 하는 것....body까지 다 호출되면 나오게 해라~ 라는 것 근데 이건 한번만 쓰여진다
그래서 사용하는 키워드가 window.onload 이다 이게 window.onload 메소드를 쓰는 이유 
이걸 대신해서 나온 jquery 명령어가 document ready 임-->
<body>
 <h2>일별 박스오피스 서비스</h2>
 검색일 : <input type="date" id="searchDate"><button>검색</button>
 <h3>검색 결과</h3>
 <div id="searchResult"></div>
</body>
</html>