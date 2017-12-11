package library.controllers;


import library.entity.PostBook;
import library.entity.UserEntity;
import library.service.PostService;
import library.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
public class BookUploadController {
    private final Logger LOGGER = Logger.getLogger(getClass());

    @Autowired
    private MessageSource messageSource;
    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;

    private static final String BACKOFFICE = "/backoffice";
    private static final String USERSESSION = "USERSESSION";
    private static final String REDIRECT = "redirect:/s";
    private static final String NOTIFICATION = "notification";

    @RequestMapping(path = "/up", method = RequestMethod.POST)
    public String upLoadFile(Model model, HttpSession session, @RequestParam("book") MultipartFile file, @RequestParam("desc") String text, Locale locale) {

        String originalFilename = file.getOriginalFilename();
        if (!file.isEmpty()) {
            if (!file.getContentType().equals("application/pdf")) {
                session.setAttribute(NOTIFICATION, messageSource.getMessage("notsupported", null, locale));
                return REDIRECT;
            }else if (postService.isPostExist(originalFilename.substring(0,originalFilename.length()-4))) {
                session.setAttribute(NOTIFICATION, messageSource.getMessage("already.exist", null, locale));
                return REDIRECT;
            } else {
                session.setAttribute(NOTIFICATION, null);
            }

            PostBook postBook = new PostBook();
            String usermail = (String)session.getAttribute(USERSESSION);
            String usernickname = userService.getUserNicknameByEmail(usermail);
            UserEntity userentity = userService.getUserByLogin(usernickname);
            if (text.isEmpty()) {
               postBook.setText(originalFilename.substring(0, originalFilename.length()-4));
            } else {
                postBook.setText(text);
            }
            postBook.setUserID(userentity);
            Date date = new Date();
            postBook.setPostDate(new java.sql.Date(date.getTime()));
            try {
                postBook.setBook(file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
                LOGGER.info("cannot load book to DB");
            }
            postService.createPost(postBook);
            return REDIRECT;
        } else {
            model.addAttribute("notification", messageSource.getMessage("file.empty", null, locale));
            return REDIRECT;
        }
    }

    @RequestMapping(path = "/delete/{deletename}", method = RequestMethod.GET)
    public String delete(@PathVariable("deletename") Long id) {
        PostBook postBook = postService.getPostById(id);
        postService.deletePost(postBook);
        return REDIRECT;
    }

    @RequestMapping(path = "/s", method = RequestMethod.GET)
    public String displayUser(HttpSession session, Model model) {
        String usermail = (String)session.getAttribute(USERSESSION);
        String usernickname = userService.getUserNicknameByEmail(usermail);
        model.addAttribute("postList", postService.getAllBooksByUser(usernickname));
        return BACKOFFICE;
    }

}
