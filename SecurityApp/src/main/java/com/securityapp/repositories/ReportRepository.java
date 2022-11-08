package com.securityapp.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.securityapp.models.Report;

@Repository
public interface ReportRepository extends CrudRepository<Report, Long> {
	List<Report> findAll();
	
	@Query(" SELECT a FROM Report a WHERE a.user.id = ?1")
	List<Report> findReportsByUserId(Long id);
}
