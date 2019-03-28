package ishop.controllers;

import ishop.entity.GoodsEntity;
import ishop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

@Controller
public class BusketController {
    @Autowired
    GoodsService goodsService;
    private ArrayList<String> arrayList = new ArrayList<>();
    private Integer integer = 2;


    @RequestMapping(value = "/busketaction", method = RequestMethod.GET)
    public String busketAction(HttpSession session, Model model) {
        HashMap<GoodsEntity,Integer> ordermap = new HashMap<>();
        HashMap<String, Integer> mapa = (HashMap<String, Integer>) session.getAttribute("BUSKETSESSION");
        for (Map.Entry<String, Integer> entry : mapa.entrySet()) {
            GoodsEntity goodsEntity = goodsService.getGoodByName(entry.getKey());
            ordermap.put(goodsEntity, entry.getValue());
        }


        model.addAttribute("busk", ordermap);
        return "/busket";
    }

    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String orderAction(@RequestParam("number") String number, HttpSession session, Model model) {
        Map<String, ArrayList<GoodsEntity>> listMap = new HashMap<>();

        System.out.println("Order done");
        return "/busket";
    }


    @RequestMapping(value = "/put", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8; application/json"})
    public @ResponseBody
    String putToBusket(@RequestParam String good, HttpSession session) {


        GoodsEntity goodsEntity = goodsService.getGoodByName(good);
        HashMap<String, Integer> ordermap = (HashMap<String, Integer>) session.getAttribute("BUSKETSESSION");


            ordermap.put(good, 1);




        session.setAttribute("BUSKETSESSION", ordermap);


        System.out.println("ORDERMAP SIZE" + " " + ordermap.size());

        for (Map.Entry<String, Integer> entry : ordermap.entrySet()) {
            System.out.println(entry.getKey() + "|" + entry.getValue());

        }


        return "";

    }

    @RequestMapping(value = "/plus", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8; application/json"})
    public @ResponseBody
    String plus(@RequestParam String good, @RequestParam String amnt, HttpSession session) {
        Integer c = Integer.parseInt(amnt);
        Integer cc = c + 1;

        GoodsEntity goodsEntity = goodsService.getGoodByName(good);

        Map<String, Integer> mapa = (Map<String, Integer>) session.getAttribute("BUSKETSESSION");

        if (true){
            mapa.replace(good, mapa.get(good), mapa.get(good)+1);

        }



        System.out.println("MAIN TESt");
        System.out.println(mapa.size());
        for (Map.Entry<String, Integer> entry : mapa.entrySet()) {
            System.out.println(true);
            System.out.println(entry.getKey() + "/" + entry.getValue());
        }


        return cc.toString();

    }

}
