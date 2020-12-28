package com.epam.rd.izh.dto;

import com.epam.rd.izh.entity.Brand;
import lombok.Data;


@Data
public class CarDto {

    private Long carId;
    private Brand carBrand;
    private String transmission;
    private Integer mileage;
    private String licensePlate;
    private String model;
    private String description;
    private Double sharingPrice;
    private String imageUrl;

    private Double gasMileageCity;
    private Double gasMileageTrack;
    private Double gasMileageMix;
    private String newBrandName;
    private Boolean rented;

}
