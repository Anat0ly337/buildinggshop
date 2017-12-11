package library.controllers;

import library.dto.UserDTO;
import library.service.UserService;
import library.validators.RegValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;


@Controller
public class RegistrationController {

    @Autowired
    UserService userService;
    @Autowired
    RegValidator regValidator;
    @Autowired
    MessageSource messageSource;

    private static final String INDEX = "/index";
    private static final String LOGIN = "/login";
    private static final String USERCOOKIE = "usercookie";

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public ModelAndView start() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("userDTO", new UserDTO());
        modelAndView.setViewName(INDEX);
        return modelAndView;
    }

    @RequestMapping(path = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userDTO") UserDTO userDTO, BindingResult bindingResult, Model model, Locale locale, HttpServletResponse response) {


            regValidator.validate(userDTO, bindingResult);
        if (!regValidator.isValidEmailAddress(userDTO.getEmail())) {
            model.addAttribute("nameattribute", messageSource.getMessage("not.email", null, locale));
            return INDEX;
        }
        if (bindingResult.hasErrors()) {
            return INDEX;
        }
        if (userService.isLoginExists(userDTO.getEmail())) {
            model.addAttribute("nameattribute", messageSource.getMessage("already.exist", null, locale));
            return INDEX;
        } else {
            Cookie cookie = new Cookie(USERCOOKIE, userDTO.getEmail());
            response.addCookie(cookie);
            userService.createUser(userDTO);
            return LOGIN;
        }
    }


}
