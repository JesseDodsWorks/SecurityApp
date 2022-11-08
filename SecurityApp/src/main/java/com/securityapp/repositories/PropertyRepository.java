package com.securityapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.securityapp.models.Property;

@Repository
public interface PropertyRepository extends CrudRepository<Property, Long> {
	List<Property> findAll();
}
