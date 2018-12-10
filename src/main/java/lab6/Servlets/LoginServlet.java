package lab6.Servlets;

import lab6.Entity.User;
import lab6.Servises.UserServiseDAO;
import lab6.Servises.UserServiseDAOImpl;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "lab6.Servlets.LoginServlet", urlPatterns = "/LoginServlet")
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserServiseDAO userServiseDAO = new UserServiseDAOImpl();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if(!login.equals("") & !password.equals("")){

            User user = userServiseDAO.getUserByLoginAndPassword(login,password);
            if(user != null){
                System.out.println("В бд найден пользователь:");
                user.toString();
                System.out.println("айди = "+user.getId());
            }else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/index.html");
                dispatcher.forward(request, response);
            }
        }else{

            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.html");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserServiseDAO userServiseDAO = new UserServiseDAOImpl();

        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if(!name.equals("") | !login.equals("") | !password.equals("") ){

            System.out.println("Nothing is empty");

            Pattern regex = Pattern.compile("/^[a-z0-9_-]{4,40}$/");

            Matcher m = regex.matcher(login);
            if(!m.matches()){
                System.out.println("Wrong login");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/createAccount.html");
                dispatcher.forward(request, response);
            }

            m = regex.matcher(name);
            if(!m.matches()){
                System.out.println("Wrong name");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/createAccount.html");
                dispatcher.forward(request, response);
            }

            m = regex.matcher(password);
            if(!m.matches()){
                System.out.println("Wrong password");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/createAccount.html");
                dispatcher.forward(request, response);
            }

            User user =  new User();
            user.setName(name);
            user.setLogin(login);
            user.setPassword(password);
            user.setRole("user");

            List<User> users = userServiseDAO.getAllUsers();
            long count = users.stream().filter(u -> u.getLogin().equals(login)).count();
            if(count==0){
                userServiseDAO.insertUser(user);
            }

        }else {

            System.out.println("Something is empty");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/createAccount.html");
            dispatcher.forward(request, response);
        }


    }
}
