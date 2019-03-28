package ishop.controllers;

import ishop.entity.GoodsEntity;
import ishop.service.GoodsService;
import ishop.service.UserService;
import ishop.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

@Controller
public class AdminController {
    ModelAndView modelAndView;
    @Autowired
    UserService userService;
    @Autowired
    GoodsService goodsService;

    @RequestMapping(path = "/adm", method = RequestMethod.GET)
    public String adminController(HttpSession session, Model model) {

        return "/admin";
    }


    @RequestMapping(path = "/backoffice", method = RequestMethod.GET)
    public String auth(HttpSession session) {

        return "/login";
    }

    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public String login(HttpSession session, @RequestParam("log") String log, @RequestParam("pass") String pass, Model model) {
        if (!(log.equals("EGORKOSAREFF") || pass.equals("23456"))) {
            model.addAttribute("FORBIDDEN", "ДОСТУП ЗАПРЕЩЕН");
            return "/login";
        }


        model.addAttribute("lst", goodsService.getAllGoodsEntities());

        model.addAttribute("ip", Constants.calendars);
        session.setAttribute("ADMINSESSION", log);


        return "/admin";
    }

    @RequestMapping(path = "/uploadfile", method = RequestMethod.POST)
    public String uploadfile(Model model, HttpSession session, @RequestParam("imag") MultipartFile multipartFile, @RequestParam("desc") String desc, @RequestParam("price") String price) {
        GoodsEntity goodsEntity = new GoodsEntity();
        if (multipartFile.getContentType().equals("image/jpeg")) {
            try {
                goodsEntity.setPhoto(multipartFile.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }

            goodsEntity.setDescription(desc);
            goodsEntity.setPrice(Integer.parseInt(price));
            goodsService.createGood(goodsEntity);
        }
        return "/admin";

    }

}
