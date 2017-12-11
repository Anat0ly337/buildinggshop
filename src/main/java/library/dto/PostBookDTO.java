package library.dto;

import library.entity.UserEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class PostBookDTO {
    private Long id;
    private Date date;
    private UserEntity userEntity;
    private MultipartFile book;
    private String comment;

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public MultipartFile getBook() {
        return book;
    }

    public void setBook(MultipartFile book) {
        this.book = book;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
