import 'package:flutter/material.dart';

class Student {
  String name;
  String? email;
  String? phone;

  Student({required this.name, this.email, this.phone});
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListScreen(),
  ));
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Student> students = [
      Student(name: 'Nguyễn Văn An', email: 'an@sv.edu.vn', phone: '0901 234 567'),
      Student(name: 'Trần Thị Bình', email: null, phone: '0912 888 999'),
      Student(name: 'Lê Minh Chi', email: 'chi@sv.edu.vn', phone: null),
      Student(name: 'Phạm Quốc Dũng', email: null, phone: null),
      Student(name: 'Võ Thanh Em', email: 'em@sv.edu.vn', phone: '0933 111 222'),
    ];

    int missingEmailCount = 0;
    int missingPhoneCount = 0;
    
    for (var student in students) {
      if (student.email == null) missingEmailCount++;
      if (student.phone == null) missingPhoneCount++;
    }

    List<Widget> studentCards = [];
    for (var student in students) {
      studentCards.add(
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student.name,
                style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    student.email ?? 'Chưa cập nhật',
                    style: TextStyle(
                      color: student.email == null ? Colors.deepOrange : Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Text(
                    'SĐT: ',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    student.phone ?? 'Chưa cập nhật',
                    style: TextStyle(
                      color: student.phone == null ? Colors.deepOrange : Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text(
          'Danh sách sinh viên',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1D3557),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: studentCards,
            ),
          ),
          Container(
            color: const Color(0xFFE2E8F0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Tổng: ', style: TextStyle(color: Color(0xFF1E293B))),
                    Text(
                      '${students.length} sinh viên',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Thiếu Email: ', style: TextStyle(color: Color(0xFF1E293B))),
                    Text(
                      '$missingEmailCount',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
