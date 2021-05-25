package com.chainsys.emp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import com.chainsys.emp.model.Employee;

public class EmployeeDAOImpl implements EmployeeDAO {

	private static Connection con;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	private static Set<Employee> employeeSet;

	public EmployeeDAOImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "root", "password");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Set<Employee> findAll() {
		try {
			pstmt = con.prepareStatement("select * from employee");
			rs = pstmt.executeQuery();
			employeeSet = new HashSet<>();
			while (rs.next()) {
				Employee employee = new Employee(rs.getInt("id"), rs.getString("name"));
				employeeSet.add(employee);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employeeSet;
	}

	@Override
	public Employee findById(int id) {
		Employee employee = null;
		try {
			pstmt = con.prepareStatement("select * from employee where id=?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				employee = new Employee(rs.getInt("id"), rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employee;
	}

	@Override
	public void save(Employee employee) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Employee employee) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

}
