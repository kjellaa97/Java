<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 폼</title>
<style type="text/css">
	main { width:fit-content; margin:1em auto;}
	main>h3 { width:fit-content; margin:1em auto; }
	form { padding:1em; border:1px solid black;}
	form label { display:inline-block; width:5em; padding-right:0.5em; text-align: right; }
	form>div { margin:0.5em; }
	div.btn { width:fit-content;  margin:0 auto;}
	div#desc>label{ display:inline-block; height:3em; vertical-align:top; padding-top:1.5em;;}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function formCheck(){
		var name = $('#name').val();
		var birth = $('#birth').val();
		var email = $('#email').val();
		var career = $('#career').val();
		var desc = $('#desc').text();
		var gender = '';
		var subjects = '';
		
		$('input[name=gender]').each(function(index, item){
			if(item.checked) {
				gender = $(item).val();
			}
		});
		$('input[name=subjects]').each(function(index, item){
			if(item.checked) {
				subjects = $(item).val();
			}
		});

		if(name=='' || birth=='' || email=='' || career=='' || desc=='' || gender=='' || subjects=='')
		{
			alert('모든 항목은 필수로 입력해야 합니다');
			return false;
		}
		alert($('#addForm').serialize());
		join();
	}
	
	function join(){
		console.log('join() 시작');
		$.ajax({
			url : 'joinProc.jsp',
			method:'post',
			data: $('#addForm').serialize(),
			cache:false,
			dataType:'json',
			success:function(res){
				alert(res.added ?'회원정보 추가 성공':'정보추가 실패');
			},
			error : function(xhr,status,err){
				alert('에러:' + err);
			}
		});
		return false;
	}
</script>
</head>
<body>
<main>
<h3>회원 가입</h3>
<form id="addForm" onsubmit="return formCheck();">
	<div><label for="name">이 름</label>
		<input type="text" id="name" name="name" value="smith" required>
	</div>
	<div><label for="gender">성 별</label>
		<input type="radio" name="gender" value="m" checked>남
		<input type="radio" name="gender" value="f">여
	</div>
	<div><label for="birth">생 일</label>
		<input type="date" id="birth" name="birth" value="2000-05-12" required>
	</div>
	<div><label for="email">메 일</label>
		<input type="email" id="email" name="email" value="smith@gmail.com" required>
	</div>
	<div><label for="career">경 력</label>
		<input type="number" id="career" name="career" value="2" min="0" max="100">
	</div>
	<div><label for="subjects">관심과목</label>
		<input type="checkbox" name="subjects" value="Java" checked>Java
		<input type="checkbox" name="subjects" value="Python">Python
		<input type="checkbox" name="subjects" value="Spring">Spring
		<input type="checkbox" name="subjects" value="Database">Database
		<input type="checkbox" name="subjects" value="PHP">PHP
	</div>
	<div id="desc"><label for="desc">개인소개</label>
		<textarea id="desc" name="desc" rows="5" cols="45" placeholder="100단어 이내로 입력" required></textarea>
	</div>
	<div class="btn">
		<button type="reset">취소</button>
		<button type="submit">저장</button>
	</div>
</form>
</main>
</body>
</html>