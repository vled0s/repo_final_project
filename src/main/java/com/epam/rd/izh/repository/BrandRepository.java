package com.epam.rd.izh.repository;

import com.epam.rd.izh.entity.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BrandRepository extends JpaRepository<Brand, String> {

    Brand findByBrandName(String brand);

}
