package library.controllers;

import library.entity.Comment;
import library.entity.PostBook;
import library.entity.UserEntity;
import library.service.CommentService;
import library.service.PostService;
import library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Component
@RequestMapping("/show")
public class CommentController {
    @Autowired
    private MessageSource messageSource;
    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    private static final String COMMENT = "/comment";
    private static final String USERSESSION = "USERSESSION";
    private static final String COMMENTID = "commentid";

    @RequestMapping(path = "/comment", method = RequestMethod.POST)
    public String postBookComment(HttpSession session, Model model, @RequestParam("comment") String text, @RequestParam("commentid") String book, Locale locale) {
        String usermail = (String) session.getAttribute(USERSESSION);
        if (text.isEmpty()) {
            model.addAttribute("notnullcomment", messageSource.getMessage("null.comm", null, locale));
        } else {
            Comment comment = new Comment();
            String nickname = userService.getUserNicknameByEmail(usermail);
            UserEntity userentity = userService.getUserByLogin(nickname);
            PostBook postid = postService.getPostByText(book);
            Date date = new Date();
            comment.setText(text);
            comment.setUserID(userentity);
            comment.setCommentDate(new java.sql.Date(date.getTime()));
            comment.setPostID(postid);
            commentService.createComment(comment);
            String commentid = (String) session.getAttribute(COMMENTID);
            model.addAttribute("commentt", commentService.getCommentListByBook(commentid));


        }
        return COMMENT;
    }

    @RequestMapping(path = "/showcomment", method = RequestMethod.GET)
    public String showComments(@RequestParam("book") String book, HttpSession session, Model model) {
        String user = (String) session.getAttribute(USERSESSION);
        session.setAttribute(COMMENTID, book);
        List<Comment> commentList = commentService.getCommentListByBook(book);
        model.addAttribute("commentt", commentList);
        return COMMENT;
    }

    @RequestMapping(path = "/deletecomment/{commentid}", method = RequestMethod.GET)
    public String deleteComment(@PathVariable("commentid") Long commentid) {
        Comment comment = commentService.getCommentById(commentid);
        commentService.deleteComment(comment);
        return "redirect:/show/showcommentt";
    }
    @RequestMapping(path = "/showcommentt", method = RequestMethod.GET)
    public String showCommentss(Model model, HttpSession session){
        String book = (String) session.getAttribute(COMMENTID);
        List<Comment> commentList = commentService.getCommentListByBook(book);
        model.addAttribute("commentt", commentList);
        return COMMENT;
    }


}


