package library.controllers;

import library.service.PostService;
import library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;


@Controller
public class LibraryController {

    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;

    private static final String LIBRARY = "/onlinelibrary";
    private static final String LOGIN = "/login";
    private static final String USERSESSION = "USERSESSION";

    @RequestMapping(path = "/search", method = RequestMethod.POST)
    public String searchBook(@RequestParam("search") String search, HttpSession session, Model model) {
        String useremail = (String) session.getAttribute(USERSESSION);
        String nickname = userService.getUserNicknameByEmail(useremail);
        model.addAttribute("user", nickname);
        if (search.isEmpty()) {
            model.addAttribute("allbooks", postService.getAllThePosts());
        } else {
            model.addAttribute("allbooks", postService.getPostListByText(search));
        }
        return LIBRARY;
    }


    @RequestMapping(path = "/showbooks", method = RequestMethod.GET)
    public String showAllBooks(HttpSession session, Model model) {
        String usermail = (String) session.getAttribute(USERSESSION);
        if(usermail == null){
            return LOGIN;
        }
        String nickname = userService.getUserNicknameByEmail(usermail);
        model.addAttribute("name", nickname);
        model.addAttribute("allbooks", postService.getAllThePosts());
        return LIBRARY;
    }
}
