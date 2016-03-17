package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import project.model.User;
import project.service.MaterialService;
import project.service.UserService;

/**
 * Created by Ilya on 11.02.2016.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private MaterialService materialService;

    @RequestMapping(value = {"/","/home"})
    public String showHomePage(ModelMap modelMap){
        modelMap.addAttribute("users",userService.getAllUsers());
        return "home";
    }

    @RequestMapping(value = "/registration_page",method = RequestMethod.GET)
    public String showRegistrationPage(ModelMap modelMap){
        modelMap.put("user",new User());
        return "registration";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registrationUser(ModelMap modelMap, @ModelAttribute("user") User user){
        if(userService.alreadyExist(user.getUsername())){
            modelMap.addAttribute("error","The user already exist");
            return "registration";
        }
        userService.add(user);
        modelMap.addAttribute("message","Registration success!");
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(@RequestParam(value = "error", required = false) String error,
                                @RequestParam(value = "logout", required = false) String logout,
                                ModelMap modelMap) {
        if (error != null) {
            modelMap.addAttribute("error", "Invalid username and password!");
        }
        if (logout != null) {
            modelMap.addAttribute("msg", "You've been logged out successfully.");
        }
        return "login";
    }

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String showMyAccount() {
        return "redirect:account/"+getCurrentUser().getUsername();
    }

    @RequestMapping(value = "/account/{username}", method = RequestMethod.GET)
    public String showUserAccount(ModelMap modelMap, @PathVariable("username") String username) {
        modelMap.addAttribute("user",userService.findByUserName(username));
        return "account";
    }

    @RequestMapping(value = "/account/{username}/{id_material}", method = RequestMethod.GET)
    public String showUserMaterial(ModelMap modelMap, @PathVariable("username") String username,
                                   @PathVariable("id_material") Integer id_material) {
        modelMap.addAttribute("user", userService.findByUserName(username));
        modelMap.addAttribute("material", materialService.getMaterialById(id_material));
        return "show_material";
    }

    @RequestMapping(value = "/account/{username}/edit", method = RequestMethod.GET)
    public String getUserEdit(ModelMap modelMap, @PathVariable("username") String username){
        modelMap.addAttribute("user",userService.findByUserName(username));
        return "edit_user";
    }

    @RequestMapping(value ="/account/{username}/edit", method=RequestMethod.POST)
    public String userEdit(@PathVariable("username") String username,@ModelAttribute("user") User user){
        userService.updateContent(getCurrentUser().getId(), user);
        return "redirect:/account/"+username;
    }

    @RequestMapping(value = "/account/{username}/material/create", method = RequestMethod.GET)
    public String showPageNewMaterial(ModelMap modelMap,@PathVariable("username")String username){
        modelMap.addAttribute("user",userService.findByUserName(username));
        return "material";
    }

    User getCurrentUser(){
        try{
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            return userService.findByUserName(auth.getName());

        } catch (Exception ex)
        {
            return null;
        }
    }

}
