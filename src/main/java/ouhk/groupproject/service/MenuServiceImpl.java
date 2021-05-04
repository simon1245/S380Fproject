package ouhk.groupproject.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.apache.derby.client.am.Decimal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ouhk.groupproject.dao.MenuRepository;
import ouhk.groupproject.dao.Menu_AttachmentRepository;
import ouhk.groupproject.exception.Menu_AttachmentNotFound;
import ouhk.groupproject.exception.MenuNotFound;
import ouhk.groupproject.model.Menu;
import ouhk.groupproject.model.Menu_Attachment;

@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuRepository menuRepo;

    @Resource
    private Menu_AttachmentRepository menuattachmentRepo;

    @Override
    @Transactional
    public List<Menu> getMenus() {
        return menuRepo.findAll();
    }

    @Override
    @Transactional
    public Menu getMenu(long food_Id) {
        return menuRepo.findById(food_Id).orElse(null);
    }

    @Override
    @Transactional(rollbackFor = MenuNotFound.class)
    public void delete(long food_id) throws MenuNotFound {
        Menu deletedMenu = menuRepo.findById(food_id).orElse(null);
        if (deletedMenu == null) {
            throw new MenuNotFound();
        }
        menuRepo.delete(deletedMenu);
    }

    @Override
    @Transactional(rollbackFor = Menu_AttachmentNotFound.class)
    public void deleteAttachment(long ticketId, String name) throws Menu_AttachmentNotFound {
        Menu menu = menuRepo.findById(ticketId).orElse(null);
        for (Menu_Attachment attachment : menu.getMenu_attachments()) {
            if (attachment.getName().equals(name)) {
                menu.deleteAttachment(attachment);
                menuRepo.save(menu);
                return;
            }
        }
        throw new Menu_AttachmentNotFound();
    }

    @Override
    @Transactional
    public long createMenu(String foodname, String description, Integer price, Boolean available, List<MultipartFile> menu_attachments) throws IOException {
        Menu menu = new Menu();
        menu.setName(foodname);
        menu.setDescription(description);
        menu.setPrice(price);
        menu.setAvailable(available);

        for (MultipartFile filePart : menu_attachments) {
            Menu_Attachment menu_attachment = new Menu_Attachment();
            menu_attachment.setName(filePart.getOriginalFilename());
            menu_attachment.setMimeContentType(filePart.getContentType());
            menu_attachment.setContents(filePart.getBytes());
            menu_attachment.setMenu(menu);
            if (menu_attachment.getName() != null && menu_attachment.getName().length() > 0
                    && menu_attachment.getContents() != null
                    && menu_attachment.getContents().length > 0) {
                menu.getMenu_attachments().add(menu_attachment);
            }
        }
        Menu savedMenu = menuRepo.save(menu);
        return savedMenu.getFood_id();
    }

    @Override
    @Transactional(rollbackFor = MenuNotFound.class)
    public void updateMenu(long food_id,String foodname, String description, Integer price, Boolean available, List<MultipartFile> menu_attachments)
            throws IOException, MenuNotFound {
        Menu updatedMenu = menuRepo.findById(food_id).orElse(null);
        if (updatedMenu == null) {
            throw new MenuNotFound();
        }

        updatedMenu.setName(foodname);
        updatedMenu.setDescription(description);
        updatedMenu.setPrice(price);
        updatedMenu.setAvailable(available);


        for (MultipartFile filePart : menu_attachments) {
            Menu_Attachment attachment = new Menu_Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setMenu(updatedMenu);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedMenu.getMenu_attachments().add(attachment);
            }
        }
        menuRepo.save(updatedMenu);
    }
}
