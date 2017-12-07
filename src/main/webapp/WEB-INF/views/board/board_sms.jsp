<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<form method="post" action="board_sms_insert.nn?board_no=<%=request.getParameter("board_no")%>">

	<textarea rows="5" cols="10" id="board_msg" name="board_msg">

	</textarea>
	
	<input type="hidden" name="member_id" value="" />
	

	<button type="submit" >전송전송!</button>

</form>

</body>
</html>