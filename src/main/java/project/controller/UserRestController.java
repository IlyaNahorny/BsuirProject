package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import project.model.Material;
import project.model.Rating;
import project.model.User;
import project.service.MaterialService;
import project.service.RatingService;
import project.service.UserService;

import java.util.List;

/**
 * Created by Ilya on 20.02.2016.
 */
@RestController
public class UserRestController {
    @Autowired
    UserService userService;
    @Autowired
    MaterialService materialService;
    @Autowired
    RatingService ratingService;

    User getCurrentUser(){
        try{
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            return userService.findByUserName(auth.getName());
        } catch (Exception ex)
        {
            return null;
        }
    }

    @RequestMapping(value="/update/image", method = RequestMethod.POST)
    public String updateImage(@RequestBody String url){
        userService.updateImage(getCurrentUser().getId(),url);
        return "success";
    }

    @RequestMapping(value="/material/rating", method = RequestMethod.POST)
    public void setRating(@RequestBody Rating rating){
        Rating rating1 = ratingService.alreadyExist(rating.getUserName());
        if(rating1 != null){
            if(rating.getValue() != rating1.getValue()){
                ratingService.updateValue(rating.getId(),rating);
            }
        }
        else{
            String name = rating.getMaterial().getMaterialName();
            Material material = materialService.getMaterialByMaterialName(name);
            rating.setMaterial(material);
            ratingService.addRating(rating);
        }
    }

    @RequestMapping(value = "/material/add", method = RequestMethod.POST)
    public void addMaterial(@RequestBody Material material){
        material.setUser(getCurrentUser());
        materialService.addMaterial(material);
    }

}
