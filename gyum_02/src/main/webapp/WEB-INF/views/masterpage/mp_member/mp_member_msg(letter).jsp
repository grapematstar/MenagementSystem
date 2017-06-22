<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${msg}');
	if('${noMember}'!=null)window.alert('${noMember}');
	location.href='mp_member_send_notice_letter.do';
</script>