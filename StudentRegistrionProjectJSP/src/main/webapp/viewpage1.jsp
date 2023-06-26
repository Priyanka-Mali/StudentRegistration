<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post">
<table border="1">
<tr>
	<th>ID</th>
	<th>Student Name</th>
	<th>Course</th>
	<th>Fees</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>


<% 	
if(request.getParameter("submit")!=null)
{
	Connection conn;
	PreparedStatement pst;
	ResultSet rs;
	
	String id=request.getParameter("id");
	String name = request.getParameter("name");
    String course = request.getParameter("course");
    String fees = request.getParameter("fees");
    
		com.mysql.cj.jdbc.Driver d=new com.mysql.cj.jdbc.Driver();
		DriverManager.registerDriver(d);
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
		
		pst=conn.prepareStatement("select *from student");
		pst.setString(1,id);
		pst.setString(2, name);
	    pst.setString(3, course);
	    pst.setString(4, fees);

	    rs=pst.executeQuery();
	    
		while(rs.next())
		{
		%>
		
			<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("course") %></td>
		    <td><%=rs.getString("fees") %></td>
            <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
            <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
            </tr> 
		        
		<% 
		}
}	
		%>
	


</table>
</form>
</body>
</html>
