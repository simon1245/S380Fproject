package ouhk.groupproject.service;

import java.io.IOException;
import java.util.List;
import org.apache.derby.client.am.Decimal;
import org.springframework.web.multipart.MultipartFile;
import ouhk.groupproject.exception.AttachmentNotFound;
import ouhk.groupproject.exception.MenuNotFound;
import ouhk.groupproject.model.Menu;



public interface MenuService {
    public long createMenu(String foodname, String description, Integer price, Boolean available, List<MultipartFile> attachments) throws IOException;

    public List<Menu> getMenus();

    public Menu getMenu(long id);
    
    public void delete(long food_id) throws MenuNotFound;

    public void updateMenu(long food_id, String foodname, String description, Integer price, Boolean available, List<MultipartFile> menu_attachments)
            throws IOException, MenuNotFound;

    public void deleteAttachment(long ticketId, String name)
            throws AttachmentNotFound;
}
