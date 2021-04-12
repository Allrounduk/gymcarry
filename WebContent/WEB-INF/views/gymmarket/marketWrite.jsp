<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<title>양도권 게시글 작성</title>
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<link rel="stylesheet" type="text/css" href="/resources/css/marketWrite.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <script>
        $(document).ready(function(){
            $('.sub').on("click", function(){
                var go_upload = confirm("허위사실 기재 및 부적절한 게시글 작성시 관리자에 의해 삭제될 수 있습니다. 업로드 하시겠습니까?")
                if(go_upload == true) {
                    location.replace("/market/list")
                }else if(go_login == false) {

                }
            });
            $('#summernote').summernote({
      		  height: 400,                 // 에디터 높이
      		  width: 585,
      		  minHeight: 200,             // 최소 높이
      		  maxHeight: 400,             // 최대 높이
      		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
      		  lang: "ko-KR",					// 한글 설정
      		  placeholder: '내용을 입력해주세요.'	//placeholder 설정
      		//콜백 함수
               callbacks : { 
               		onImageUpload : function(files, editor, welEditable) {
                 	// 파일 업로드(다중업로드를 위해 반복문 사용)
                  	for (var i = files.length - 1; i >= 0; i--) {
                  		uploadSummernoteImageFile(files[i], this);
                  	}
                  }
                }  
      		});
           /* 파일 이미지 업로드 */
           function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(editor).summernote('insertImage', data.url);
				}
			});
		}
        })
    </script>
    <div id="wrapper">
        <header id="header">
            <!-- 네이게이션 바 -->
            <div class="frame">
                <a href="#"><img src="${path}/resources/img/gym-carry.png"></a>
                <ul class="navbar">
                    <a href="#"><li class="nav-menu first-nav">GYM STORY</li></a>
                    <a href="#"><li class="nav-menu second-nav">GYM POT</li></a>
                    <a href="#"><li class="nav-menu third-nav">GYM MARKET</li></a>
                    <a href="#"><li class="nav-menu fourth-nav">GEUN DEAL</li></a>
                </ul>
                <ul class="login-box">
                    <a href="#"><li>LOGIN</li></a>
                    <a href="#"><li>JOIN</li></a>
                </ul>
            </div>
        </header>
            
        <main>
            <div class="frame">
                <form action = "/market/write" method="POST">
                    <table>
                        <tr>
                            <th class="table-head" colspan="2">게시글 작성</th>
                        </tr>
                        <tr>
                            <td class="tabletext">제목</td>
                            <td><input type="text" class="textbox title" name="title" placeholder=" 제목을 입력하세요."></td>
                        </tr>
                        <tr>
                            <td class="tabletext">희망가격</td>
                            <td><input type="text" class="textbox price" name="price" placeholder=" 가격을 입력하세요."></td>
                        </tr>
                        <tr>
                            <td class="tabletext">내용</td>
                            <td><textarea id="summernote" name="editordata"></textarea></td>
                        </tr>
                        <!-- <tr>
                            <td class="tabletext">사진첨부1</td>
                            <td><input type="file" name="pic1"></td>
                        </tr>
                        <tr>
                            <td class="tabletext">사진첨부2</td>
                            <td><input type="file" name="pic2"></td>
                        </tr>
                        <tr>
                            <td class="tabletext">사진첨부3</td>
                            <td><input type="file" name="pic3"></td>
                        </tr> -->
                        <tr>
                            <td colspan="2" class="table-go" ><input type="submit" class="buttoms sub" name=submit value="올리기"> <input type="reset" class="buttoms"name=reset value="취소"></td>
                            
                        </tr>
                    </table>
            </form>
        </div>
        </main>
        
        <footer>
            <div class="frame">
                <a href="#"><img src="${path}/resources/img/wLogo.png"></a>
                <div class="footer-contents">
                    <p>(주)올라운덕	<span class="stick"></span>	대표이사 올라운덕	<span class="stick"></span>	사업자등록번호 123-45-67890</p>
                    <p>서울특별시 종로구 종로대로 1000  	 <span class="stick"></span>	고객센터 080-1234-5678 (수신자요금부담)</p>
                </div>
                <p class="copyright"><span>©</span>ALL ROUNDUK. All rights reserved.</p>
            </div>
        </footer>

    </div>
</body>
</html>