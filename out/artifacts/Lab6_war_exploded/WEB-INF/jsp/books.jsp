<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
      <link rel="icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Books</title>


<style>
body {font-family: Arial, Helvetica, sans-serif;}
/*  https://www.w3schools.com/html/tryit.asp?filename=tryhtml_lists_menu */
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #3e4f7a  ;
}

li {
    float: right;
}

.li-left {
    float: left;
}

li a {
    display: block;
    color: white;  
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111111;
}


/* https://www.w3schools.com/html/html_tables.asp */

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
h4 {
    float: right;
}

img {
    float: left;
}

a:link {
    color: #0404B4;
    background-color: transparent;
    text-decoration: none;
}
a:visited {
    color: #0404B4;
    background-color: transparent;
    text-decoration: none;
}
a:hover {
    color: #0404B4;
    background-color: transparent;
    text-decoration: none;
}
a:active {
    color: #0404B4;
    background-color: transparent;
    text-decoration: none;
    }
</style>

</head>
<body>
<ul>
  <li class= "li-left" ><a href="/NTULab6Jdbc/"  style= "color: white;">NTU library</a></li>
  
  <li><a href="/NTULab6Jdbc/logoutServlet" style= "color: white;">Logout</a>
		<!--   <form action="logoutServlet" method="post">
		     <input type="submit" value="Logout" >
		</form> --> 
  
  </li>
  
    <li><a href="/NTULab6Jdbc/" style= "color: white;">  
					<c:forEach var="cookies" items="${cookie}">						        
					    <c:if test="${cookies.key == 'user'}" >					
					 	   <c:out value="${cookies.value.value}"/>					
						</c:if>    
					</c:forEach>     
   
   </a>
   </li>
 
  
</ul>

  <c:choose>
      <c:when test = "${bookAll != null}">
      <h4> <a href="book-record" >ADD NEW BOOK</a> </h4>
      <h1>Books   <img src="logoNTU.png"  alt="logo NTU" width="50"  > </h1>
    
        
    <table >
			    <tr>
			        <th>ID</th>
			        <th>title</th>
			        <th>author</th>
			        <th>printYear</th>
			        <th>countOfPages</th>
			        <th colspan=2>Actions</th>
			    </tr>        
			<c:forEach items="${bookAll}" var="book"> 
				<tr>
					<td>     
			    		${book.id}
			     	</td>
			     	<td>     
			    		${book.title}
			     	</td>
			     	<td>     
			    		${book.author}
			     	</td>
			     	<td>     
			    		${book.printYear}
			     	</td>
			     	<td>     
			    		${book.countOfPages}
			     	</td>
			     	
			     <td>	

					 <form action="books" method="get">
					    <input type="hidden" name="action" value= "edit" /> 
					    <input type="hidden" name="bookId" value= "${book.id}" /> 					    
					    <input type="submit" value="Edit" />
					</form> 
 				</td>
				 <td>		     	
					 <form action="books" method="get">
					    <input type="hidden" name="action" value= "delete" /> 
					    <input type="hidden" name="bookId" value= "${book.id}" /> 					    
					    <input type="submit" value="Delete" />
					</form> 

             

				</td>
			     
			    </tr>
			</c:forEach>  
			</table>
       
			    


   </c:when>

   <c:otherwise>
		   <hr>
    <h3 style="color:red;">No books found TEST.</h3>
     <hr>
    <br>
    <h1>Add Book Record <img src="logoNTU.png"  alt="logo NTU" width="50"  > </h1>
   
     <form action="book-record" method="post">
      <table>
 
        <tr><td>title:</td>
            <td><input type="text" name="title" /></td>
        </tr>
        <tr><td>author:</td>
            <td><input type="text" name="author" /></td>
        </tr>
        <tr><td>printYear:</td>
            <td><input type="text" name="printYear" /></td>
        </tr>
        <tr><td>countOfPages:</td>
            <td><input type="text" name="countOfPages" /></td>
        </tr>
        
      </table>
      <input type="submit" value="Save" />
    </form>
    </c:otherwise>

</c:choose>

   
    
</body>
</html>