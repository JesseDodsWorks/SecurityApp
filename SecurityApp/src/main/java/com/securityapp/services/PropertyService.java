package com.securityapp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.securityapp.models.Property;
import com.securityapp.repositories.PropertyRepository;

@Service
public class PropertyService {
	private final PropertyRepository propertyRepository;
	
	 public PropertyService(PropertyRepository propertyRepository) {
	     this.propertyRepository = propertyRepository;
	 }
	 // returns all the property
	 public List<Property> allProperties() {
	     return propertyRepository.findAll();
	 }
	 // creates a property
	 public Property createProperty(Property b) {
	     return propertyRepository.save(b);
	 }
	 // retrieves a property
	 public Property findProperty(Long id) {
	     Optional<Property> optionalProperty = propertyRepository.findById(id);
	     if(optionalProperty.isPresent()) {
	         return optionalProperty.get();
	     } else {
	         return null;
	     }
	 }
	 
	 public Property updateProperty(Property item) {
		 return propertyRepository.save(item);
	 }
	 
	 public void deleteProperty(Long id) {
		 propertyRepository.deleteById(id);
	 }
}
