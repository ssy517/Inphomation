<%@page import="bit.com.inpho.dto.MemberDto"%>
<%@page import="bit.com.inpho.dto.MyPageMemberDto"%>
<%@page import="io.opencensus.common.ServerStatsFieldEnums.Size"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	MemberDto login = (MemberDto)request.getSession().getAttribute("login");
	int seq=login.getUser_seq();
	%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>hello</title>


<style type="text/css">
a {
	display: none;
}

#team {
	padding: 60px 0;
	text-align: center;
	background-color: #6f85ff;
	color: #fff;
}

#team h2 {
	position: relative;
	padding: 0px 0px 15px;
}

#team p {
	font-size: 15px;
	font-style: italic;
	padding: 0px;
	margin: 25px 0px 40px;
}

#team h2::after {
	content: '';
	border-bottom: 2px solid #fff;
	position: absolute;
	bottom: 0px;
	right: 0px;
	left: 0px;
	width: 90px;
	margin: 0 auto;
	display: block;
}

#team .member {
	margin-bottom: 20px;
	position: relative;
	overflow: hidden;
	background-color: #ffffff;
	padding: 10px;
	border-radius: 15px 0px 15px 0px;
	box-shadow: 0px 1px 6px 0px rgba(0, 0, 0, 0.4);
}

#team .member .member-info {
	display: block;
	position: absolute;
	bottom: 0px;
	left: -200px;
	transition: 0.4s;
	padding: 15px 0;
	background: rgba(0, 0, 0, 0.4);
}

#team .member:hover .member-info {
	left: 0px;
	right: 0px;
}

#team .member h4 {
	font-weight: 700;
	margin-bottom: 2px;
	font-size: 18px;
	color: #fff;
}

#team .member span {
	font-style: italic;
	display: block;
	font-size: 13px;
}

#team .member .social-links {
	margin-top: 15px;
}

#team .member .social-links a {
	transition: none;
	color: #fff;
}

#team .member .social-links a:hover {
	color: #ffc107;
}

#team .member .social-links i {
	font-size: 18px;
	margin: 0 2px;
}

.hashtag {
	  width:  100%;
	height:  100%;
	    margin-left:  auto;     margin-right :  auto;
	    padding:  5px;
	    text-align:  center;
	    line-height:  300px;
	vertical-align: middle;
}

.btn-primary {
	margin-top: 30%;
}

#thumbnailImg {
	height: 566px;
	background-repeat: no-repeat;
}

.content {
	outline: 2px dashed #92b0b3;
	outline-offset: -10px;
	text-align: center;
	transition: all .15s ease-in-out;
	width: 100%;
	background-color: F2F2F2;
	padding-top: 5%;
}

.row {
	display: flex;
	flex-wrap: nowrap;
	margin-right: -16px;
	margin-left: -16px;
}

button:hover {
	background-color: #25C05;
	color: white;
}

,
button:active {
	background-color: #D3F8F;
	color: white;
}

.markup {
	position: relative;
	top: 40%;
	left: 43%;
}

.my-5 {
	margin-top: 4rem !important;
	background-color: #F2F2F2F2;
}

.text-weight-medium {
	background-color: #F2F2F2F2;
}

.frmst {
	margin-bottom: 249px;
	height: 455px;
}

/* image hover */
#photo-gallery {
	padding: 20px 0px 40px;
}

#photo-gallery .state-thumb {
	overflow: hidden;
	border-radius: 10px;
}

#photo-gallery .state-thumb img {
	width: 100%;
	transition: 0.5s;
}

#photo-gallery .photo-frame:hover img {
	transform: scale(1.3, 1.3);
}

#photo-gallery h4 {
	margin: 10px 0px 0px;
	text-align: right;
}

#photo-gallery h4 a {
	color: #9c27b0;
	font-size: 20px;
}

#photo-gallery .photo-frame {
	border: 1px solid #cecece;
	padding: 15px;
	border-radius: 10px;
	transition: 0.3s;
	background-color: #fff;
}

