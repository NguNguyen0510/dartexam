import 'dart:io';

class Employee {
  int id;
  String fullName;
  DateTime birthday;
  String address;
  String phoneNumber;

  Employee({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.address,
    required this.phoneNumber,
  });
}

List<Employee> employees = [];

void addNewEmployee() {
  print('nhap Employee ID:');
  int id = int.parse(stdin.readLineSync()!);

  print('nhap Full Name:');
  String fullName = stdin.readLineSync()!;

  print('nhap Birthday (yyyy-mm-dd):');
  DateTime birthday = DateTime.parse(stdin.readLineSync()!);

  print('nhap Address:');
  String address = stdin.readLineSync()!;

  print('nhap sdt :');
  String phoneNumber = stdin.readLineSync()!;

  Employee newEmployee = Employee(
    id: id,
    fullName: fullName,
    birthday: birthday,
    address: address,
    phoneNumber: phoneNumber,
  );

  employees.add(newEmployee);
}

List<Employee> getAllEmployee() {
  return employees;
}

void updateEmployee(int id) {
  int index = employees.indexWhere((employee) => employee.id == id);
  if (index != -1) {
    print('nhap Full Name moi:');
    String fullName = stdin.readLineSync()!;

    print('nhap ngay sinh moi (yyyy-mm-dd):');
    DateTime birthday = DateTime.parse(stdin.readLineSync()!);

    print('nhap Address moi:');
    String address = stdin.readLineSync()!;

    print('nhap sdt moi:');
    String phoneNumber = stdin.readLineSync()!;

    Employee updatedEmployee = Employee(
      id: id,
      fullName: fullName,
      birthday: birthday,
      address: address,
      phoneNumber: phoneNumber,
    );

    employees[index] = updatedEmployee;
  } else {
    print('ko tim thay nhan vien co id $id .');
  }
}

void showAllEmployee() {
  for (var employee in employees) {
    print('ID: ${employee.id}');
    print('Full Name: ${employee.fullName}');
    print('Birthday: ${employee.birthday}');
    print('Address: ${employee.address}');
    print('Phone Number: ${employee.phoneNumber}');
    print('-------------------------');
  }
}

void main() {
  while (true) {
    print('chon 1 chuc nang ma sudung:');
    print('1. Add New Employee');
    print('2. Get All Employees');
    print('3. Update Employee');
    print('4. Show All Employees');
    print('5. Exit');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addNewEmployee();
        break;
      case '2':
        var employeesList = getAllEmployee();
        if (employeesList.isEmpty) {
          print('ko co employe nao.');
        } else {
          print('Employees:');
          for (var employee in employeesList) {
            print('ID: ${employee.id}, Full Name: ${employee.fullName}');
          }
        }
        break;
      case '3':
        print('nhap id cua employee can update:');
        int id = int.parse(stdin.readLineSync()!);
        updateEmployee(id);
        break;
      case '4':
        showAllEmployee();
        break;
      case '5':
        exit(0);
        
      default:
        print('ko co chuc nang do  ,chon lai di .');
        break;
    }
  }
}