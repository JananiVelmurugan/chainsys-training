package com.chainsys.emp.service;

import java.util.Set;

import com.chainsys.emp.exception.EmployeeNotFoundException;
import com.chainsys.emp.model.Employee;

public interface EmployeeService {
	Set<Employee> findAll();

	Employee findById(int id) throws EmployeeNotFoundException;

	// TODO
	void save(Employee employee);

	void update(Employee employee) throws EmployeeNotFoundException;

	// TODO
	void delete(int id);

}
