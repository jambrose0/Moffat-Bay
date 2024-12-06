<%-- 
Jacob Ambrose
Jackie Scott
Marissa Lee
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="lodge.beans.LoginDao" %>
<%@ page import="lodge.beans.LoginBean" %>
<%
    LoginBean obj = new LoginBean();
    obj.setEmail(request.getParameter("email"));
    obj.setPassword(request.getParameter("password"));
    
    LoginDao loginDao = new LoginDao();

    String email = obj.getEmail();
    String password = obj.getPassword();

    boolean status = loginDao.login(email, password);
    if (status) {
        Integer guestID = loginDao.fetchGuestId(email); // ADDED LINE
        if (guestID != null) {
            session.setAttribute("guest_id", guestID);
            session.setAttribute("loggedIn", true); // renamed session for clarity will need to be updated in NavBar.jsp + Res lookup
            session.setAttribute("email", email); // store user's email
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("login_msg", "Error: Unable to retrieve your guest ID.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    } else {
        request.setAttribute("login_msg", "Sorry, email or password is incorrect.");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
%>
<jsp:include page="Login.jsp"></jsp:include>
