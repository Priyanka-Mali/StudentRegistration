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
<% 
        String id = request.getParameter("id");
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/studentapp","root","root");
        pst = conn.prepareStatement("delete from student where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
 %>
 <script>
            
            alert("Record Deletee");
            
</script>
</body>
</html>