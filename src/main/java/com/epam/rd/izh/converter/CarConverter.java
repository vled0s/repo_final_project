package com.epam.rd.izh.converter;

import com.epam.rd.izh.dto.CarDto;
import com.epam.rd.izh.entity.Brand;
import com.epam.rd.izh.entity.Car;
import com.epam.rd.izh.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;


public class CarConverter {

    @Autowired
    BrandRepository brandRepository;

    public CarDto entityToDto(Car car) {
        CarDto carDto = new CarDto();

        carDto.setCarId(car.getCarId());
        carDto.setCarBrand(car.getCarBrand());
        carDto.setTransmission(car.getTransmission());

        String[] split = car.getGasMileage().split("/");
        carDto.setGasMileageCity(Double.parseDouble(split[0]));
        carDto.setGasMileageTrack(Double.parseDouble(split[1]));
        carDto.setGasMileageMix(Double.parseDouble(split[2]));

        carDto.setMileage(car.getMileage());
        carDto.setLicensePlate(car.getLicensePlate());
        carDto.setModel(car.getModel());
        carDto.setDescription(car.getDescription());
        carDto.setSharingPrice(car.getSharingPrice());
        carDto.setSharingPrice(car.getSharingPrice());
        carDto.setImageUrl(car.getImageUrl());
        carDto.setRented(car.getRented());
        return carDto;
    }

    public Car dtoToEntity(CarDto carDto) {
        Car car = new Car();
        Brand byBrandName = brandRepository.findByBrandName(carDto.getNewBrandName());
        if (byBrandName == null) {
            return null;
        } else {
            car.setCarId(carDto.getCarId());
            car.setCarBrand(byBrandName);
            car.setTransmission(carDto.getTransmission());
            car.setGasMileage
                    (
                            carDto.getGasMileageCity() + "/" +
                            carDto.getGasMileageTrack() + "/" +
                            carDto.getGasMileageMix()
                    );
            car.setMileage(carDto.getMileage());
            car.setLicensePlate(carDto.getLicensePlate());
            car.setModel(carDto.getModel());
            car.setDescription(carDto.getDescription());
            car.setSharingPrice(carDto.getSharingPrice());
            car.setSharingPrice(carDto.getSharingPrice());
            car.setImageUrl(carDto.getImageUrl());
            car.setRented(carDto.getRented());
            return car;
        }
    }

}
