package zhu.realm;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zhu.entity.User;
import zhu.service.UserService;

import java.util.Objects;
import java.util.Set;

@Service
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
        User user = userService.findByName(token.getUsername());

        if(Objects.isNull(user)){
            throw new UnknownAccountException("用户不存在");
        }

        String accountName = user.getName();
        String password = user.getPassword();
        return  new SimpleAuthenticationInfo(accountName,password,getName());

    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String primaryPrincipal = (String)principalCollection.getPrimaryPrincipal();
        Set<String> roles = userService.findRoleByUserName(primaryPrincipal);

        return new SimpleAuthorizationInfo(roles);
    }

}
