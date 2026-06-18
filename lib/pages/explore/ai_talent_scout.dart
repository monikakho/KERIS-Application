import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/chat_provider.dart';
import '../../core/theme/app_theme.dart';

class AiTalentScoutPage extends ConsumerStatefulWidget {
  const AiTalentScoutPage({super.key});

  @override
  ConsumerState<AiTalentScoutPage> createState() => _AiTalentScoutState();
}

class _AiTalentScoutState extends ConsumerState<AiTalentScoutPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // Untuk auto-scroll

  // Fungsi auto-scroll ke bawah[cite: 16]
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Fungsi Kirim Pesan[cite: 16]
  void _sendMessage() {
    final text = _chatController.text;
    if (text.trim().isEmpty) return;

    final timeString = TimeOfDay.now().format(context);
    ref.read(chatProvider.notifier).sendMessage(text, timeString);
    _chatController.clear();
    _scrollToBottom();

    // Auto-scroll lagi setelah bot membalas (1 detik)
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) _scrollToBottom();
    });
  }

  // Dialog Konfirmasi Hapus[cite: 16]
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Hapus Pesan?"),
        content: const Text("Pesan yang dihapus tidak dapat dikembalikan."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              ref.read(chatProvider.notifier).deleteMessage(index);
              Navigator.pop(context);
            },
            child: const Text("Hapus", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = AppTheme.primaryBlue;
    const Color accentOrange = AppTheme.primaryOrange;

    final messages = ref.watch(chatProvider);

    return Scaffold(
      backgroundColor: Colors.white, // Putih Bersih[cite: 16]
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/4712/4712035.png',
              width: 35,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("KEBOT", style: AppTheme.sectionTitle(fontSize: 16)),
                Text("AI TALENT SCOUT", style: AppTheme.label(fontSize: 9, color: accentOrange)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final chat = messages[index];
                return GestureDetector(
                  onLongPress: () => _confirmDelete(index),
                  child: _buildChatBubble(
                    chat['text'],
                    isBot: chat['isBot'],
                    time: chat['time'],
                    color: chat['isBot'] ? accentOrange : primaryBlue,
                    isSkillDetected: chat['isSkillDetected'],
                  ),
                );
              },
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, {required bool isBot, required String time, required Color color, bool isSkillDetected = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
                bottomLeft: isBot ? Radius.zero : const Radius.circular(15),
                bottomRight: isBot ? const Radius.circular(15) : Radius.zero,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isSkillDetected)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lightbulb, color: Colors.white, size: 14),
                        SizedBox(width: 5),
                        Text("SKILL TERDETEKSI", style: AppTheme.label(fontSize: 10, color: Colors.white)),
                      ],
                    ),
                  ),
                Text(text, style: AppTheme.body(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text("${isBot ? 'KEBOT' : 'ANDA'} • $time", style: AppTheme.label(fontSize: 9, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _chatController,
                decoration: InputDecoration(hintText: "Ketik di sini...", border: InputBorder.none, hintStyle: AppTheme.body(fontSize: 14)),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _sendMessage,
            child: const CircleAvatar(
              backgroundColor: Color(0xFF5D4037), // Warna cokelat tombol[cite: 16]
              child: Icon(Icons.send, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}