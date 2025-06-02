package com.bookstore.bookstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class BookstoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookstoreApplication.class, args);
	}

	// ✅ Add welcome message here
	@RestController
	class WelcomeController {
		@GetMapping("/")
		public String home() {
			return "Welcome to the Bookstore API Hairmann Hayak (OpenShift Deployment Successful)!";
		}
	}
}

