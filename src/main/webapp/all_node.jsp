<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.*"%>
<%@page import="com.helper.Factoryprovider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All note veiw</title>
<%@include file='All_js_css.jsp' %>
</head>
<body>

<div class="container">
 <%@include file='navber.jsp' %>
   <h1>ALL VEIW NOTES TAKER</h1>
   
   <div class="row">
   <div class="col-12">
   <%
   Session s=Factoryprovider.getFactory().openSession();
	Query<Note> createQuery =  s.createQuery("from Note");
	List<Note> list = createQuery.getResultList();
	for(Note n:list)
	{
		%>
			<div class="card mt-3 mt-auto" > 
			<img alt="" class="card-img-top m-3 mx-auto" src="img/images.png" style="max-width:100px;">
			    <div class="card-body">
			    <h5 class="card-title"><b><%= n.getTitle()%></b></h5>
			    <p class="card-text font-5"><%= n.getContent() %></p>
			    <h4 class="text-primary font-4"><%= n.getAddeddate() %></h4>
			   <div class="container text-center mt-4">
			    <a href="DeleteServlet?note_id=<%= n.getId() %>" class="btn btn-dark">Delete</a>
			     <a href="edit.jsp?note_id=<%= n.getId() %>" class="btn btn-primary">Update</a>
			   </div>
			  </div>
			</div>
		<%
	}
	s.close();
   %>
   
   
   </div>
   </div>
   
   </div>
   
  
</body>
</html>