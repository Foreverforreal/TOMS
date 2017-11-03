package zhu.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import zhu.entity.User;

@Controller
public class LoginController {


    @RequestMapping("/login")
    public String login(User user, boolean isRemember, RedirectAttributes redirectAttributes){
        Subject currentUser = SecurityUtils.getSubject();

        if(!currentUser.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(user.getName(),user.getPassword());
            token.setRememberMe(isRemember);
            try {
                currentUser.login(token);
            } catch (AuthenticationException e) {
                return "login";
            }

        }

        redirectAttributes.addAttribute("token","name");
        return "redirect:index";
    }
}
