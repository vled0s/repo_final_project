package com.epam.rd.izh.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

  @GetMapping("/")
  public String login(Authentication authentication, Model model) {
    return "redirect:/catalog";
  }

}
