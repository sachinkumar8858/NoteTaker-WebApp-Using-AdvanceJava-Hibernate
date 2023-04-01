<%@page import="com.entities.Note"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.hibernate.Session"  %>
      <%@ page import="com.helper.Factoryprovider"  %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit page</title>
<%@include file='All_js_css.jsp' %>
</head>
<body>

<div class="container">
 <%@include file='navber.jsp' %>
   <h1>UPDATE NOTES PAGE</h1>
   <%
   
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
	Session s=Factoryprovider.getFactory().openSession();
   
	Note note=(Note) s.get(Note.class,noteId);
	
	
   %>
   
   
   <form  action="UpdateServlet" method="Post">
   <input value="<%=note.getId() %>"  name="noteId" type="hidden"/>
	  <div class="form-group">
	    <label for="title">Note Title</label>
	    <input value="<%= note.getTitle() %>" required name="title" type="text" class="form-control" id="title"  placeholder="Enter the Note title">
	  
	  </div>
	  <div class="form-group">
	    <label for="content">Note Content</label>
	    <textarea required name="content" id="content" class="form-control content" style="height: 250px" placeholder="Enter the Note Content" ><%= note.getContent() %></textarea>
	  </div>
	  <h3><%= note.getAddeddate() %></h3>
	  <div class="container text-center">
	  <button type="submit" class="btn btn-primary">Update Save note</button>
	  </div>
	</form>
   </div>
</body>
</html>