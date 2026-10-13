import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GradeScreen(),
  ));
}

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  String getRank(double score) {
    if (score < 0 || score > 10) {
      return 'Không hợp lệ';
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

  Color getRankTextColor(double score) {
    if (score < 0 || score > 10) {
      return const Color(0xFF757575);
    } else if (score >= 8.0) {
      return const Color(0xFF2E7D32);
    } else if (score >= 6.5) {
      return const Color(0xFF1565C0);
    } else if (score >= 5.0) {
      return const Color(0xFFEF6C00);
    } else {
      return const Color(0xFFC62828);
    }
  }

  Color getRankBgColor(double score) {
    if (score < 0 || score > 10) {
      return const Color(0xFFF5F5F5);
    } else if (score >= 8.0) {
      return const Color(0xFFE8F5E9);
    } else if (score >= 6.5) {
      return const Color(0xFFE3F2FD);
    } else if (score >= 5.0) {
      return const Color(0xFFFFF3E0);
    } else {
      return const Color(0xFFFFEBEE);
    }
  }

  @override
  Widget build(BuildContext context) {
    double mainScore = 8.5;

    List<double> testScores = [9, 7, 5.5, 3, 11];
    List<Widget> testRows = [];

    for (int i = 0; i < testScores.length; i++) {
      double score = testScores[i];
      testRows.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Điểm $score',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1E293B),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: getRankBgColor(score),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  getRank(score),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: getRankTextColor(score),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      
      if (i < testScores.length - 1) {
        testRows.add(
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
          'Xếp loại học lực',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1D3557),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text('Điểm trung bình', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 8),
                  Text(
                    '$mainScore',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: getRankBgColor(mainScore),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      getRank(mainScore),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: getRankTextColor(mainScore),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'KIỂM TRA THÊM',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: testRows,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
