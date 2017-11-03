package zhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home(){
        return "forward:/login";
    }
    @GetMapping("/index")
    public String index(String token, Model model){
        System.out.println(token);
        model.addAttribute("token",token);
        return "index";
    }

}
