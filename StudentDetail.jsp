<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="com.jiaying.student.Student"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <%
		
			Student student = (Student)request.getAttribute("student") ;
		%>
		<!--  通过表单展示此人信息 -->
		<form action="UpdateStudentServlet"  align="center" method="post">
				学号:<input type="text" name="sno" value="<%=student.getSno() %>"  readonly="readonly"/><br/>		
				姓名:<input type="text" name="sname" value="<%=student.getSname() %>"/><br/>	
				性别:<input type="text" name="ssex" value="<%=student.getSsex() %>"/><br/>			
				年龄:<input type="text" name="sage" value="<%=student.getSage() %>"/><br/>	
				班级:<input type="text" name="sclass" value="<%=student.getSclass() %>"/><br/>		
				家庭地址:<input type="text" name="saddress" value="<%=student.getSaddress() %>"/><br/>		
				<input type="submit" value="修改"/>
				<a href="QueryStudentByPage">返回</a>
				
		</form>
		

</body>
</html>