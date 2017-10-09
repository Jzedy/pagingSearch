package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Jzedy on 2017/10/7.
 */
public class StringUtil {
    public static boolean isNum(String str){
        boolean flag = false;
        String p = "^[1-9]\\d*$";
        /*Pattern pattern = Pattern.compile(p);
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();*/
//        if (Pattern.matches(p,str)&&!isEmpty(str)) flag = true;
        if (!isEmpty(str)){
            if (Pattern.matches(p,str)) flag =true;
        }
        return flag;
    }

    public static boolean isEmpty(String str){
        if (str!=null&&!"".equals(str.trim())){
            return false;
        }else return true;
    }

}
