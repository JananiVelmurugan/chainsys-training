package com.chainsys.emp.service;

import java.util.Set;

import com.chainsys.emp.exception.EmployeeNotFoundException;
import com.chainsys.emp.model.Employee;
import com.chainsys.emp.repository.EmployeeRepository;
import com.chainsys.emp.repository.EmployeeRepositoryImpl;

public class EmployeeServiceImpl implements EmployeeService {
	private static EmployeeRepository repository;

	public EmployeeServiceImpl() {
		repository = new EmployeeRepositoryImpl();
	}

	@Override
	public Set<Employee> findAll() {
		return repository.findAll();
	}

	@Override
	public Employee findById(int id) throws EmployeeNotFoundException {
		Employee employee = repository.findById(id);
		if (employee == null) {
			throw new EmployeeNotFoundException("Employee Id Not Found");
		} else {
			return employee;
		}
	}

	@Override
	public void save(Employee employee) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Employee employee) throws EmployeeNotFoundException {
		Employee result = repository.findById(employee.getId());
		if (result == null) {
			throw new EmployeeNotFoundException("Employee Id Not Found");
		} else {
			repository.update(employee);
		}

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

}
