package com.chainsys.emp.model.test;

import java.util.Set;

import org.omg.CORBA.RepositoryIdHelper;

import com.chainsys.emp.exception.EmployeeNotFoundException;
import com.chainsys.emp.model.Employee;
import com.chainsys.emp.service.EmployeeService;
import com.chainsys.emp.service.EmployeeServiceImpl;

public class EmployeeServiceTest {
	public static void main(String[] args) {
		EmployeeService service = new EmployeeServiceImpl();

		System.out.println("Employee Service");
		System.out.println("Find By Id");
		int id = 102;
		try {
			Employee employee = service.findById(id);
			System.out.println(employee);
		} catch (EmployeeNotFoundException e) {
		}

		System.out.println("Update Id");
		Employee updateEmployee = new Employee(100, "ImmanuelMathew");
		try {
			service.update(updateEmployee);
			Set<Employee> findAll = service.findAll();
			System.out.println(findAll);
		} catch (EmployeeNotFoundException e) {

		}

	}

}
