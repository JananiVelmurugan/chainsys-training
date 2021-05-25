package com.chainsys.emp.test;

import java.util.Set;


import com.chainsys.emp.exception.EmployeeNotFoundException;
import com.chainsys.emp.model.Employee;
import com.chainsys.emp.service.EmployeeService;
import com.chainsys.emp.service.EmployeeServiceImpl;

public class EmployeeServiceTest {
	public static void main(String[] args) {
		
		Set<Employee> employeeSet;
		// 1. Create an object for service
		EmployeeService service = new EmployeeServiceImpl();
		
		

		System.out.println("Employee Service");
		
		System.out.println("Find All Employees");
		employeeSet = service.findAll();
		System.out.println(employeeSet);
		
		System.out.println("Find By Id");
		// 2. Get input to id
		int id = 1;
		try {
			// 3. call findById in service with id as input
			Employee employee = service.findById(id);
			// 4. Print the employee
			System.out.println(employee);
		} catch (EmployeeNotFoundException e) {
			// 5. If emp not found
		}

		System.out.println("Update Id");
		// 1. Create New employee Data to be updated
		Employee updateEmployee = new Employee(100, "ImmanuelMathew");
		try {
			// 2. call the update method in service with input emp obje
			service.update(updateEmployee);
			employeeSet = service.findAll();
			System.out.println(employeeSet);
		} catch (EmployeeNotFoundException e) {

		}
		
		System.out.println("Adding an employee");
		Employee newEmployee = new Employee(104,"Kavin");
		service.save(newEmployee);
		employeeSet = service.findAll();
		System.out.println(employeeSet);
		
		System.out.println("Deleting an employee");
		id = 10; 
		try {
			service.delete(id);
			employeeSet = service.findAll();
			System.out.println(employeeSet);
		} catch (EmployeeNotFoundException e) {
		}
		
		
	}

}
