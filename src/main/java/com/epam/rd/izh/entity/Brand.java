package com.epam.rd.izh.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "brands")
public class Brand {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "brand_id")
        private Long brandId;
        @Column(name = "brand_name")
        private String brandName;
        @Column(name = "image_url")
        private String imageUrl;

}
