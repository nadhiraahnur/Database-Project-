<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="ConnectionManagement.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
</head>
<body>
<h1>USER PROFILE</h1>

<%
String id = request.getParameter("id");
ConnectionManagement cm = new ConnectionManagement();
Connection connection = cm.getConnection();
PreparedStatement pstmt = connection.prepareStatement("select * from user where user_id = ?");
pstmt.setString(1,id);
ResultSet rs = pstmt.executeQuery();
if (rs.next()){
%>

<form method="post" action="user_profile_action.jsp?id=<%=id%>" >

<table>
<tr>
	<td>IC or Passport Number </td> 
	<td><input type="text" name="id" value="<%=rs.getString("user_id")%>"/></td>
</tr>
<tr>
	<td>Phone </td>
	<td><input type="text" name="phone" value="<%=rs.getString("phone")%>"/></td>
</tr>
<tr>
	<td>Face ID </td>
	<td><input type="text" name="faceid" value="<%=rs.getString("face_id")%>"/></td>
</tr>
<tr>
	<td>Thumbprint ID </td>
	<td><input type="text" name="thumbid" value="<%=rs.getString("thumb_id")%>"/></td>
	
</tr>
</table>
<button type="submit">Submit</button>

<%

}else{
	out.println("ERROR: No record found.");
}

%>
</form>
</body>
</html>