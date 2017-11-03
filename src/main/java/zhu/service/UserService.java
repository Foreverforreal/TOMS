package zhu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zhu.dao.UserMapper;
import zhu.entity.User;
import zhu.entity.UserExample;

import java.util.List;
import java.util.Objects;
import java.util.Set;

/**
 * Created by zhu on 2017/10/29.
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User findByName(String userName){
        UserExample userExample = new UserExample();
        userExample.or().andNameEqualTo(userName);

        List<User> users = null;
        try {
            users = userMapper.selectByExample(userExample);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(users.isEmpty())
            return null;

        return users.get(0);
    }

    public Set<String> findRoleByUserName(String userName){
        User user = findByName(userName);
        if(Objects.nonNull(user)){


        }
        return null;
    }
}
