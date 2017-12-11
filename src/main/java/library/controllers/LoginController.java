package library.controllers;

import library.dto.PostBookDTO;
import library.dto.UserDTO;
import library.service.CommentService;
import library.service.PostService;
import library.service.UserService;
import library.validators.LoginValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Locale;

@Controller
public class LoginController {

    @Autowired
    UserService userService;
    @Autowired
    PostService postService;
    @Autowired
    CommentService commentService;
    @Autowired
    LoginValidator loginValidator;
    @Autowired
    MessageSource messageSource;

    private static final String LOGIN = "/login";
    private static final String USERSESSION = "USERSESSION";
    private static final String BACKOFFICE = "/backoffice";
    private static final String NICKNAME = "user";
    private static final String POSTLIST = "postList";

    @RequestMapping(path = "/entry", method = RequestMethod.POST)
    public ModelAndView entry(@Valid @ModelAttribute("userDTO") UserDTO userDTO, BindingResult bindingResult, HttpSession session, Locale locale) {
        ModelAndView modelAndView = new ModelAndView();
        loginValidator.validate(userDTO, bindingResult);
        if (!loginValidator.isValidEmailAddress(userDTO.getEmail())) {

            modelAndView.addObject("nameattribute", messageSource.getMessage("not.email", null, locale));

            modelAndView.setViewName(LOGIN);

        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName(LOGIN);
        }

        if (userService.isEmailExists(userDTO.getEmail()) && userService.isPasswordExist(userDTO)) {
            if (session.getAttribute(USERSESSION) == null) {
                session.setAttribute(USERSESSION, userDTO.getEmail());
                String usernickname = userService.getUserNicknameByEmail(userDTO.getEmail());

                session.setAttribute(NICKNAME, usernickname);
                modelAndView.addObject(POSTLIST, postService.getAllBooksByUser(usernickname));
            }
            modelAndView.addObject("postNEW", new PostBookDTO());
            modelAndView.setViewName(BACKOFFICE);
        } else {
            modelAndView.addObject("notexist", messageSource.getMessage("not.exist", null, locale));
            modelAndView.setViewName(LOGIN);
        }
        return modelAndView;
    }
    @RequestMapping(path = "/backoff", method = RequestMethod.GET)
    public String backoffice(HttpSession session, Model model){
        String nickname = (String)session.getAttribute(NICKNAME);
        model.addAttribute(POSTLIST, postService.getAllBooksByUser(nickname));
        return BACKOFFICE;
    }

    @RequestMapping(path = "/entryentry", method = RequestMethod.GET)
    public String entry(HttpSession session, Model model) {
        model.addAttribute("userDTO", new UserDTO());
        session.invalidate();
        return LOGIN;
    }
}
