package ouhk.groupproject.service;

import java.util.List;
import ouhk.groupproject.model.Attachment;

public interface AttachmentService {

    public List<Attachment> getAttachments();
    
    public Attachment getAttachment(long foodid, String name);

}
