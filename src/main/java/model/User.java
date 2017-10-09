package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * Created by Jzedy on 2017/10/7.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String username;
    private int gender;
    private String address;

    public User(Map<String,Object> map){
        this.id = (int) map.get("id");
        this.username = (String) map.get("username");
        this.gender = (int) map.get("gender");
        this.address = (String) map.get("address");
    }
}
