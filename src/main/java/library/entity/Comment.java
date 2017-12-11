package library.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collections;
import java.util.Date;

@Entity
@Table(name = "comment")
public class Comment implements Serializable {
    @Id
    @Column(name = "comment_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.LAZY)
    @JoinColumn(name ="post_id")
    private PostBook postID;
    @ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.LAZY)
    @JoinColumn(name ="user_id" )
    private UserEntity userID;
    @Column(name = "text")
    private String text;
    @Column(name = "comment_date")
    private Date commentDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public PostBook getPostID() {
        return postID;
    }

    public void setPostID(PostBook postID) {
        this.postID = postID;
    }

    public UserEntity getUserID() {
        return userID;
    }

    public void setUserID(UserEntity userID) {
        this.userID = userID;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

}
