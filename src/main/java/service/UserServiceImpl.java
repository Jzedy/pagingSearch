package service;

import dao.UserDao;
import dao.UserDaoImpl;
import model.Pager;
import model.User;
import util.StringUtil;

/**
 * Created by Jzedy on 2017/10/9.
 */
public class UserServiceImpl implements UserService {
    private UserDao userDao;
    @Override
    public Pager<User> getUsers(User searchModel, int currentPage, int showNums) {
        userDao = new UserDaoImpl();
        if (!StringUtil.isNum(String.valueOf(currentPage))) currentPage=Pager.CURRENTPAGE;
        if (!StringUtil.isNum(String.valueOf(showNums))) showNums = Pager.SHOWNUMS;
        return userDao.getUsers(searchModel,currentPage,showNums);
    }
}
