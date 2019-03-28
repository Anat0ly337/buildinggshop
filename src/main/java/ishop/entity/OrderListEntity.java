package ishop.entity;

import javax.persistence.*;
import java.io.Serializable;
@Entity
@Table(name = "orderlist")
public class OrderListEntity implements Serializable{
    @Id
    @Column(name = "list_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "list_name")
    private String text;
    @Column(name = "list_amount")
    private int amount;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn(name = "good_id")
    private OrdersEntity ordersEntity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public OrdersEntity getGoodsEntity() {
        return ordersEntity;
    }

    public void setGoodsEntity(OrdersEntity ordersEntity) {
        this.ordersEntity = ordersEntity;
    }
}
