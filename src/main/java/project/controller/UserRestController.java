package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import project.model.Material;
import project.model.Rating;
import project.model.User;
import project.service.Condition;
import project.service.MaterialService;
import project.service.RatingService;
import project.service.UserService;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

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

    @RequestMapping(value="/material/rating/set", method = RequestMethod.POST)
    public int setRating(@RequestBody Rating rating){
        return ratingService.setOrUpdateRating(rating);
    }
    @RequestMapping(value = "/material/get", method = RequestMethod.GET)
    public Material getRating(){
        return materialService.getMaterialById(Condition.getIdMaterial());
    }

    @RequestMapping(value = "/material/add", method = RequestMethod.POST)
    public void addMaterial(@RequestBody Material material){
        material.setUser(getCurrentUser());
        materialService.addMaterial(material);
    }

}
