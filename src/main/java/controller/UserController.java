package controller;

import model.Pager;
import model.User;
import service.UserService;
import service.UserServiceImpl;
import util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jzedy on 2017/10/9.
 */
@WebServlet("/users")
public class UserController extends HttpServlet {
    private UserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username");
        String gender = req.getParameter("gender");
        String currentPageStr = req.getParameter("currentPage");
        String showNumsStr = req.getParameter("showNums");
        int currentPage=0,showNums =0;
        if (StringUtil.isNum(currentPageStr)) currentPage =Integer.parseInt(currentPageStr);
        if (!StringUtil.isEmpty(showNumsStr)) showNums = Integer.parseInt(showNumsStr);

        User user = new User();
        user.setUsername(username);
        if (!StringUtil.isEmpty(gender)) user.setGender(Integer.parseInt(gender));

        userService = new UserServiceImpl();
        Pager<User> pager = userService.getUsers(user,currentPage,showNums);

        req.setAttribute("pager",pager);
        req.setAttribute("username",username);
        req.setAttribute("gender",gender);
        req.getRequestDispatcher("/jsp/sqlPaging.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
