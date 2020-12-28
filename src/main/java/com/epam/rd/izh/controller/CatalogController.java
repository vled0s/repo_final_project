package com.epam.rd.izh.controller;

import com.epam.rd.izh.entity.Brand;
import com.epam.rd.izh.repository.BrandRepository;
import com.epam.rd.izh.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.ArrayList;

@Controller
public class CatalogController {

    @Autowired
    BrandRepository brandRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping("/catalog")
    public String showViewCatalog(Authentication authentication, Model model) {
        ArrayList<Brand> allBrands = (ArrayList<Brand>) brandRepository.findAll();
        model.addAttribute("carBrands", allBrands);
        return "catalog";
    }


}