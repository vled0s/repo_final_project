package com.epam.rd.izh.config;

import com.epam.rd.izh.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties("storage")
public class StorageConfig {

	/**
	 * Folder location for storing files
	 */
	private String location = "src/main/webapp/images";

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Bean
	@Autowired
	public StorageService storageService(StorageService storageService) {
		storageService.init();
		return storageService;
	}
}
