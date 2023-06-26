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
    
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
	
	pst = conn.prepareStatement("update student set name = ?,course =?,fees =? where id = ?");
    pst.setString(1, name);
    pst.setString(2, course);
    pst.setString(3, fees);
    pst.setString(4, id);
    pst.executeUpdate();  
    
    %>
    
    <script>   
        alert("Record Updateddddd");           
   </script>
<%          
}	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form  method="POST" action="#" >
<%   
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/studentapp","root","root");
                           
     	String id = request.getParameter("id");
                          
        pst = con.prepareStatement("select * from student where id = ?");
        pst.setString(1, id);
       	rs = pst.executeQuery();
                        
         while(rs.next())
         {           
         %>
         <table>
         <tr>
         <tr><td><input type="text" value="<%=rs.getString("id")%>" name="id" id="id" ></td></tr><br>
         <tr><td><input type="text" value="<%=rs.getString("name")%>" name="name" id="name" ></td><tr><br>
         <tr><td><input type="text" value="<%=rs.getString("course")%>" name="course" id="course" ></td><tr></<br>
         <tr><td><input type="text" value="<%=rs.getString("fees")%>" name="fees" id="fees"></td><tr><br>
         </tr>
         </table>
         <%
         }
         %>
         <br>
         <input type="submit" id="submit" value="submit" name="submit">
         <input type="reset" id="reset"value="reset" name="reset">
         
         <a href="studentRegistration.jsp">Click Back</a>
</form>
</body>
</html>