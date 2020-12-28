package com.epam.rd.izh.controller;

import com.epam.rd.izh.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HeaderFooterController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/header")
    public String viewHeader(Authentication authentication, HttpServletRequest request, Model model) {
        return "header";
    }

    @GetMapping("/footer")
    public String viewFooter() {
        return "footer";
    }

}