package dao;

import constant.Constant;
import model.Pager;
import model.User;
import util.JdbcUtil;
import util.StringUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jzedy on 2017/10/9.
 */
public class UserDaoImpl implements UserDao {
    @Override
    public Pager<User> getUsers(User searchModel, int currentPage, int showNums) {
        List<Map<String, Object>> list1 =null;
        JdbcUtil.getConnection();
        List<User> list = new ArrayList<>();

        List params = new ArrayList();

        //构建sql语句
        StringBuilder sql = new StringBuilder("select * from users where 1=1");
        String username = searchModel.getUsername();
        int gender = searchModel.getGender();


        if (!StringUtil.isEmpty(username)){
            sql.append(" and username like ?");
            params.add("%"+username+"%");
        }
        if (gender== Constant.MALE||gender==Constant.FEMALE){
            sql.append(" and gender = ?");
            params.add(gender);
        }

        //currentPage和showNums的合理性在service层检验
        int totalNums = JdbcUtil.queryCount(sql.toString(),params);
        int fromIndex = (currentPage-1)*showNums;
        if (currentPage*showNums>totalNums){
            fromIndex = (totalNums/showNums)*showNums;
        }
        sql.append(" limit ?,?");

        params.add(fromIndex);
        params.add(showNums);

        list1 = JdbcUtil.executeQuery(sql.toString(), params);
        if (!list1.isEmpty()){
            for (Map<String,Object> map: list1){
                User user = new User(map);
                list.add(user);
            }
        }
        JdbcUtil.closeConnection();
        Pager<User> pager = new Pager<>(list,currentPage,showNums,totalNums);

        return pager;
    }

}
