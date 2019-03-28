package ishop.controllers;


import ishop.entity.GoodsEntity;
import ishop.entity.UserEntity;
import ishop.service.CommentsService;
import ishop.service.GoodsService;
import ishop.service.UserService;
import ishop.util.Constants;
import ishop.util.ScheduledUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;


@Controller
@EnableScheduling
public class StartPageController {
    @Autowired
    GoodsService goodsService;
    @Autowired
    UserService userService;
    @Autowired
    CommentsService commentsService;


    private ModelAndView modelAndView;


    private static void invalidateGoodSession(HttpSession session) {
        session.setAttribute("GOODSESSION", null);


    }


    private boolean sortedPriceByASC = true;
    private boolean sortedLikesByASC = true;

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public ModelAndView start(UserEntity userEntity, HttpSession session, HttpServletRequest httpServletRequest) {
        HashMap<String, Integer> arrayList = new HashMap<>();
        System.out.println(session.getId());
        session.setAttribute("USERSESSION", httpServletRequest.getRemoteAddr());
        session.setAttribute("BUSKETSESSION", arrayList);
        String ipadress = (String) session.getAttribute("USERSESSION");
        System.out.println("ORDER SIZE" + "" + arrayList.size());







        session.setAttribute("ipCount", Constants.calendars);



        if (!userService.isLoginExists(ipadress)) {
            userEntity.setNickname(ipadress);
            userEntity.setUserpassword(null);
            userEntity.setIsAdmin(0);
            userService.createUser(userEntity);


        }
        invalidateGoodSession(session);

        System.out.println(httpServletRequest.getRemoteAddr());
        modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        List<GoodsEntity> goodsEntityList = goodsService.getGoodsEntitesBySortByPriceASC();
        modelAndView.addObject("user", "user");
        modelAndView.addObject("list", goodsEntityList);
        return modelAndView;
    }

    @RequestMapping(path = "/search", method = RequestMethod.GET)
    public String search(@RequestParam("amount") String one, @RequestParam("amount_1") String two, HttpSession session, Model modelAndView) {

        invalidateGoodSession(session);
        if (!(one.equals(null) || two.equals(null)) || (one.equals(null) && two.equals(null))) {
            List<GoodsEntity> goodsEntityList = goodsService.getGoodsByPrice(one, two);
            modelAndView.addAttribute("list", goodsEntityList);


        }
        return "/index";
    }


    @RequestMapping(path = "/sortbyprice", method = RequestMethod.GET)
    public ModelAndView sortByPrice(@RequestParam("sel") String sel, HttpSession session) {
        invalidateGoodSession(session);
        modelAndView = new ModelAndView();
        if (sel.equals("PriceUp")) {
            System.out.println("PRICEUP");

        } else {
            System.out.println("ASDDSADASDASDDASDSADASDSA");
        }


        if (sortedPriceByASC == true) {
            modelAndView.addObject("list", goodsService.getGoodsEntitesBySortByPriceDESC());
            sortedPriceByASC = false;

        } else {
            modelAndView.addObject("list", goodsService.getGoodsEntitesBySortByPriceASC());
            sortedPriceByASC = true;

        }
        modelAndView.setViewName("index");

        return modelAndView;
    }

    @RequestMapping(path = "/sortbylikes", method = RequestMethod.GET)
    public ModelAndView sortByLikes(HttpSession session) {
        invalidateGoodSession(session);
        if (sortedLikesByASC == true) {
            modelAndView.addObject("list", goodsService.getGoodsEntitesBySortByLikesASC());
            sortedLikesByASC = false;

        } else {
            modelAndView.addObject("list", goodsService.getGoodsEntitesBySortByLikesDESC());
            sortedLikesByASC = true;

        }
        modelAndView.setViewName("index");

        return modelAndView;

    }


    @RequestMapping(value = "/check", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8; application/json"})
    public @ResponseBody
    String check(@RequestParam String name, @RequestParam String name2) throws IOException {
        List<GoodsEntity> goodsEntityList = goodsService.getGoodsByPrice(name, name2);
        Integer count = goodsEntityList.size();
        String cc = count.toString();


        return "find" + cc + "elements";
    }


}



