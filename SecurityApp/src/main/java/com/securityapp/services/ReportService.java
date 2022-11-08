package com.securityapp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.securityapp.models.Report;
import com.securityapp.repositories.ReportRepository;


@Service
public class ReportService {
	private final ReportRepository reportRepository;
	
	 public ReportService(ReportRepository reportRepository) {
	     this.reportRepository = reportRepository;
	 }
	 // returns all the report
	 public List<Report> allReports() {
	     return reportRepository.findAll();
	 }
	 
	// returns all the report made by logged in user
	 public List<Report> findReportsByUserId(Long id) {
	     return reportRepository.findReportsByUserId(id);
	 }
	 
	 
	 // creates a report
	 public Report createReport(Report b) {
	     return reportRepository.save(b);
	 }
	 // retrieves 'a' report
	 public Report findReport(Long id) {
	     Optional<Report> optionalReport = reportRepository.findById(id);
	     if(optionalReport.isPresent()) {
	         return optionalReport.get();
	     } else {
	         return null;
	     }
	 }
	 
	 public Report updateReport(Report item) {
		 return reportRepository.save(item);
	 }
	 
	 public void deleteReport(Long id) {
		 reportRepository.deleteById(id);
	 }

}
