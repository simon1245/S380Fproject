package ouhk.groupproject.controller;

import java.io.IOException;
import java.security.Principal;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import ouhk.groupproject.service.WebUserService;

@Controller
@RequestMapping("/user")
public class WebUserController {

    @Autowired
    private WebUserService webUserService;

    @Resource
    WebUserRepository webUserRepo;

    @GetMapping({""})
    public String index() {
        return "login";
    }

    @GetMapping({"/manage_user"})
    public String list(ModelMap model) {
        model.addAttribute("webUsers", webUserRepo.findAll());
        return "manage_user";
    }

    public static class Form {

        private String username;
        private String password;
        private String confirm_password;
        private String full_name;
        private String phone;
        private String address;
        private String error_msg;
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

        public String getConfirm_password() {
            return confirm_password;
        }

        public void setConfirm_password(String confirm_password) {
            this.confirm_password = confirm_password;
        }

        public String getFull_name() {
            return full_name;
        }

        public void setFull_name(String full_name) {
            this.full_name = full_name;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }

        public String getError_msg() {
            return error_msg;
        }

        public void setError_msg(String error_msg) {
            this.error_msg = error_msg;
        }

    }

    @GetMapping("/Register")
    public String create(Model model) {
        Form form = new Form();
        model.addAttribute("webUser", form);
        return "Register";
    }

    @PostMapping("/Register")
    public String create(Model model, Form form) throws IOException {
        if (form.password == null ? form.confirm_password == null : !(form.password.equals(form.confirm_password))) {
            System.out.println(form.password);
            System.out.println("password");
            System.out.println(form.confirm_password);
            form.password = "";
            form.confirm_password = "";
            form.error_msg = "Your password do not match with your comfirm password";
            model.addAttribute("webUser", form);
            return "Register";
        }
        if (form.password.length() < 8) {
            System.out.println("asdad");
            form.password = "";
            form.confirm_password = "";
            form.error_msg = "Your password should have at least 8 characters ";
            model.addAttribute("webUser", form);
            return "Register";
        }
        WebUser user = new WebUser(form.getUsername(),
                form.getPassword(),
                form.getRoles(),
                form.getFull_name(),
                form.getPhone(),
                form.getAddress()
        );
        webUserRepo.save(user);
        for (String role : form.getRoles()) {
            if ("ADMIN".equals(role)) {

                return "redirect:/user/manage_user";
            } else {
                return "redirect:/login";
            }
        }
        return null;
    }

    @GetMapping("/delete/{username}")
    public View deleteTicket(@PathVariable("username") String username) {
        webUserRepo.delete(webUserRepo.findById(username).orElse(null));
        return new RedirectView("/user/manage_user", true);
    }

    @GetMapping("/edit_user/{username}")
    public ModelAndView EditUser(@PathVariable("username") String username,
            Principal principal, HttpServletRequest request) {
        WebUser webUser = webUserRepo.findById(username).orElse(null);
        if (webUser == null
                || !((request.isUserInRole("ROLE_ADMIN")) || (principal.getName() == null ? username == null : principal.getName().equals(username)))) {
            return new ModelAndView(new RedirectView("/menu", true));
        }

        ModelAndView modelAndView = new ModelAndView("edit_user");
        Form Form = new Form();
        if (!(principal.getName().equals(username)))
        {
            Form.setPassword(webUser.getPassword());
            Form.setConfirm_password(webUser.getPassword());
        }

        Form.setUsername(webUser.getUsername());
        Form.setFull_name(webUser.getFull_name());
        Form.setPhone(webUser.getPhone());
        Form.setAddress(webUser.getAddress());
        modelAndView.addObject("webUser", Form);

        request.getSession().setAttribute("user_name",webUser.getUsername());
        
        return modelAndView;
    }

    @PostMapping("/edit_user/{username}")
    public String EditUser(Model model, Form form) throws IOException {
        if (form.password == null ? form.confirm_password == null : !(form.password.equals(form.confirm_password))) {
            System.out.println(form.password);
            System.out.println("password");
            System.out.println(form.confirm_password);
            form.password = "";
            form.confirm_password = "";
            form.error_msg = "Your password do not match with your comfirm password";
            model.addAttribute("webUser", form);
            return "edit_user";
        }
        if (form.password.length() < 8) {
            System.out.println("asdad");
            form.password = "";
            form.confirm_password = "";
            form.error_msg = "Your password should have at least 8 characters ";
            model.addAttribute("webUser", form);
            return "edit_user";
        }
        WebUser user = new WebUser(form.getUsername(),
                form.getPassword(),
                form.getRoles(),
                form.getFull_name(),
                form.getPhone(),
                form.getAddress()
        );
        webUserRepo.save(user);
        for (String role : form.getRoles()) {
            if ("ADMIN".equals(role)) {

                return "redirect:/user/manage_user";
            } else {
                return "redirect:/menu";
            }
        }
        return null;
    }
}
