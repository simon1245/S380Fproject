package ouhk.groupproject.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.Menu_Attachment;

public interface Menu_AttachmentRepository extends JpaRepository<Menu_Attachment, Long> {
    public Menu_Attachment findByfoodidAndName(long foodid, String name);
}
