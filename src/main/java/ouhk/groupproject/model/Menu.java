package ouhk.groupproject.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.apache.derby.client.am.Decimal;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


@Entity
@Table(name = "Foods")
public class Menu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int food_id;

    @Column(name = "name")
    private String name;
    private String description;
    private Integer price;
    private Boolean available;
    
    @OneToMany(mappedBy = "menu", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<Menu_Attachment> Menu_attachments = new ArrayList<>();

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public List<Menu_Attachment> getMenu_attachments() {
        return Menu_attachments;
    }

    public void setMenu_attachments(List<Menu_Attachment> Menu_attachments) {
        this.Menu_attachments = Menu_attachments;
    }

    public void deleteAttachment(Menu_Attachment attachment) {
        attachment.setMenu(null);
        this.Menu_attachments.remove(attachment);
    }
    
    
    
}
