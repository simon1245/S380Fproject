package ouhk.groupproject.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.groupproject.model.Attachment;

public interface AttachmentRepository extends JpaRepository<Attachment, Long> {
    public Attachment findByfoodidAndName(long foodid, String name);
}
