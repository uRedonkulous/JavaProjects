package com.thanh.newProject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.thanh.newProject.models.Game;
import com.thanh.newProject.models.Login;
import com.thanh.newProject.models.User;

import com.thanh.newProject.services.GameService;
import com.thanh.newProject.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService users;
	
	@Autowired
	private GameService games;

	// Homepage
	@GetMapping("/")
	
	public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new Login());
        return "index.jsp";
	}

	@GetMapping("/home")
	
	public String home(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("games", games.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "Home.jsp";
	}
	
	// Registration
	@PostMapping("/register")
	
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
		
    	User user = users.register(newUser, result);
    	if(result.hasErrors()) {
            model.addAttribute("newLogin", new Login());
            return "index.jsp";
        }
        session.setAttribute("userId", user.getId());
        return "redirect:/home";
	}
	
	// Login
    @PostMapping("/login")
    
    public String login(@Valid @ModelAttribute("newLogin") Login newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = users.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("userId", user.getId());
        return "redirect:/home";
    }
    
    //Logout
    @GetMapping("/logout")
    
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }

    //Add a Game
    @GetMapping("/addGame")
    
    public String addTeam(@ModelAttribute("game") Game game, Model model, HttpSession session) {
    	User user = users.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	return "addGame.jsp";
    }
    
    //Game Homepage
    @PostMapping("/games")
    
    public String createGame(@Valid @ModelAttribute("game") Game game, BindingResult result) {
    	if (result.hasErrors()) {
    		return "addGame.jsp";
    	}
    	games.create(game);
    	return "redirect:/home";
    }
    
    //Edit/Update Games
    @GetMapping("/games/{id}/edit")
    
    public String editGame(Model model, @PathVariable("id") Long id, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Game game = games.findById(id);
    	model.addAttribute("game", game);
    	return "editGame.jsp";
    }
    
    //Team Page
    @GetMapping("/games/{id}")
    
    public String showTeam(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Game game = games.findById(id);
    	model.addAttribute("game", game);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "Game.jsp";
    }
    
    //Update this Game
    @PutMapping("/games/{id}")
    
    public String updateGame(@Valid @ModelAttribute("game") Game game, BindingResult result, Model model) {
    	
    	if (result.hasErrors()) {
    		return "editGame.jsp";
    	}
    	games.update(game); 	
    	return "redirect:/home";
    }
    
    //Delete Game
    @GetMapping("/{id}/delete")
    
    public String delete(@PathVariable(name="id") Long id) {
    	games.delete(id);
    	return "redirect:/home";
    }
    
}
