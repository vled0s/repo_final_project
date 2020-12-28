package com.epam.rd.izh.repository;

import com.epam.rd.izh.entity.Brand;
import com.epam.rd.izh.entity.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CarRepository extends JpaRepository<Car, Long> {

    @Query("select c from Car c where c.carBrand = :carBrand and c.rented = false")
    Iterable<Car> findFreeCarsByCarBrand(Brand carBrand);

}
