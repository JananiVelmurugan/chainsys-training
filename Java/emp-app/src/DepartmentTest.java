
public class DepartmentTest {
	public static void main(String[] args) {
		Department department1 = new Department(1, "training");
		System.out.println(department1);
		Department department2 = new Department(1, "training");
		System.out.println(department2);
		if (department1.equals(department2)) {
			System.out.println("equal");
		} else {
			System.out.println("unequal");
		}
	}
}
