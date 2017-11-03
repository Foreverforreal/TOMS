package zhu.dao;

import junit.framework.TestCase;
import org.springframework.beans.factory.annotation.Autowired;
import zhu.entity.User;
import zhu.entity.UserExample;

import java.util.List;

/**
 * Created by zhu on 2017/11/3.
 */
public class UserMapperTest extends TestCase {

    @Autowired
    UserMapper userMapper;
    public void setUp() throws Exception {

    }

    public void testCountByExample() throws Exception {
    }

    public void testDeleteByExample() throws Exception {
    }

    public void testDeleteByPrimaryKey() throws Exception {
    }

    public void testInsert() throws Exception {
    }

    public void testInsertSelective() throws Exception {
    }

    public void testSelectByExample() throws Exception {
        UserExample userExample = new UserExample();
        userExample.or().andNameEqualTo("admin");

        List<User> users = userMapper.selectByExample(userExample);
    }

    public void testSelectByPrimaryKey() throws Exception {
    }

    public void testUpdateByExampleSelective() throws Exception {
    }

    public void testUpdateByExample() throws Exception {
    }

    public void testUpdateByPrimaryKeySelective() throws Exception {
    }

    public void testUpdateByPrimaryKey() throws Exception {
    }

    public void testSelectByExample1() throws Exception {
    }

}