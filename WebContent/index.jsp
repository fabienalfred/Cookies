<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		Boolean ok = false;
		for(int i=0 ; i<cookies.length ; i++){
			if(cookies[i].getName()!=null && cookies[i].getName().equals("nom")){
				out.print("Bonjour "+cookies[i].getValue());
				ok = true;
			}
			else if(request.getParameter("nom")!=null){
				out.print("Bonjour "+request.getParameter("nom"));
				Cookie c = new Cookie("nom", request.getParameter("nom"));
				cookies[i] = c ;
				response.addCookie(c);
				ok = true;
			}
		}
		if(!ok){
	%>
 			<jsp:include page="form.jsp"></jsp:include>
	<%
		}
	%>
</body>
</html>