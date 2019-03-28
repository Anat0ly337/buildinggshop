package ishop.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "likes")
public class LikesEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "like_id")
    private int like;
    @JoinColumn(name = "user_id")
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    private UserEntity userEntity;
    @JoinColumn(name = "good_id")
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    private GoodsEntity goodsEntity;

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public GoodsEntity getGoodsEntity() {
        return goodsEntity;
    }

    public void setGoodsEntity(GoodsEntity goodsEntity) {
        this.goodsEntity = goodsEntity;
    }
}
