<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>    
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
    
    try{
    	
	//Class.forName("com.mysql.jdbc.Driver");
	com.mysql.cj.jdbc.Driver d=new com.mysql.cj.jdbc.Driver();
	DriverManager.registerDriver(d);
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
	
	pst=conn.prepareStatement("insert into student values(?,?,?,?)");
	pst.setString(1,id);
	pst.setString(2, name);
    pst.setString(3, course);
    pst.setString(4, fees);

    int val=pst.executeUpdate();
    if(val>0)
    {
    	out.println("registration successfull....");
    }
    else{
    	out.println("ragistration failed....");
    }
            
    }
    catch(Exception ex){
    	out.println(ex);
    }
}    
 %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Registration App </title>
<style>
.htmlpage{
float:left;
margin-right:50px;
}
</style>
</head>
<body>
<div class="htmlpage">
<form method="Post">
<table border="1">
<tr><td>Id</td>
<td><input type="text" name=id ></td></tr>

<tr><td>Name Of Student</td>
<td><input type="text" name=name></td></tr>

<tr><td>Name Of Course</td>
<td><input type="text" name=course></td></tr>

<tr><td>Fees</td>
<td><input type="text" name=fees></td></tr>
<tr><td>
<input type="submit" id="submit" value="submit" name="submit"></td>
<td>
<input type="reset" id="reset"value="reset" name="reset"></td></tr>
</table>

</form>
</div>
<div class="">
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
   

Connection con;
PreparedStatement pst;
ResultSet rs;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/studentapp","root","root");

  String query = "select * from student";
  Statement st = con.createStatement();
  
    rs =  st.executeQuery(query);
    
        while(rs.next())
        {
            String id = rs.getString("id");
   %>

<tr>
 <td><%=rs.getString("id") %></td>
 <td><%=rs.getString("name") %></td>
 <td><%=rs.getString("course") %></td>
 <td><%=rs.getString("fees") %></td>
 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
</tr> 


<%
 
 }
%>

</table>
</div>
</body>
</html>