import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/enroll_provider.dart';
import '../../widgets/popup_quest.dart';

class Quest2Page extends ConsumerStatefulWidget {
  const Quest2Page({super.key});

  @override
  ConsumerState<Quest2Page> createState() => _Quest2PageState();
}

class _Quest2PageState extends ConsumerState<Quest2Page> {
  final TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final track = ref.watch(selectedTrackProvider);

    String topic = "DOM Manipulation";
    String instruction = "Lengkapi kode untuk mengambil elemen berdasarkan class name:";
    String codeSnippet = "const container = document.querySelector('#myContainer');\nconst cards = ";
    String hint = "container.getElementsByClassName(...)";

    if (track == 'Mobile Development') {
      topic = "Layout & Widget";
      instruction = "Lengkapi kode untuk menyusun widget secara horizontal dengan jarak merata:";
      codeSnippet = "Widget buildRow() {\n  return Row(\n    mainAxisAlignment: ";
      hint = "MainAxisAlignment.spaceEvenly,";
    } else if (track == 'Artificial Intelligence') {
      topic = "Data Wrangling";
      instruction = "Lengkapi kode untuk membaca dataset CSV menggunakan Pandas:";
      codeSnippet = "import pandas as pd\n\ndataset = ";
      hint = "pd.read_csv('data.csv')";
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryBlue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Tantangan 2",
          style: AppTheme.sectionTitle(fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Topik: $topic", style: AppTheme.body(fontSize: 13, color: const Color(0xFF6B7280))),
                  const SizedBox(height: 12),
                  Text(
                    instruction,
                    style: AppTheme.sectionTitle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          codeSnippet,
                          style: const TextStyle(fontFamily: 'monospace', color: Colors.white70),
                        ),
                        TextField(
                          controller: _answerController,
                          style: const TextStyle(fontFamily: 'monospace', color: Colors.orangeAccent),
                          decoration: InputDecoration(
                            hintText: hint,
                            hintStyle: const TextStyle(color: Colors.white24),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => PopupQuest(
                        isCorrect: true,
                        onPrimaryButtonPressed: () {
                          Navigator.pop(context); // Tutup Dialog
                          Navigator.pop(context); // Kembali ke halaman Quest
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryOrange,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text("Kumpulkan Jawaban", style: AppTheme.button(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}