package ouhk.groupproject.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.groupproject.dao.AttachmentRepository;
import ouhk.groupproject.model.Attachment;

@Service
public class AttachmentServiceImpl implements AttachmentService {

    @Resource
    private AttachmentRepository attachmentRepo;

    @Override
    public List<Attachment> getAttachments() {
        return attachmentRepo.findAll();
    }

    @Override
    @Transactional
    public Attachment getAttachment(long foodid, String name) {
        return attachmentRepo.findByfoodidAndName(foodid, name);
    }
}
