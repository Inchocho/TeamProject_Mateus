<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JQuery_Ajax_연습</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <style type="text/css">
        div.question-box {
            margin: 10px 0 20px 0;
        }

        table {
            border: 1px solid;
            border-collapse: collapse;
        }

        td,
        th {
            padding: 10px;
            border: 1px solid;
        }
    </style>
<script>
		$(function(){
			var abcd = document.getElementById('abcd').value;
            var abc =  document.getElementById('abc').value;	
		});
	
        function q1() {
        	
        	var abcd = document.getElementById('abcd').value;
            var abc =  document.getElementById('abc').value;	
            
            $.ajax({
                type: "GET",
                url: "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=4d9071e4e172fb1139b7795df8163f19&openStartDt=2001&openEndDt=2008&movieNm=" + abcd,
                data: {},
                success: function(response){
                    $("#names-q1").empty();
                    let movieList = response["movieListResult"]["movieList"];
                    for (let i in movieList){
                        let movieCd = movieList[i]["movieCd"];
                        let movieNm = movieList[i]["movieNm"];
                        let openDt = movieList[i]["openDt"];
                        let repNationNm = movieList[i]["repNationNm"];
                        let directors = movieList[i]["directors"];
                        let peopleNm = "";
                        for(var j in directors){
                            peopleNm += directors[j]["peopleNm"];  //무조건 감독 1명만 찍힘                      
                        }
                        let repGenreNm = movieList[i]["repGenreNm"];
                        console.log(movieCd);
                        document.getElementById('abc').value = movieCd;
                        
                        let movie = "";            
                            movie = "<tr id ="  + 'movieTr' + i + ">";                             		
                                       	movie += "<td>" + movieCd + "</td>";
                                        movie += "<td>" + movieNm + "</td>";
                                        movie += "<td>" + openDt +  "</td>";
                                        movie += "<td>" + repNationNm + "</td>";
                                        movie += "<td>" + peopleNm + "</td>";
                                        movie += "<td>" + repGenreNm + "</td>";
                                        movie += "</tr>";                 
                        
                        
                        $("#names-q1").append(movie);                           
                    }
                }
            })                                   
        };

        function q2() {
            var movieCd = document.getElementById('abc').value;

            $.ajax({
                type: "GET",
                url: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=4d9071e4e172fb1139b7795df8163f19&movieCd=" + movieCd,
                data: {},
                success: function(response){                    
                    $("#names-q1").empty();

                    let movieList = response["movieInfoResult"]["movieInfo"];
                    
                        let movieNm = movieList["movieNm"];
                        let prdtYear = movieList["prdtYear"];
                        let showTm = movieList["showTm"];
                        let nations = movieList["nations"];	// 하위 제작국가 nationNm
                        let nationNm = "";
                        for(var j in nations){
                        	nationNm += nations[j]["nationNm"];  //무조건 감독 1명만 찍힘                      
                        }
                        let genres = movieList["genres"];
                        let genreNm = "";
                        for(var j in genres){
                        	genreNm += genres[j]["genreNm"];
                        }
                        let directors = movieList["directors"]; // 하위 감독
                        let peopleNm = "";
                        for(var j in directors){
                            peopleNm += directors[j]["peopleNm"];  //무조건 감독 1명만 찍힘                      
                        }                
                        let audits = movieList["audits"];
                        let watchGradeNm = "";
                        for(var j in audits){
                        	watchGradeNm += audits[j]["watchGradeNm"];
                        }
                         
                        
                        let movie = "";            
                            movie = "<tr>";
                            movie += "<td>" + movieNm + "</td>";
                            movie += "<td>" + prdtYear + "</td>";
                            movie += "<td>" + showTm + "</td>";
                            movie += "<td>" + genreNm + "</td>";
                            movie += "<td>" + nationNm + "</td>";
                            movie += "<td>" + peopleNm + "</td>";      
                            movie += "<td>" + watchGradeNm + "</td>";                                                  
                            movie += "</tr>";
                                                      
                        
                     
                        $("#names-q1").append(movie);
                    
                }
            })
        }     ;   

 
    </script>
</head>

<body>
    <h1>이전에 다룬 jQuery와 Ajax를 활용해보자</h1>

    <hr />

    <div class="question-box">
        제목검색: <input type="text" name="abcd" id='abcd' value="타짜">
        제목검색2: <input type="text" name="abc" id='abc' value="">
        <h2>서울시 따릉이 OpenAPI 사용하기</h2>
        <p>모든 위치의 따릉이 현황을 보여주세요</p>
        <p>업데이트 버튼을 누를 때마다 지웠다 새로 씌여져야 합니다.</p>
        <button onclick="q1()">업데이트</button>
        <button onclick="q2()">업데이트2</button>
        <table>
            <thead>
                <tr>
                    <td>영화코드</td>
                    <td>영화제목</td>
                    <td>제작년도</td>
                    <td>제작국가</td>
                    <td>감독</td>
                    <td>장르</td>
                    <td>버튼</td>
                    <td><input type="button" value="메롱">
                </tr>
            </thead>
            <tbody id="names-q1">
                <tr>
                    <td></td>
                    <td>102. 망원역 1번출구 앞</td>
                    <td>22</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td></td>
                    <td>103. 망원역 2번출구 앞</td>
                    <td>16</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td></td>
                    <td>104. 합정역 1번출구 앞</td>
                    <td>16</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>