package ouhk.groupproject.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.groupproject.exception.AttachmentNotFound;
import ouhk.groupproject.exception.MenuNotFound;
import ouhk.groupproject.model.Attachment;
import ouhk.groupproject.model.Menu;
import ouhk.groupproject.model.Base64image;
import ouhk.groupproject.model.Comment;
import ouhk.groupproject.service.MenuService;
import ouhk.groupproject.service.AttachmentService;
import ouhk.groupproject.service.CommentService;
import ouhk.groupproject.view.DownloadingView;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private AttachmentService attachmentService;

    @GetMapping("")
    public String list(ModelMap model) {
        List<Attachment> attachments = attachmentService.getAttachments();
        List<Base64image> images = new ArrayList<Base64image>();
        for (Attachment attachment : attachments) {

            String decoded = Base64.getEncoder().encodeToString(attachment.getContents());

            Base64image image = new Base64image();
            image.setFood_id(attachment.getFood_id());
            image.setBase64img(decoded);
            images.add(image);
        }
        model.addAttribute("menus", menuService.getMenus());
        model.addAttribute("images", images);
        return "menu";
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("create", "MenuForm", new Form());
    }

    public static class Form {

        private String foodname;
        private String description;
        private Integer price;
        private Boolean available;
        private List<MultipartFile> attachments;

        public java.lang.String getFoodname() {
            return foodname;
        }

        public void setFoodname(java.lang.String foodname) {
            this.foodname = foodname;
        }

        public java.lang.String getDescription() {
            return description;
        }

        public void setDescription(java.lang.String description) {
            this.description = description;
        }

        public Integer getPrice() {
            return price;
        }

        public void setPrice(Integer price) {
            this.price = price;
        }

        public java.lang.Boolean getAvailable() {
            return available;
        }

        public void setAvailable(java.lang.Boolean available) {
            this.available = available;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
    }

    @PostMapping("/create")
    public String create(Form form, Principal principal) throws IOException {
        long food_Id = menuService.createMenu(form.getFoodname(), form.getDescription(), form.getPrice(), form.getAvailable(), form.getAttachments());
        return "redirect:/menu/view/" + food_Id;
    }

    @GetMapping("/view/{food_Id}")
    public String view(@PathVariable("food_Id") long food_Id,
            ModelMap model) {
        Menu menu = menuService.getMenu(food_Id);
        if (menu == null) {
            return "redirect:/menu";
        }
        
        List<Attachment> attachments = attachmentService.getAttachments();
        List<Base64image> images = new ArrayList<Base64image>();
        for (Attachment attachment : attachments) {
            String decoded = Base64.getEncoder().encodeToString(attachment.getContents());
            Base64image image = new Base64image();
            image.setFood_id(attachment.getFood_id());
            image.setBase64img(decoded);
            images.add(image);
        }
        model.addAttribute("images", images);
        
        List<Comment> comments = commentService.getComment(food_Id);
        model.addAttribute("comments", comments);
        model.addAttribute("menu", menu);
        return "view";
    }

    @GetMapping("/view/{food_Id}/attachment/{attachment:.+}")
    public View download(@PathVariable("food_Id") long food_Id,
            @PathVariable("attachment") String name) {

        Attachment attachment = attachmentService.getAttachment(food_Id, name);
        if (attachment != null) {
            return new DownloadingView(attachment.getName(),
                    attachment.getMimeContentType(), attachment.getContents());
        }
        return new RedirectView("/menu/", true);
    }

    @GetMapping("/delete/{food_Id}/{attachment:.+}")
    public String deleteAttachment(@PathVariable("food_Id") long food_Id,
            @PathVariable("attachment") String name) throws AttachmentNotFound {
        menuService.deleteAttachment(food_Id, name);
        return "redirect:/menu/edit/" + food_Id;
    }

    @GetMapping("/edit/{food_Id}")
    public ModelAndView showEdit(@PathVariable("food_Id") long food_Id,
            Principal principal, HttpServletRequest request) {
        Menu menu = menuService.getMenu(food_Id);
        if (menu == null
                || (!request.isUserInRole("ROLE_ADMIN"))) {
            return new ModelAndView(new RedirectView("/menu", true));
        }

        ModelAndView modelAndView = new ModelAndView("edit");
        modelAndView.addObject("menu", menu);

        Form menuForm = new Form();
        menuForm.setFoodname(menu.getName());
        menuForm.setDescription(menu.getDescription());
        menuForm.setPrice(menu.getPrice());
        menuForm.setAvailable(menu.getAvailable());

        modelAndView.addObject("MenuForm", menuForm);

        return modelAndView;
    }

    @PostMapping("/edit/{food_Id}")
    public String edit(@PathVariable("food_Id") long food_Id, Form form,
            Principal principal, HttpServletRequest request)
            throws IOException, MenuNotFound {
        Menu menu = menuService.getMenu(food_Id);
        if (menu == null
                || (!request.isUserInRole("ROLE_ADMIN"))) {
            return "redirect:/menu";
        }

        menuService.updateMenu(food_Id, form.getFoodname(), form.getDescription(), form.getPrice(), form.getAvailable(), form.getAttachments());
        return "redirect:/menu/view/" + food_Id;
    }

    @GetMapping("/delete/{food_Id}")
    public String deleteMenu(@PathVariable("food_Id") long food_Id)
            throws MenuNotFound {
        menuService.delete(food_Id);
        return "redirect:/menu";
    }

    @GetMapping("/addtoCart")
    public String addtoCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int food_Id;

        try {
            food_Id = Integer.parseInt(request.getParameter("food_Id"));
        } catch (Exception e) {
            response.sendRedirect("menu");
            return "redirect:/menu/";
        }

        HttpSession session = request.getSession();
        if (session.getAttribute("carts") == null) {
            session.setAttribute("carts", new Hashtable<>());
        }

        @SuppressWarnings("unchecked")
        Map<Integer, Integer> carts
                = (Map<Integer, Integer>) session.getAttribute("carts");
        if (!carts.containsKey(food_Id)) {
            carts.put(food_Id, 0);
        }
        carts.put(food_Id, carts.get(food_Id) + 1);

        return "redirect:/menu/viewcart/";
    }

    @GetMapping("/emptycart")
    private String emptycart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("carts");
        return "redirect:/menu/";
    }

    @GetMapping("/viewcart")
    public String viewcart(ModelMap model) {
        model.addAttribute("menus", menuService.getMenus());
        return ("viewcart");
    }

    public static class CommentForm {

        private String detail;

        public String getDetail() {
            return detail;
        }

        public void setDetail(String detail) {
            this.detail = detail;
        }

    }

    @GetMapping("/make_comment/{food_Id}")
    public ModelAndView make_comment(@PathVariable("food_Id") long food_Id, ModelMap model) {
        model.addAttribute("menu", menuService.getMenu(food_Id));
        return new ModelAndView("make_comment", "CommentForm", new CommentForm());
    }

    @PostMapping("/make_comment/{food_Id}")
    public String make_comment(CommentForm commentForm, Principal principal, @PathVariable("food_Id") long food_Id) throws IOException {
        long Commentid = commentService.createComment(principal.getName(),
                commentForm.getDetail(), food_Id);
        return "redirect:/menu/view/" + food_Id;
    }

}
