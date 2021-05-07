package ouhk.groupproject.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping
    public String index() {
        return "redirect:/menu/";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
     @GetMapping("/login/en")
    public String login_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/login";
    }
    
     @GetMapping("/login/zh-HK")
    public String login_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/login";
    }
    
    @GetMapping("/menu/en")
    public String menu_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu";
    }
    
     @GetMapping("/menu/zh-HK")
    public String menu_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/menu";
    }
    
    @GetMapping("/view/en")
    public String view_en(HttpSession httpSession) {
        food_id_access id_access = new food_id_access();
        httpSession.setAttribute("language", "en_US"); 
          
        int id = (int)id_access.getFoodID();
        String path = "redirect:/menu/view/" + id;
        
        return path;
    }
    
     @GetMapping("/view/zh-HK")
    public String view_zh_HK(HttpSession httpSession) {
        food_id_access id_access = new food_id_access();
        httpSession.setAttribute("language", "zh_HK"); 
        
        int id = (int)id_access.getFoodID();
        String path = "redirect:/menu/view/" + id;
        
        return path;
    }
    
    @GetMapping("/viewcart/en")
    public String viewcart_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu/viewcart";
    }
    
     @GetMapping("/viewcart/zh-HK")
    public String viewcart_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/menu/viewcart";
    }
    
    @GetMapping("/manage/en")
    public String manage_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/user/manage";
    }
    
     @GetMapping("/manage/zh-HK")
    public String manage_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/user/manage";
    }
    
     @GetMapping("/make_comment/en")
    public String comment_en(HttpSession httpSession) {
        food_id_access id_access = new food_id_access();
        httpSession.setAttribute("language", "en_US"); 
          
        int id = (int)id_access.getFoodID();
        String path = "redirect:/menu/make_comment/" + id;
        
        return path;
    }
    
     @GetMapping("/make_comment/zh-HK")
    public String comment_zh_HK(HttpSession httpSession) {
        food_id_access id_access = new food_id_access();
        httpSession.setAttribute("language", "zh_HK"); 
        
        int id = (int)id_access.getFoodID();
        String path = "redirect:/menu/make_comment/" + id;
        
        return path;
    }
    
    @GetMapping("/edit/en")
    public String edit_en(HttpSession httpSession) {
        food_id_access id_access = new food_id_access();
        httpSession.setAttribute("language", "en_US"); 
          
        int id = (int)id_access.getFoodID();
        String path = "redirect:/menu/edit/" + id;
        
        return path;
    }
    
     @GetMapping("/edit/zh-HK")
    public String edit_zh_HK(HttpSession httpSession) {
        food_id_access id_access = new food_id_access();
        httpSession.setAttribute("language", "zh_HK"); 
        
        int id = (int)id_access.getFoodID();
        String path = "redirect:/menu/edit/" + id;
        
        return path;
    }
    
      @GetMapping("/create/en")
    public String create_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu/create";
    }
    
     @GetMapping("/create/zh-HK")
    public String create_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/user/Register";
    }
    
    @GetMapping("/Register/en")
    public String Register_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu/create";
    }
    
     @GetMapping("/Register/zh-HK")
    public String Register_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/user/Register";
    }
}
