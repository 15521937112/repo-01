<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@page import="java.util.List"%>

<%@page import="com.jiaying.student.Student"%>
<%@page import="com.jiaying.util.Page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息表</title>
</head>
<body>


    <%
		//error:adderror 失败
		//否则：1 确实执行了增加    2直接访问查询全部页面
		String error = (String)request.getAttribute("error") ;//addError
		if(error!=null){
			if(error.equals("addError")){
			
			%>
			<script type="text/javascript">
			 alert("增加失败!");
			 </script>
			 
			 <% 
				//out.print("增加失败！");
			}else if(error.equals("noaddError")){
				%>
		   <script type="text/javascript">
			 alert("增加成功!");
			 </script>
			<% 
				//out.print("增加成功！");
			}//根本没有执行增加
		}	
		
	%>

    <table border="1px" align="center">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>姓别</th>
				<th>年龄</th>
				<th>班级</th>
				<th>家庭地址</th>
				
				<th>删除</th>
			</tr>
			
			<%
				//获取request域中的数据
			//	List<Student> students = (List<Student> )request.getAttribute("students") ;
			   Page p=(Page) request.getAttribute("p");
				for(Student student:p.getStudents()){
			%>
					<tr>
						<td><a href="QueryStudentBySnoServlet?sno=<%=student.getSno() %>"><%=student.getSno() %></a>      </td>
						<td><%=student.getSname() %></td>
						<td><%=student.getSsex() %></td>
						<td><%=student.getSage() %></td>
						<td><%=student.getSclass() %></td>
						<td><%=student.getSaddress() %></td>
						
						
						<td> <a href="DeleteStudentServlet?sno=<%=student.getSno() %>">删除</a> </td>
						
						
					</tr>
			<%
				}
			
			
			%>
		
		</table>
		<a href="add.jsp">新增</a>
		
		<%   
		     if(p.getCurrentPage()==p.getTotalPage()){ 	
		 %>   
		     <a href="QueryStudentByPage?currentPage=1">首页</a>	
		       <a href="QueryStudentByPage?currentPage=<%=p.getCurrentPage()-1 %>">上一页</a>	
		    	 
		    	 
		<%     	   	 
		     }else if(p.getCurrentPage()==1){
		
		%>
		    <a href="QueryStudentByPage?currentPage=<%=p.getCurrentPage()+1%> ">下一页</a>
			<a href="QueryStudentByPage?currentPage=<%=p.getTotalPage()%>">尾页</a>
		
        <% 
            }else{
		%>
		<a href="QueryStudentByPage?currentPage=1">首页</a>	
		<a href="QueryStudentByPage?currentPage=<%=p.getCurrentPage()-1 %>">上一页</a>	
		<a href="QueryStudentByPage?currentPage=<%=p.getCurrentPage()+1%> ">下一页</a>
		<a href="QueryStudentByPage?currentPage=<%=p.getTotalPage()%>">尾页</a>
		<%
		}
		%>
		
		
		
		<form action="QueryStudentByPage" method="post" id="myform">
		选择每页显示条数<select name="pager" onchange="func()">
		 <option value="请选择"  selected="selected" >请选择</option>
		 <option value="1"   >1</option>
		 <option value="2"  >2</option>
		 <option value="3" >3</option>
		 <option value="4" >4</option>
		 <option  value="5"  >5</option>
		 <option value="6" >6</option>
		 <option value="7" >7</option>
		 <option value="8" >8</option>
		 <option value="9"  >9</option>
		 <option value="10" >10</option>
		</select>
		</form>
		
		<script type="text/javascript">
			 function func() {
				var form=document.getElementById("myform");
				
				form.submit();
				
			}
			 </script>
		 
		
</body>
</html>