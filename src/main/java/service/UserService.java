package service;

import model.Pager;
import model.User;

/**
 * Created by Jzedy on 2017/10/9.
 */
public interface UserService {
    Pager<User> getUsers(User searchModel,int currentPage,int showNums);
}
