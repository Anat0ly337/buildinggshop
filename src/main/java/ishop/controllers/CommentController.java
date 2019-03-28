package ishop.controllers;

import ishop.entity.CommentsEntity;
import ishop.entity.GoodsEntity;
import ishop.service.CommentsService;
import ishop.service.GoodsService;
import ishop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Controller
public class CommentController {
    @Autowired
    UserService userService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    CommentsService commentService;

    private static final String USERSESSION = "USERSESSION";
    private static final String GOODSESSION = "GOODSESSION";
    private String commentGoodStatus;


    @RequestMapping(path = "/showcomment", method = RequestMethod.GET)
    public String showComments(@RequestParam("commentname") String good, Model model, HttpSession session) {
        model.addAttribute("commentlist", commentService.getCommentListByName(good));
        List<GoodsEntity> goodsEntityList = goodsService.getAllGoodsEntities();
        model.addAttribute("list", goodsEntityList);
        commentGoodStatus = good;
        session.setAttribute(GOODSESSION, commentGoodStatus);

        return "/index";
    }

    @RequestMapping(path = "/comment", method = RequestMethod.POST)
    public String postComment(@RequestParam("commentgoodname") String commentgoodname, @RequestParam("commenttext") String commenttext, HttpSession session, Model model) {
        GoodsEntity good = goodsService.getGoodByName(commentgoodname);
        CommentsEntity commentnew = new CommentsEntity();
        commentnew.setText(commenttext);
        commentnew.setGoodsEntity(good);
        commentnew.setUserEntity(userService.getUserByName((String)session.getAttribute(USERSESSION)));
        Date date = new Date();
        commentnew.setCommentdate(new java.sql.Date(date.getTime()));
        commentService.createComment(commentnew);
        model.addAttribute("commentlist", commentService.getCommentListByName(commentGoodStatus));
        model.addAttribute("list", goodsService.getAllGoodsEntities());


        return "/index";
    }
}
