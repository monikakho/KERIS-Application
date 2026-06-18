import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends Notifier<List<Map<String, dynamic>>> {
  @override
  List<Map<String, dynamic>> build() {
    return [
      {
        "text": "Halo! Saya KEBOT, AI Talent Scout Anda. Saya di sini untuk membantu Anda menemukan jalur karier terbaik. Bisa ceritakan apa minat utama Anda saat ini?",
        "isBot": true,
        "time": "09:00 AM",
        "isSkillDetected": false,
      },
    ];
  }

  void sendMessage(String text, String timeString) {
    if (text.trim().isEmpty) return;

    state = [
      ...state,
      {
        "text": text,
        "isBot": false,
        "time": timeString,
        "isSkillDetected": false,
      }
    ];

    String userText = text.toLowerCase();

    // Simulasi balasan bot sederhana
    Future.delayed(const Duration(seconds: 1), () {
      final isSkillDetected = userText.contains("mobile") || userText.contains("desain");
      
      final now = DateTime.now();
      String ampm = now.hour >= 12 ? 'PM' : 'AM';
      int hour12 = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
      final botTime = "${hour12.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} $ampm";

      state = [
        ...state,
        {
          "text": isSkillDetected
              ? "Wah, itu menarik! Saya mendeteksi potensi di bidang UI/UX atau Flutter. Ingin lihat kurikulumnya?"
              : "Bisa jelaskan lebih detail lagi tentang apa yang kamu suka?",
          "isBot": true,
          "time": botTime,
          "isSkillDetected": isSkillDetected,
        }
      ];
    });
  }

  void deleteMessage(int index) {
    final newState = [...state];
    newState.removeAt(index);
    state = newState;
  }
}

final chatProvider = NotifierProvider<ChatNotifier, List<Map<String, dynamic>>>(() {
  return ChatNotifier();
});
