package lodge.servlets;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import lodge.beans.LoginDao;

import java.io.IOException;
@WebServlet(name = "LoginServlet")
public class LoginServlet extends jakarta.servlet.http.HttpServlet implements jakarta.servlet.Servlet{
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }
    public void init(ServletConfig config) throws ServletException {
        System.out.println("initiallizing controller servlet");
        super.init(config);

        ServletContext context = config.getServletContext();

//        LoginDao loginDao = new LoginDao(context);
//        loginDao.setdbName(config.getInitParameter("dbName"));
//        loginDao.setDbUser(config.getInitParameter("dbUserName"));
//        loginDao.setDbPassword(config.getInitParameter("dbPassword"));

        context.setAttribute("base",config.getInitParameter("base") );
//        context.setAttribute("loginDao", loginDao);

        try {
            Class.forName(config.getInitParameter("jdbcDriverClass"));
        } catch (ClassNotFoundException e) {
            System.out.println(e.toString());
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
        String base = "/jsp/";
        String url = base + "index.jsp";
        String action = request.getParameter("action");

        if(action != null){
            switch (action) {
                case "login": url = base+"Login.jsp"; break;
                case "register": url = base+"Register.jsp"; break;
                case "about": url = base+"About.jsp"; break;
                case "attraction": url = base+"Attraction.jsp"; break;
                case "checkreservation": url = base+"CheckReservation.jsp"; break;
                case "contact": url = base+"Contact.jsp"; break;
            }
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
        requestDispatcher.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
