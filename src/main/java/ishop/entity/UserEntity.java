package ishop.entity;


import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "users")
public class UserEntity implements Serializable {
    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userid;
    @Column(name = "nickname", insertable = true, updatable = true)
    private String nickname;
    @Column(name = "password", length = 255)
    private String userpassword;
    @Column(name = "isadmin")
    private int isAdmin;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userEntity")
    private List<CommentsEntity> comments;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userEntity")
    private List<LikesEntity> likes;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public List<CommentsEntity> getComments() {
        return comments;
    }

    public void setComments(List<CommentsEntity> comments) {
        this.comments = comments;
    }

    public List<LikesEntity> getLikes() {
        return likes;
    }

    public void setLikes(List<LikesEntity> likes) {
        this.likes = likes;
    }
}
