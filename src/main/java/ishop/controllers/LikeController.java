package ishop.controllers;

import ishop.entity.GoodsEntity;
import ishop.entity.LikesEntity;
import ishop.entity.UserEntity;
import ishop.service.GoodsService;
import ishop.service.LikeService;
import ishop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class LikeController {
    @Autowired
    GoodsService goodsService;
    @Autowired
    UserService userService;
    @Autowired
    LikeService likeService;

    @RequestMapping(value = "/like", method = RequestMethod.GET)
    public @ResponseBody String like(@RequestParam String name, HttpSession session, LikesEntity likeEntity) {
        String ipadress = (String) session.getAttribute("USERSESSION");
        UserEntity userEntity = userService.getUserByName(ipadress);
        System.out.println(name);
        String sname = name.substring(0,name.length()-4);
        System.out.println(sname);
        GoodsEntity goodsEntity = goodsService.getGoodByName(sname);
        likeEntity.setGoodsEntity(goodsEntity);
        likeEntity.setUserEntity(userEntity);
        likeService.createLike(likeEntity);



        return "redirect:/";

    }
}

