package ouhk.groupproject.controller;

import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.groupproject.dao.WebUserRepository;
import ouhk.groupproject.model.WebUser;

@Controller
@RequestMapping("/user")
public class WebUserController {
    @Resource
    WebUserRepository webUserRepo;

    @GetMapping({""})
    public String index() {
        return "login";
    }
    
    @GetMapping({"/manage"})
    public String list(ModelMap model) {
        model.addAttribute("webUsers", webUserRepo.findAll());
        return "manage";
    }

    public static class Form {
        private String username;
        private String password;
        private String[] roles;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        } 
    }

    @GetMapping("/Register")
    public ModelAndView create() {
        return new ModelAndView("Register", "webUser", new Form());
    }

    @PostMapping("/Register")
    public View create(Form form) throws IOException {
        WebUser user = new WebUser(form.getUsername(),
                form.getPassword(), form.getRoles()
        );
        webUserRepo.save(user);
        return new RedirectView("/user/manage", true);
    }


    @GetMapping("/delete/{username}")
    public View deleteTicket(@PathVariable("username") String username) {
        webUserRepo.delete(webUserRepo.findById(username).orElse(null));
        return new RedirectView("/user/list", true);
    }
}
