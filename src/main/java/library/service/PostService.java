package library.service;


import library.dao.PostBookDao;
import library.entity.PostBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("postservice")
@Transactional
public class PostService {
    @Autowired
    PostBookDao postBookDao;

    public PostBook createPost(PostBook post) {
        return postBookDao.createPost(post);
    }
    public PostBook getPostById(Long postId) {
        return postBookDao.getPostById(postId);
    }
    public void updatePost(PostBook post) {
        postBookDao.updatePost(post);
    }
    public void deletePost(PostBook post) {
        postBookDao.deletePost(post);
    }
    public List<PostBook> getAllThePosts() {
        return postBookDao.getAllThePosts();
    }
    public PostBook getPostByText(String text) {
        return postBookDao.getPostByText(text);
    }
    public List<PostBook> getAllBooksByUser(String userDTO) {
        return postBookDao.getAllBooksByUser(userDTO);
    }
    public List<PostBook> getPostListByText(String text) {
        return postBookDao.getPostListByText(text);
    }
    public boolean isPostExist(String text) {
        return postBookDao.isPostExist(text);
    }
}
