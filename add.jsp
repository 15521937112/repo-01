<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="AddStudentServlet" method="post" >
				学号：<input type="text" name="sno" id="sno"/><br/>
				姓名：<input type="text" name="sname" id="sname"/><br/>
				姓别：<input type="text" name="ssex" id="ssex"/><br/>
				年龄：<input type="text" name="sage" id="sage"/><br/>
				班级：<input type="text" name="sclass" id="sclass"/><br/>
				家庭地址：<input type="text" name="saddress" id="saddress"/><br/>
				<input type="submit" value="增加" /><br/>
		
		</form>

</body>
</html>