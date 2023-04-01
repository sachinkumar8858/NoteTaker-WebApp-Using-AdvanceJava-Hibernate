<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file='All_js_css.jsp' %>
<title>Notes: add_notes page</title>
</head>
<body>
<div class="container">
 <%@include file='navber.jsp' %>
   <h1>This add_notes page</h1>
   <!--add page form -->
   
   <form  action="SaveNoteServlet" method="Post">
	  <div class="form-group">
	    <label for="title">Note Title</label>
	    <input  required name="title" type="text" class="form-control" id="title"  placeholder="Enter the Note title">
	  </div>
	  <div class="form-group">
	    <label for="content">Note Content</label>
	    <textarea required name="content" id="content" class="form-control content" style="height: 250px" placeholder="Enter the Note Content" ></textarea>
	  </div>
	  <div class="container text-center">
	  <button type="submit" class="btn btn-primary">Add</button>
	  </div>
	</form>
   
   </div>
</body>
</html>