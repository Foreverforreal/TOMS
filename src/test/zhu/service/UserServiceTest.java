package zhu.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import zhu.BaseJunitTest;
import zhu.entity.User;

/**
 * Created by zhu on 2017/11/3.
 */
public class UserServiceTest extends BaseJunitTest {
    @Autowired
    UserService userService;

    public void setUp() throws Exception {
    }

    @Test
    public void testFindByName() throws Exception {
        User admin = userService.findByName("admin");
        System.out.println(admin.getName());
    }

    public void testFindRoleByUserName() throws Exception {
    }

}