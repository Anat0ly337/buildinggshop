package ishop.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "goods")
public class GoodsEntity implements Serializable {
    @Id
    @Column(name = "good_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "good_name")

    private String name;
    @Column(name = "good_discription")
    private String description;
    @Column(name = "good_photo")
    private byte[] photo;
    @Column(name = "good_views")
    private int views;
    @Column(name = "good_price")
    private int price;
    @Column(name = "good_likesamount")
    private int likesamount;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goodsEntity")
    private List<CommentsEntity> comments;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goodsEntity")
    private List<LikesEntity> likes;

    public List<LikesEntity> getLikes() {
        return likes;
    }

    public int getLikesamount() {
        return likesamount;
    }

    public void setLikesamount(int likesamount) {
        this.likesamount = likesamount;
    }

    public List<CommentsEntity> getComments() {
        return comments;
    }

    public void setComments(List<CommentsEntity> comments) {
        this.comments = comments;
    }

    public void setLikes(List<LikesEntity> likes) {
        this.likes = likes;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    @Override
    public String toString() {
        return "GoodsEntity{" +
                "name='" + name + '\'' +
                '}';
    }
}
