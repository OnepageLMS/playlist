<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, intitial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
    </script>
    
    <style>
    	.container {
    		width: 560px;
    		background-color: #fff;
    		margin: 0 auto;
    	}
    	
    	section {
            position: fixed;
            text-align: center;
            width: 560px;
            background-color: #fff;
        }
        main {
        	padding: 350px 10px 20px;        
        }
        body {
        	background-color: #eee;
        }
        main {
        	background-color: #fff;
        }
    </style>
</head>
<body>
	<div class="container">
		<section id="video">
		
		</section>
		
		<main>
			<form action="addok" method="post">
				<input type="hidden" name="youtubeID" id="youtubeID" value="">
				start time:  <input type="text" name="start_s" id="start_s"> <br>
				end time: <input type="text" name="end_s" id="end_s"> <br>
				playlist num: <input type="text" name="playlistID" >
				
				<button type="submit"> submit </button>
			</form>
		</main>
		
		
		<p> show list of videos that are in playlistID == 1 </p>
		<c:forEach items="${list }" var="u">
			<c:out value="${u.youtubeID }"/>
			<div>
				<iframe width="560" height="315" src="https://www.youtube.com/embed/${u.youtubeID}?start=${u.start_s}&end=${u.end_s}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
				</iframe>
			</div>
		</c:forEach>
		
		
	</div>
	
	<script>
		$(document).ready(function () {
			var key = 'AIzaSyC0hiwYHhlDC98F1v9ERNXnziHown0nGjg';
			var URL = 'https://www.googleapis.com/youtube/v3/videos';

			var options = {
				part: 'contentDetails',
				id: 'wzAWI9h3q18',
				key: key
			}

			getVidPT();

			function getVidPT() {
				$.getJSON(URL, options, function(data) {
					console.log(data);
					var pt = data.items[0].contentDetails.duration;

					// https://stackoverflow.com/questions/22148885/converting-youtube-data-api-v3-video-duration-format-to-seconds-in-javascript-no
			        var regex = /PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?/;
			        var regex_result = regex.exec(pt); //Can be anything like PT2M23S / PT2M / PT28S / PT5H22M31S / PT3H/ PT1H6M /PT1H6S
			        var hours = parseInt(regex_result[1] || 0);
			        var minutes = parseInt(regex_result[2] || 0);
			        var seconds = parseInt(regex_result[3] || 0);
			        var total_seconds = hours * 60 * 60 + minutes * 60 + seconds;

			       /*  var start = 10;
			        var end = 15; */
			        document.getElementById("start_s").value = 20;
			        document.getElementById("end_s").value = total_seconds;
			        document.getElementById("youtubeID").value = options.id;
				})
			}
			console.log(options);
			mainVid(options.id);
			

			/* function mainVid(id) {
				$('#video').html('
					<iframe width="560" height="315" src="https://www.youtube.com/embed/${id}?start=${start}&end=${end}" frameboder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
				');

			} */
			function mainVid(id) {
				var start = 20;
				var end = 25;
				console.log(`see ==> \${id}`);
				/* console.log("look here => " , options.id , "hehe"); */
				$('#video').html(`
				<iframe width="560" height="315" src="https://www.youtube.com/embed/\${id}?start=\${start}&end=\${end}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
				</iframe>`);
			    console.log(`"https://www.youtube.com/embed/\${id}?start=\${start}&end=\${end}"`);	
			}
				
		})
	</script>
</body>
</html>
