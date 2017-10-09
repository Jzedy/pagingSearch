package util;


import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;

/**
 * Created by Jzedy on 2017/10/8.
 *
 * 尝试着在该类加载时候加载配置类同时获取连接，
 * 然后只留下查询和更新方法，在方法后面添加finally{closeConnection();},
 * 但是这样失败了，因为static{}只加载一次，当我将该连接关闭的时候再执行查询语句
 * 或更新语句时候就会报错了，提示该connection已经关闭了
 */
public class JdbcUtil {
    private static String DRIVER ;
    private static String URL;
    private static String USERNAME;
    private static String PASSWORD;
    private static Connection connection;
    static {
        loadConfig();
    }


    private static void loadConfig(){
        Properties properties = new Properties();
        InputStream in = JdbcUtil.class.getResourceAsStream("/db.properties");
        try {
            properties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        DRIVER = properties.getProperty("driver");
        URL = properties.getProperty("url");
        USERNAME = properties.getProperty("username");
        PASSWORD = properties.getProperty("password");
    }

    public static Connection getConnection(){
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 查询并将结果封装
     * @param sql 查询语句
     * @param params 参数
     * @return 查询结果
     */
    public static List<Map<String,Object>> executeQuery(String sql,List<?> params){
        List<Map<String,Object>> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            if (params!=null&&!params.isEmpty()){
                int index = 1;
                for (int i = 0; i<params.size();i++){
                    statement.setObject(index++,params.get(i));
                }
            }

            ResultSet resultSet = statement.executeQuery();
            ResultSetMetaData metaData = resultSet.getMetaData();
            int count = metaData.getColumnCount();
            while (resultSet.next()){
                Map<String,Object> map = new HashMap<>();
                for (int i= 0 ; i< count;i++){
                    String name = metaData.getColumnName(i+1);
                    Object value = resultSet.getObject(name);
                    if (value == null) value ="";
                    map.put(name,value);
                }
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int queryCount(String sql,List<?> params){
        PreparedStatement statement = null;
        int count = 0;
        try {
            statement = connection.prepareStatement(sql);
            if (params!=null&&!params.isEmpty()){
                int index = 1;
                for (int i = 0; i<params.size();i++){
                    statement.setObject(index++,params.get(i));
                }
            }
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }


    /**
     * 更新语句
     * @param sql SQL语句
     * @param params 参数
     * @return 是否执行成功
     */
    public static boolean updateOrdelete(String sql ,List<?> params){
        int count = -1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            if (params!=null&&!params.isEmpty()){
                for (int i =0;i<params.size();i++){
                    statement.setObject(i+1,params.get(i));
                }
            }
            count = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count>0?true:false;
    }

    /**
     * 释放资源
     */
    public static void closeConnection(){
        if (connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
