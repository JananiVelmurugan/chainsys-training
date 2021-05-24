package com.chainsys.emp.model.test;

import com.chainsys.emp.model.Employee;

public class EmployeeTest {
	public static void main(String[] args) {

		Employee employee1 = new Employee(100,"Petchimuthu");
		System.out.println(employee1);

		Employee employee2 = new Employee(200, "Varun");
		System.out.println(employee2);
		
		if (employee1.equals(employee2)) {
			System.out.println("equal");
		} else {
			System.out.println("unequal");
		}
		
		Employee[] employees = new Employee[2];
		employees[0] = employee1;
		employees[1] = employee2;
		System.out.println(employees[0]);
		System.out.println(employees[1]);
		for(Employee emp:employees) {
			System.out.println(emp);
			System.out.println(emp.getName());
		}

	}
}
