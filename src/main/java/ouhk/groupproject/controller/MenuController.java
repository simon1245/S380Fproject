package ouhk.groupproject.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import ouhk.groupproject.model.Menu;
import ouhk.groupproject.service.MenuService;
import ouhk.groupproject.service.Menu_AttachmentService;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;
    /*
    @Autowired
    private Menu_AttachmentService menu_attachmentService;
    */
    @GetMapping({"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("menus", menuService.getMenus());
        return "menu";
    }

    /*
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("add", "MenuForm", new Form());
    }
     */
    public static class Form {

        private String foodname;
        private String description;
        private Integer price;
        private Boolean available;
        private List<MultipartFile> menu_attachments;

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

        public List<MultipartFile> getMenu_attachments() {
            return menu_attachments;
        }

        public void setMenu_attachments(List<MultipartFile> menu_attachments) {
            this.menu_attachments = menu_attachments;
        }
    }

    @PostMapping("/create")
    public String create(Form form, Principal principal) throws IOException {
        long food_Id = menuService.createMenu(form.getFoodname(), form.getDescription(), form.getPrice(), form.getAvailable(), form.getMenu_attachments());
        return "redirect:/menu/view/" + food_Id;
    }

    @GetMapping("/view/{food_Id}")
    public String view(@PathVariable("food_Id") long food_Id,
            ModelMap model) {
        Menu menu = menuService.getMenu(food_Id);
        if (menu == null) {
            return "redirect:/menu/list";
        }
        model.addAttribute("menu", menu);
        return "view";
    }
    /*
    @GetMapping("/{ticketId}/attachment/{attachment:.+}")
    public View download(@PathVariable("ticketId") long ticketId,
            @PathVariable("attachment") String name) {

        Attachment attachment = attachmentService.getAttachment(ticketId, name);
        if (attachment != null) {
            return new DownloadingView(attachment.getName(),
                    attachment.getMimeContentType(), attachment.getContents());
        }
        return new RedirectView("/ticket/list", true);
    }

    @GetMapping("/{ticketId}/delete/{attachment:.+}")
    public String deleteAttachment(@PathVariable("ticketId") long ticketId,
            @PathVariable("attachment") String name) throws AttachmentNotFound {
        ticketService.deleteAttachment(ticketId, name);
        return "redirect:/ticket/edit/" + ticketId;
    }

    @GetMapping("/edit/{ticketId}")
    public ModelAndView showEdit(@PathVariable("ticketId") long ticketId,
            Principal principal, HttpServletRequest request) {
        Ticket ticket = ticketService.getTicket(ticketId);
        if (ticket == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(ticket.getCustomerName()))) {
            return new ModelAndView(new RedirectView("/ticket/list", true));
        }

        ModelAndView modelAndView = new ModelAndView("edit");
        modelAndView.addObject("ticket", ticket);

        Form ticketForm = new Form();
        ticketForm.setSubject(ticket.getSubject());
        ticketForm.setBody(ticket.getBody());
        modelAndView.addObject("ticketForm", ticketForm);

        return modelAndView;
    }

    @PostMapping("/edit/{ticketId}")
    public String edit(@PathVariable("ticketId") long ticketId, Form form,
            Principal principal, HttpServletRequest request)
            throws IOException, TicketNotFound {
        Ticket ticket = ticketService.getTicket(ticketId);
        if (ticket == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(ticket.getCustomerName()))) {
            return "redirect:/ticket/list";
        }

        ticketService.updateTicket(ticketId, form.getSubject(),
                form.getBody(), form.getAttachments());
        return "redirect:/ticket/view/" + ticketId;
    }

    @GetMapping("/delete/{ticketId}")
    public String deleteTicket(@PathVariable("ticketId") long ticketId)
            throws TicketNotFound {
        ticketService.delete(ticketId);
        return "redirect:/ticket/list";
    }
     */
}
