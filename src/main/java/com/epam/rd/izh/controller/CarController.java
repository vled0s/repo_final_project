package com.epam.rd.izh.controller;

import com.epam.rd.izh.converter.CarConverter;
import com.epam.rd.izh.dto.CarDto;
import com.epam.rd.izh.entity.Car;
import com.epam.rd.izh.entity.SharingRequest;
import com.epam.rd.izh.entity.User;
import com.epam.rd.izh.repository.BrandRepository;
import com.epam.rd.izh.repository.CarRepository;
import com.epam.rd.izh.repository.SharingRequestRepository;
import com.epam.rd.izh.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CarController {

    @Autowired
    BrandRepository brandRepository;
    @Autowired
    CarRepository carRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    SharingRequestRepository sharingRequestRepository;
    @Autowired
    CarConverter carConverter;

    @PostMapping("/catalog/registerSharing")
    public String newRegisterSharing(@ModelAttribute ("registerSharing") SharingRequest sharingRequest,
                                     Authentication authentication) {

        User user = userRepository.findByEmail(authentication.getName());
        sharingRequest.setUserId(user.getUserId());
        sharingRequestRepository.save(sharingRequest);

        return "redirect:/catalog";
    }

    @GetMapping("/catalog/register-sharing/{carId}")
    @PreAuthorize("isAuthenticated()")
    public String showViewRegisterSharing(@PathVariable("carId") Long carId, Model model) {
        Car byCarId = carRepository.findById(carId).orElse(null);
        if (byCarId != null) {
            CarDto carDto = carConverter.entityToDto(byCarId);
            model.addAttribute("carData", carDto);
            return "register-sharing";
        } else {
            return "car-not-found";
        }

    }

    @GetMapping("/catalog/editCar/{carId}")
    @PreAuthorize("hasAuthority('write')")
    public String showViewEditCar(@PathVariable("carId") Long carId, Model model) {

        Car byCarId = carRepository.findById(carId).orElse(null);
        if (byCarId != null) {
            CarDto carDto = carConverter.entityToDto(byCarId);
            model.addAttribute("carData", carDto);
            model.addAttribute("editCar", true);
            model.addAttribute("Car", carDto);
            model.addAttribute("Brands", brandRepository.findAll());
            return "add-or-edit-sharing-car";
        } else {
            return "car-not-found";
        }
    }

    @PostMapping("/catalog/editCar")
    @PreAuthorize("hasAuthority('write')")
    public String saveCar(@ModelAttribute("modifiedCar") CarDto modifiedCar) {
        Car car = carConverter.dtoToEntity(modifiedCar);
        carRepository.save(car);
        return "redirect:/catalog";
    }


    @GetMapping("/catalog/addCar")
    @PreAuthorize("hasAuthority('write')")
    public String showViewAddCar(Model model) {
        model.addAttribute("Brands", brandRepository.findAll());
        //model.addAttribute("Car", new CarDto());
        return "add-or-edit-sharing-car";
    }

    @PostMapping("/catalog/addCar")
    @PreAuthorize("hasAuthority('write')")
    public String addCar(@ModelAttribute("Car") CarDto newCar) {
        Car car = carConverter.dtoToEntity(newCar);
        car.setRented(false);
        carRepository.save(car);
        return "redirect:/catalog";
    }

    @DeleteMapping("/catalog/deleteCar")
    @ResponseBody
    @PreAuthorize("hasAuthority('write')")
    public String deleteCar(@ModelAttribute("idCar") Long idCar) {
        Car car = carRepository.findById(idCar).orElse(null);
        if (car != null) {
            carRepository.delete(car);
            return "delete ok";
        } else {
            return "delete false";
        }
    }



}
