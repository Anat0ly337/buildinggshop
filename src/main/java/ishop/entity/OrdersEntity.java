package ishop.entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
public class OrdersEntity implements Serializable {
    @Id
    @Column(name = "order_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "order_telephone")
    private String telephone;
    @Column(name = "order_date")
    private Date commentdate;
    @Column(name = "order_complete")
    private int complete;
    @Column(name = "order_text")
    private String text;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "ordersEntity")
    private List<OrderListEntity> ordersEntityList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Date getCommentdate() {
        return commentdate;
    }

    public void setCommentdate(Date commentdate) {
        this.commentdate = commentdate;
    }

    public int getComplete() {
        return complete;
    }

    public void setComplete(int complete) {
        this.complete = complete;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<OrderListEntity> getOrdersEntityList() {
        return ordersEntityList;
    }

    public void setOrdersEntityList(List<OrderListEntity> ordersEntityList) {
        this.ordersEntityList = ordersEntityList;
    }
}
