package com.epam.rd.izh.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "cars")
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long carId;

    @OneToOne
    @JoinColumn(name = "brand_id")
    private Brand carBrand;
    private String gasMileage;
    private String transmission;
    private Integer mileage;
    private String licensePlate;
    private String model;
    private String description;
    private Double sharingPrice;
    private String imageUrl;
    private Boolean rented;

}
