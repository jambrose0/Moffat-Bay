<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="lodge.beans.LoginDao" %>
<jsp:useBean id="obj" class="lodge.beans.LoginBean"/>
<jsp:setProperty name="obj" property="*" />

<%
    LoginDao loginDao = new LoginDao();

    String email = obj.getEmail();
    String password = obj.getPassword();

    boolean status = loginDao.login(email,password);
    if(status) {
        out.println("You have successfully logged in!");
        session.setAttribute("session", "TRUE");
        response.sendRedirect("index.jsp");
    } else {
        request.setAttribute("login_msg", "Sorry email or password is incorrect");
        request.getRequestDispatcher("Login.jsp").forward(request,response);
    }
%>
<jsp:include page="Login.jsp"></jsp:include>