package ouhk.groupproject.service;

import javax.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import ouhk.groupproject.dao.Menu_AttachmentRepository;
import ouhk.groupproject.model.Menu_Attachment;


public class Menu_AttachmentServiceImpl implements Menu_AttachmentService {
    @Resource
    private Menu_AttachmentRepository menu_attachmentRepo;

    @Override
    @Transactional
    public Menu_Attachment getAttachment(long foodid, String name) {
            return menu_attachmentRepo.findByfoodidAndName(foodid, name);
    }
}
