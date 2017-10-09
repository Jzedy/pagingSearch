package dao;

import model.Pager;
import model.User;


/**
 * Created by Jzedy on 2017/10/9.
 */
public interface UserDao {
    Pager<User> getUsers(User searchModel, int currentPage, int showNums);
}
