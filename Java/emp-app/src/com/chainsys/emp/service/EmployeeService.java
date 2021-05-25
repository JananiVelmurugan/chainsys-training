package com.chainsys.emp.service;

import java.util.Set;

import com.chainsys.emp.exception.EmployeeNotFoundException;
import com.chainsys.emp.model.Employee;

public interface EmployeeService {
	Set<Employee> findAll();

	Employee findById(int id) throws EmployeeNotFoundException;

	void save(Employee employee);

	void update(Employee employee) throws EmployeeNotFoundException;

	void delete(int id)throws EmployeeNotFoundException;

}
