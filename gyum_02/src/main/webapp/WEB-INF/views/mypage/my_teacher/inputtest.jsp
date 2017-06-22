<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<SCRIPT LANGUAGE="JavaScript">
cnt=0;
function input_append(ff){
  cnt++;
  app = document.getElementById("append");
  app.innerHTML += cnt + " : <input type=text name=txt><br>";
}

function input_result(ff){
  var str = "";
  if(cnt == 1){
    str = ff.txt.value;
  }else{
    for(i=0 ; i<cnt ; i++){
      str += ff.txt[i].value + " | ";
    }
  }
  alert(str);
}
</SCRIPT>

</head>
<body>
<p class="p1">
<b>[사용설명]</b><p>
<hr>
</p>
<form name="frm1">
<input type="button" value="input 태그 추가" onclick="input_append(this.form)">
<div id="append" ></div>

<input type="button" value="입력 결과 출력" onclick="input_result(this.form)">
</form>

</body>
</html>