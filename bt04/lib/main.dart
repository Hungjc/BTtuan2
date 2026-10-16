import 'package:flutter/material.dart';

class Student {
  String name;
  double? score;

  Student({
    required this.name,
    this.score,
  });
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GradeScreen(),
  ));
}

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  String getRank(double? score) {
    if (score == null) {
      return 'Chưa có điểm';
    } else if (score >= 8.0) {
      return 'Giỏi';
    } else if (score >= 6.5) {
      return 'Khá';
    } else if (score >= 5.0) {
      return 'Trung bình';
    } else {
      return 'Yếu';
    }
  }

  Color getRankTextColor(double? score) {
    if (score == null) {
      return const Color(0xFF94A3B8);
    } else if (score >= 8.0) {
      return const Color(0xFF16A34A);
    } else if (score >= 6.5) {
      return const Color(0xFF2563EB);
    } else if (score >= 5.0) {
      return const Color(0xFFD97706);
    } else {
      return const Color(0xFFDC2626);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Student> students = [
      Student(name: 'Nguyễn Văn An', score: 9.0),
      Student(name: 'Trần Thị Bình', score: 7.2),
      Student(name: 'Lê Minh Chi', score: null),
      Student(name: 'Phạm Quốc Dũng', score: 4.5),
      Student(name: 'Võ Thanh Em', score: 5.8),
    ];

    double totalScore = 0;
    int scoredCount = 0;
    int gioicount = 0;
    int noScoreCount = 0;
    double maxScore = 0;

    for (var s in students) {
      if (s.score == null) {
        noScoreCount++;
      } else {
        double currentScore = s.score!;
        totalScore += currentScore;
        scoredCount++;
        if (currentScore >= 8.0) {
          gioicount++;
        }
        if (currentScore > maxScore) {
          maxScore = currentScore;
        }
      }
    }

    double avgScore = scoredCount > 0 ? (totalScore / scoredCount) : 0;

    List<Widget> studentRows = [];
    for (int i = 0; i < students.length; i++) {
      var s = students[i];
      studentRows.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    getRank(s.score),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: getRankTextColor(s.score),
                    ),
                  ),
                ],
              ),
              Text(
                s.score != null ? '${s.score}' : '—',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: s.score != null ? const Color(0xFF1E293B) : const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ),
      );

      if (i < students.length - 1) {
        studentRows.add(
          Container(
            height: 1,
            color: const Color(0xFFF1F5F9),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text(
          'Bảng điểm lớp',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1D3557),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1D3557),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Điểm trung bình lớp',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    avgScore.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 1,
                    color: Colors.white.withOpacity(0.15),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Giỏi', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                          const SizedBox(height: 4),
                          Text('$gioicount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Chưa có điểm', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                          const SizedBox(height: 4),
                          Text('$noScoreCount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cao nhất', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                          const SizedBox(height: 4),
                          Text('$maxScore', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'DANH SÁCH - ${students.length} SINH VIÊN',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: studentRows,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
