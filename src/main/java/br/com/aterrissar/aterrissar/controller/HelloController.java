package br.com.aterrissar.aterrissar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HelloController {

	@ResponseBody
	public String hello() {
		return "Olá, bem vindo ao aterrisssar";
	}
}
