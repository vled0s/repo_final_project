package com.epam.rd.izh.controller;

import com.epam.rd.izh.dto.CarDto;
import com.epam.rd.izh.entity.Brand;
import com.epam.rd.izh.entity.Car;
import com.epam.rd.izh.repository.BrandRepository;
import com.epam.rd.izh.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@EnableSpringDataWebSupport
public class BrandController {

    @Autowired
    BrandRepository brandRepository;

    @Autowired
    CarRepository carRepository;

    @RequestMapping("/catalog/{brand_id}")
    public String catalogBrands(@PathVariable("brand_id") String brand, Model model) {
        Brand foundBrand = brandRepository.findByBrandName(brand);
        model.addAttribute("brand", foundBrand);
        Iterable<Car> cars = carRepository.findFreeCarsByCarBrand(foundBrand);
        model.addAttribute("cars", cars);

        return "brand-page";
    }

    @GetMapping("/catalog/addBrand")
    @PreAuthorize("hasAuthority('write')")
    public String newBrand() {
        return "add-new-brand";
    }

    @PostMapping("/catalog/addBrand")
    @PreAuthorize("hasAuthority('write')")
    public String addCar(@ModelAttribute("Brand") Brand newBrand) {
        brandRepository.save(newBrand);
        return "redirect:/catalog";
    }

}