#photo-gallery .photo-frame:hover {
	box-shadow: 0px 0px 15px 0px #d0d0d0;
	border-color: #9c27b0;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/exif-js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/ajaxForm/jquery.form.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

	<div class="container">
		<br>
		<div id="thumbnailUrl"></div>
		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<form id="frm" class="frmst" method="POST" action="Upload"
				encType="multipart/form-data">
				<div class="content rounded mb-4 mb-lg-0" id="mylmg">

					<label for="upImgFile">이미지를 드래그 하거나 여기를 클릭하여 파일을 선택해주세요!
						(PNG, JPG,JEPG)</label> <input type="file" class="imagehide"
						id="upImgFile" name="upImgFile" accept=".jpg, .jpeg, .png"
						multiple="multiple">
					<div class="preview">
						<label class="label"></label>
					</div>
				</div>

				<section id="photo-gallery">

					<div class="photo-frame">
						<div class="state-thumb">
							<div id="thumbnailImg" src="#" class="photo-frame img-fluid">
								<div class="member-info">
									<div class="hashtag"></div>
								</div>

							</div>
						</div>
						<h4>

							<a id="warp" href="#">${hashtag}</a>
						</h4>

					</div>
				</section>

				<!-- </form>
			<form> -->
				<div class="mr-1">
					<div class="card h-100">

						<div class="card-body">

							<div class="postwrite"></div>
							<div class="md-form">

								<input class="form-control form-control-lg" id="hashtag"
									value="">
							</div>
							<c:forEach var="i" items="${cam }">
								<div>
									<input type="button" value="${i.camera_serial }" onclick="camInfo(this);">
								</div>
							</c:forEach>
							<div class="md-form">
								<label class="text" for="inputLGEx">사진을 소개해 주세요!</label>
								<textarea id="conent" name="content"
									class="form-control form-control-lg">${content}"</textarea>
							</div>
							<div class="md-form">
								<label class="text" for="inputLGEx">촬영기기를 알려주세요!</label> <input
									id="cam" name="camera_serial" value="${oneCamera}"
									class="form-control form-control-lg">
							</div>
							<div class="md-form">
								<label class="text" for="inputLGEx">촬영장소를 알려주세요!</label> <input
									id="location" name="location" value="${location}"
									class="form-control form-control-lg">
							</div>
							<div class="md-form">
								<label class="text" for="inputLGEx">나만의 해쉬태그를 보여주세요.</label> <input
									id="hashtags" name="hashtag" value="${hashtag}"
									class="form-control form-control-lg">
							</div>
					 		
							<div class="float-right">
								<input id="done" class="btn btn-primary btn-sm" type="button"
									value="Write">
							</div>
						
						</div>
					</div>
				</div>
			</form>
		</div>

	</div>
	<script type="text/javascript">
		var exifLat;
		var exifLong;
		
		let files;
		let reader;
		let fileInfo;
		var input = document.querySelector('input');
		var preview = document.querySelector('.preview');
		input.style.opacity = 0;
		var latestLocaction;
		function EXIFutil() {
			EXIF.getData(files[0], function() {
				exifLong = EXIF.getTag(files[0], "GPSLongitude");
				exifLat = EXIF.getTag(files[0], "GPSLatitude");
				/* console.log("E:" + exifLong[2]);
				console.log("N:" + exifLat[2]); */
				
			});

		}

		$(".content").on("dragover", dragOver).on("dragleave", dragOver).on(
				"drop", dragFiles);
		function dragOver(e) {
			e.stopPropagation();
			e.preventDefault();
			if (e.type == "dragover") {
				$(e.target).css * ({
					"background-color" : "black",
					"outline-offset" : "-20px"

				});

			} else {
				$(e.target).css({
					"background-colr" : "gray",
					"outline-offset" : "-10px"

				});
			}
		}

		function dragFiles(e) {

			e.stopPropagation();
			e.preventDefault();
			dragOver(e);
			e.dataTransfer = e.originalEvent.dataTransfer;

			files = e.target.files || e.dataTransfer.files;
			if (files.length > 1) {
				arlert("하나만 올려");
				return;
			}
			if (files[0].type.match(/image.*/)) {
				$('#thumbnailImg').css(
						{
							"background-image" : "url("
									+ window.URL.createObjectURL(files[0])
									+ ")",
							"outline" : "none",
							"background-size" : "100% 100%"
						});

			} else {
				console.log("not image!");
				return;
			}
			console.log("파일 이름" + files[0].name);
			EXIFutil();

		}
		$(function() {
			$(".imagehide").change(
					function(e) {
						files = e.target.files || e.dataTransfer.files;
						$('#thumbnailImg').css(
								{
									"background-image" : "url("
											+ window.URL
													.createObjectURL(files[0])
											+ ")",
									"outline" : "none",
									"background-size" : "100% 100%"
								});
						EXIFutil();
						//드래그 관련 
						/* alert($('input[type=file]')[0].files[0].name); //파일이름
						  alert($("#m_file")[0].files[0].type); // 파일 타임
						  alert($("#m_file")[0].files[0].size); // 파일 크기 */
						//  $('input[type=file]')[0].files[0].name;
						//  $("#imgUpload")[0].files[0].type;
						//  $("#imgUpload")[0].files[0].size;
					});

		});
		  $("#done").on("click",function(e){
			var onecam = $('#cam').value;
			 var formm = new FormData($("#frm")[0]);
			 e.preventDefault();
			 formm.append("exifLat", exifLat);
			 formm.append("exifLong", exifLong);
			 formm.append("onecam",onecam);
				$.ajax({
					url : 'Upload',
					type : "POST",
					enctype : 'multipart/form-data',
					data: formm,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						
					},
					error : function() {

					}
				});
		  });

		$("#upImgFile").on("change", function(e) {
			e.preventDefault();
			$.ajax({
				url : "beforeImg",
				type : "POST",
				data : new FormData($("#frm")[0]),
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false,
				datatype : "json",
				success : function(data) {
					$('#hashtag').val(data);
					console.log(data[0]);
					 var tags ={
						data
					} ;
					console.log(tags);
					

				},
				error : function() {

				}
			});

		});
		
	  $.ajax({
         url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('숭의동'),
         type:'GET',
         headers: {'Authorization' : '947798dad31284efccd4088932bc9e07'},
	 success:function(data){
    	 console.log(data);
 },
 error : function(e){
     console.log(e);
 }
}); 
	</script>

</body>
</html>
