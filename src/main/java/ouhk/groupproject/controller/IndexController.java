package ouhk.groupproject.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
        httpSession.setAttribute("language", "en_US"); 
          
        String path = "redirect:/menu/view/" + httpSession.getAttribute("foodID");
        
        return path;
    }
    
     @GetMapping("/view/zh-HK")
    public String view_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
         
        String path = "redirect:/menu/view/" + httpSession.getAttribute("foodID");
       
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
        httpSession.setAttribute("language", "en_US"); 

        String path = "redirect:/menu/make_comment/" + httpSession.getAttribute("foodID");
        
        return path;
    }
    
     @GetMapping("/make_comment/zh-HK")
    public String comment_zh_HK(HttpSession httpSession) {
        
        httpSession.setAttribute("language", "zh_HK"); 
    
        String path = "redirect:/menu/make_comment/" + httpSession.getAttribute("foodID");
        
        return path;
    }
    
    @GetMapping("/edit/en")
    public String edit_en(HttpSession httpSession) {

        httpSession.setAttribute("language", "en_US"); 
          
        String path = "redirect:/menu/edit/" + httpSession.getAttribute("foodID");
        
        return path;
    }
    
     @GetMapping("/edit/zh-HK")
    public String edit_zh_HK(HttpSession httpSession) {
        
        httpSession.setAttribute("language", "zh_HK"); 
        
        String path = "redirect:/menu/edit/" + httpSession.getAttribute("foodID");
        
        return path;
    }

    
    @GetMapping("/Register/en")
    public String Register_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/user/Register";
    }
    
     @GetMapping("/Register/zh-HK")
    public String Register_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/user/Register";
    }
    
    @GetMapping("/edit_user/en")
    public String editUser_en(HttpSession httpSession) {
        
        httpSession.setAttribute("language", "en_US"); 
     
        String path = "redirect:/user/edit_user/" + httpSession.getAttribute("user_name");
        
        return path;
    }
    
     @GetMapping("/edit_user/zh-HK")
    public String editUser_zh_HK(HttpSession httpSession) {
         
        httpSession.setAttribute("language", "zh_HK"); 
     
        String path = "redirect:/user/edit_user/" + httpSession.getAttribute("user_name");
        
        return path;
    }
    
    @GetMapping("/edit_menu/en")
    public String editMenu_en(HttpSession httpSession) {
        
        httpSession.setAttribute("language", "en_US"); 
     
        String path = "redirect:/menu/edit_menu/" + httpSession.getAttribute("food_id");
        
        return path;
    }
    
     @GetMapping("/edit_menu/zh-HK")
    public String editMenu_zh_HK(HttpSession httpSession) {
         
        httpSession.setAttribute("language", "zh_HK"); 
     
        String path = "redirect:/menu/edit_menu/" + httpSession.getAttribute("food_id");
        
        return path;
    }
    
    @GetMapping("/checkout/en")
    public String checkout_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu/viewcart/checkout";
    }
    
     @GetMapping("/checkout/zh-HK")
    public String checkout_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/menu/viewcart/checkout";
    }
    
    @GetMapping("/manage_menu/en")
    public String manage_menu_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu/manage_menu";
    }
    
     @GetMapping("/manage_menu/zh-HK")
    public String manage_menu_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/menu/manage_menu";
    }
    
    @GetMapping("/manage_user/en")
    public String manage_user_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/user/manage_user";
    }
    
     @GetMapping("/manage_user/zh-HK")
    public String manage_user_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/user/manage_user";
    }
    
    @GetMapping("/create_menu/en")
    public String create_menu_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu/create_menu";
    }
    
     @GetMapping("/create_menu/zh-HK")
    public String create_menu_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/menu/create_menu";
    }
    
    @GetMapping("/passwordchange/en")
    public String passwordchange_en(HttpSession httpSession) {
        
        httpSession.setAttribute("language", "en_US"); 
     
        String path = "redirect:/user/edit_user/passwordchange/" + httpSession.getAttribute("user_name");
        
        return path;
    }
    
     @GetMapping("/passwordchange/zh-HK")
    public String passwordchange_zh_HK(HttpSession httpSession) {
         
        httpSession.setAttribute("language", "zh_HK"); 
     
        String path = "redirect:/user/edit_user/passwordchange/" + httpSession.getAttribute("user_name");
        
        return path;
    }
    
    @GetMapping("/vieworders/en")
    public String vieworders_en(HttpSession httpSession) {
        httpSession.setAttribute("language", "en_US");     
        
        return "redirect:/menu/vieworders";
    }
    
     @GetMapping("/vieworders/zh-HK")
    public String vieworders_zh_HK(HttpSession httpSession) {
        httpSession.setAttribute("language", "zh_HK"); 
        
        return "redirect:/menu/vieworders";
    }
    
    @GetMapping("/order_information/en")
    public String order_information_en(HttpSession httpSession) {
        
        httpSession.setAttribute("language", "en_US"); 
     
        String path = "redirect:/menu/vieworders/order_information/order_id=" + httpSession.getAttribute("order_id");
        
        return path;
    }
    
     @GetMapping("/order_information/zh-HK")
    public String order_information_zh_HK(HttpSession httpSession) {
         
        httpSession.setAttribute("language", "zh_HK"); 
     
        String path = "redirect:/menu/vieworders/order_information/order_id=" + httpSession.getAttribute("order_id");
        
        return path;
    }
}
