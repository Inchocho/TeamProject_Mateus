<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function q1() {
	
	var mtObj = document.getElementById('mt').value;
    var mcObj =  document.getElementById('mc').value;	
    
    $.ajax({
        type: "GET",
        url: "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=4d9071e4e172fb1139b7795df8163f19&movieNm=" + mtObj,
        data: {},
        success: function(response){
            $("#movieList").empty();
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
                document.getElementById('mc').value = movieCd;
                
                let movie = "";            
                    movie = "<tr id ="  + 'movieTr' + i + ">";                             		
                               	movie += "<td>" + movieCd + "</td>";
                                movie += "<td>" + movieNm + "</td>";
                                movie += "<td>" + openDt +  "</td>";
                                movie += "<td>" + repNationNm + "</td>";
                                movie += "<td>" + peopleNm + "</td>";
                                movie += "<td>" + repGenreNm + "</td>";   
                                movie += "<td id = " + 'movieCd' + i + "></td>";
                                movie += "</tr>";                 
                
                
                $("#movieList").append(movie);                           
            }
        }
    })                                   
};	

function q2() {
    var movieCd = document.getElementById('mc').value;

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
                                              
                
             
//                 $("#names-q1").append(movie);
            
        }
    })
}     ;  

function movieInfo(){
	
	var movieTitleObj = document.getElementById('movieTitle');      
	var prdtYearObj = document.getElementById('prdtYear');      
    var nationObj = document.getElementById('nation');    
    var directorObj = document.getElementById('director');      
    var runtimeObj = document.getElementById('runtime');     
    var gradeObj = document.getElementById('grade');     
    var priceObj = document.getElementById('price');         	
	
	var table = document.getElementById('movie1');
	var rowList = table.rows;
	
	for(let i = 0; i<rowList.length; i++){
		
		var row = rowList[i];
		var str = "";
		
		row.onclick = function(){
			
			var movieCd = this.cells[0].innerHTML;
			str = movieCd;
			
			this.cells[6].innerHTML = movieCd;
			
// 			document.getElementById('movieCd' + i).innerHTML = str;
		}
	}
	
}

</script>
</head>
<body>
	<input type="text" id='mt' value="">
	<input type="button" onclick='q1();' value='영화검색'>
	<input type="text" id='mc' value="">
	<input type="button" onclick='q2();' value='영화상세검색'>
	
   	<div>
    	<table id = "movie1">
    		<thead>
    			<tr>
    				<td>영화코드</td>
    				<td>영화제목</td>
    				<td>제작년도</td>
    				<td>제작국가</td>
    				<td>감독</td>
    				<td>장르</td>   
    				<td>영화코드2</td> 				
    			</tr>
    		</thead>
    		<tbody id="movieList">
    		
    		</tbody>
    	</table>
   	</div>  	
	
    <div>
    	<div style="float:left; width:250px; height:350px; border:1px solid gray">
    		<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Antarctica_2013_Journey_to_the_Crystal_Desert_%288370623298%29.jpg/250px-Antarctica_2013_Journey_to_the_Crystal_Desert_%288370623298%29.jpg"
    		 style="width: 250px; height:350px;">
    	</div>			  
    	<div  style="height: 350px; border: 1px solid black">
    		<div style='float: left; border:1px solid black'>
		      <input style='height: 44px; width: 200px; border:none' type='text' readonly="readonly" value='영화제목'><br>  
		      <input style='height: 44px; width: 200px; border:none' type='text' readonly="readonly" value='제작년도'><br>     
		      <input style='height: 44px; width: 200px; border:none' type='text' readonly="readonly" value='제작국가'><br>
		      <input style='height: 44px; width: 200px; border:none' type='text' readonly="readonly" value='감독'><br>  
		      <input style='height: 44px; width: 200px; border:none' type='text' readonly="readonly" value='상영시간'><br>
		      <input style='height: 44px; width: 200px; border:none' type='text' readonly="readonly" value='상영등급'><br>
		      <input style='height: 44px; width: 200px; border:none' type='text' readonly="readonly" value='가격'><br>			
    		</div>
    		<div>
			   	<form action='./addCtr.do' method='post' id='submitForm'
			      enctype="multipart/form-data">
				      <input style='height: 40px; width: 400px;' type='text' name='movieTitle' id='movieTitle'><br>      
				      <input style='height: 40px; width: 400px;' type='text' name='prdtYear' id='prdtYear;	'><br>      
				      <input style='height: 40px; width: 400px;' type='text' name='nation' id='nation'><br>      
				      <input style='height: 40px; width: 400px;' type='text' name='director' id='director'><br>      
				      <input style='height: 40px; width: 400px;' type='text' name='runtime' id='runtime'><br>      
				      <input style='height: 40px; width: 400px;' type='text' name='grade' id='grade'><br>      
				      <input style='height: 40px; width: 400px;' type='text' name='price' id='price'><br>           			      
			   </form>
		   </div>    			   
    	</div>  	
    </div>
	
  
</body>
</html>