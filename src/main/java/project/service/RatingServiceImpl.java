package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.RatingDao;
import project.model.Material;
import project.model.Rating;

import javax.transaction.Transactional;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class RatingServiceImpl implements RatingService {

    @Autowired
    RatingDao ratingDao;
    @Autowired
    MaterialService materialService;

    public void addRating(Rating rating) {
        ratingDao.addRating(rating);
    }

    public void setOrUpdateRating(Rating rating) {
        Material material = materialService.getMaterialById(rating.getMaterial().getId_material());
        Set<Rating> ratings =  material.getRatings();
        Iterator iterator = ratings.iterator();
        boolean checkExist = false;
        while (iterator.hasNext()){

            Rating ratingOld = (Rating)iterator.next();
            if(rating.getUserName().equals(ratingOld.getUserName())){
                checkExist = true;
                if(ratingOld.getValue() != rating.getValue()){
                    updateValue(ratingOld.getId(), rating);
                }

            }
        }
        if(!checkExist){
            rating.setMaterial(material);
            addRating(rating);
        }
    }

    public int getRatingMaterial(Integer id) {
        Integer idas = id;
        Material material = materialService.getMaterialById(id);
        int value = 0;
        Set<Rating> ratings = material.getRatings();
        Iterator iterator = ratings.iterator();
        while (iterator.hasNext()){
            Rating rating1 = (Rating) iterator.next();
            value += rating1.getValue();
        }
        return value;
    }

    public void updateValue(Integer id, Rating rating) {
        ratingDao.updateValue(id,rating);
    }
}
