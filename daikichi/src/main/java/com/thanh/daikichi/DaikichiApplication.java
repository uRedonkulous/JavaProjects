package com.thanh.daikichi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DaikichiApplication {

	public static void main(String[] args) {
		SpringApplication.run(DaikichiApplication.class, args);
	}
	@RequestMapping(value="/daikichi", method=RequestMethod.GET)
	public String welcome() {
		return "Welcome!";
	}
	@RequestMapping(value="/daikichi/today", method=RequestMethod.GET)
	public String fortune() { 
		return "Today you will find luck in all your endeavors";
	}
	@RequestMapping(value="daikichi/tomorrow", method=RequestMethod.GET)
	public String fortunate() {
		return "Tomorrow, an opportunity will arise, be sure to be open to new ideas!";
	}
	@RequestMapping("/daikichi/travel/{place}")
	public String showPlace(@PathVariable("place") String place) {
		return "Congrats! You're going to " + place +"!";
	}
	@RequestMapping("/daikichi/lotto/{num}")
	public String number(@PathVariable("num") int num) {
		if (num % 2 ==0) {
			return "You will take a grand journey in the near future, but be weary of tempting offers";
	}
		else {
			return "You have enjoyed the fruits of your labor but now is a great time to spend time with family and friends";
		}
	}
}
