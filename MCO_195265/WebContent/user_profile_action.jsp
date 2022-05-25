<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="connectMCO.ConnectionManagement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Profile</title>
</head>
<body>
<h1>Updating User Profile</h1>
<% 
boolean valid = true;
String id,phone,faceid,thumbid;
id= request.getParameter("id");
phone= request.getParameter("phone");
faceid= request.getParameter("face_id");
thumbid= request.getParameter("thumb_id");
if(id != null)
{
Connection connection = null;
PreparedStatement pstmt = null;

//input validation

if(phone==null || phone.equals("")){
	valid=false;
%>
<p><font face = "arial" color = "red">Error:Invalid Phone Number</font></p>
<%
}

if(faceid==null || faceid.equals("")){
	valid=false;
%>
<p><font face = "arial" color = "red">Error:Invalid Face ID</font></p>
<%
}

if(thumbid==null || thumbid.equals("")){
	valid=false;
%>
<p><font face = "arial" color = "red">Error:Invalid Thumbprint ID</font></p>
<%
}

}
//save the values to the database
if (valid){
ConnectionManagement cm = new ConnectionManagement();
Connection connection = cm.getConnection();
PreparedStatement pstmt = connection.prepareStatement("update USER set phone = ?,face_id = ?,thumb_id = ? where user_id = " 
+ id);
pstmt.setString(1,phone);
pstmt.setString(2,faceid);
pstmt.setString(3,thumbid);
try{ 
pstmt.executeUpdate();
}catch(Exception e){
	out.println(e.getMessage());
}
int i = pstmt.executeUpdate();
if(i > 0){
	out.println("You have successfully updated for User. Thank You.");
}else {
	out.println("ERROR: Failed to register.");
}
}

%>
</body>
</html>