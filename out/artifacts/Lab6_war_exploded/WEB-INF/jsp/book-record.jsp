<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
      <link rel="icon" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Record</title>

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


/**/
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
 <li class= "li-left"><a href="/NTULab6Jdbc/" style= "color: white;">NTU library</a></li>
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



  
    <h2>    <c:choose>
		               <c:when test = "${book == null}">  Add Book Record  </c:when>
		
		              <c:otherwise>  Edit Book Record   </c:otherwise>
  			 </c:choose>
    
   				 <img src="logoNTU.png"  alt="logo NTU" width="50"  > </h2>
   
     <form action="book-record" method="post">
      <table>
      		    
          <tr><td></td>
            <td><input type="hidden" readonly="readonly" name="bookId" value="<c:out value="${book.id}" />" /> </td>
        </tr>		    	
       
        <tr><td>title:</td>
            <td><input type="text" name="title" value="<c:out value="${book.title}" />" /></td>
        </tr>
        <tr><td>author:</td>
            <td><input type="text" name="author" value="<c:out value="${book.author}" />" /></td>
        </tr>
        <tr><td>printYear:</td>
            <td><input type="text" name="printYear" value="<c:out value="${book.printYear}" />" /></td>
        </tr>
        <tr><td>countOfPages:</td>
            <td><input type="text" name="countOfPages" value="<c:out value="${book.countOfPages}" />" /></td>
        </tr>
        
      </table>
      <input type="submit" value="Save" />
    </form>


   
    
</body>
</html>