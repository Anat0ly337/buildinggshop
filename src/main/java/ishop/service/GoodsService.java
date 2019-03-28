package ishop.service;

import ishop.DAO.GoodsDAO;
import ishop.entity.GoodsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GoodsService {
    @Autowired
    GoodsDAO goodsDAO;

    public List<GoodsEntity> getAllGoodsEntities() {
        return goodsDAO.getAllGoods();
    }
    public List<GoodsEntity> getGoodsByPrice(String from, String to){
        return goodsDAO.getGoodsByPrice(Integer.parseInt(from),Integer.parseInt(to));
    }
    public List<GoodsEntity> getGoodsEntitiesByName(String name){
       return goodsDAO.getEntityListByName(name);
    }
    public List<GoodsEntity> getGoodsEntitesBySortByPriceASC(){
        return goodsDAO.getEntityGoodBySortPriceASC();

    }

    public void createGood(GoodsEntity goodsEntity){
         goodsDAO.create(goodsEntity);
    }

    public List<GoodsEntity> getGoodsEntitesBySortByPriceDESC(){
       return goodsDAO.getEntityGoodBySortPriceDESC();

    }
    public List<GoodsEntity> getGoodsEntitesBySortByLikesASC(){
        return goodsDAO.getEntityGoodBySortPriceASC();

    }
    public List<GoodsEntity> getGoodsEntitesBySortByLikesDESC(){
        return goodsDAO.getEntityGoodBySortPriceDESC();

    }
    public GoodsEntity getGoodByName(String string){
       return goodsDAO.getGoodByName(string);
    }



}
