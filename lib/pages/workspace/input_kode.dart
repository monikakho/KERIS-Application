import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/enroll_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/keris_app_bar.dart';
import '../../core/theme/app_theme.dart';

class InputKodePage extends ConsumerStatefulWidget {
  const InputKodePage({super.key});

  @override
  ConsumerState<InputKodePage> createState() => _InputKodePageState();
}

class _InputKodePageState extends ConsumerState<InputKodePage> {
  String _selectedJalur = 'Web Development';
  final TextEditingController _kodeController = TextEditingController();

  final List<String> _jalurOptions = [
    'Web Development',
    'Mobile Development',
    'Artificial Intelligence',
  ];
  
  bool _isLoading = false;

  @override
  void dispose() {
    _kodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KerisAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            // --- Scrollable Content ---
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildHeaderLabels(),
                    const SizedBox(height: 28),

                    // Dropdown Pemilihan Jalur
                    _buildSelectionCard(
                      title: "PILIH JALURMU",
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedJalur,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: _jalurOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value, 
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() => _selectedJalur = newValue);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Input Field Kode
                    _buildSelectionCard(
                      title: "MASUKKAN KODE",
                      child: TextField(
                        controller: _kodeController,
                        decoration: const InputDecoration(
                          hintText: "CONTOH : WEB-DEV-2026",
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.link, size: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // --- TOMBOL MASUK ---
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : () async {
                          final inputCode = _kodeController.text.trim();
                          
                          if (inputCode.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Kode tidak boleh kosong!"), backgroundColor: Colors.orange),
                            );
                            return;
                          }

                          setState(() => _isLoading = true);
                          
                          try {
                            final enrollService = ref.read(enrollServiceProvider);
                            final currentUser = ref.read(authServiceProvider).getCurrentUser();

                            if (currentUser == null) {
                              throw Exception('Sesi telah berakhir, silakan login ulang.');
                            }

                            // 1. Validasi Kode ke Firestore berdasarkan ID dokumen kode
                            final codeData = await enrollService.validateEnrollCode(inputCode, _selectedJalur);
                            
                            if (codeData != null) {
                              // 2. Kode valid, jalankan proses pendaftaran
                              await enrollService.enrollUser(
                                currentUser.uid, 
                                codeData['id'], 
                                inputCode, 
                                _selectedJalur
                              );
                              
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Enrollment Berhasil!"), backgroundColor: Colors.green),
                                );
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              }
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Kode enroll salah atau program tidak cocok!"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Gagal: $e"), backgroundColor: Colors.red),
                              );
                            }
                          } finally {
                            if (mounted) setState(() => _isLoading = false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF47B20),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: _isLoading 
                          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Masuk", 
                                  style: AppTheme.button(color: Colors.white, fontSize: 15),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Teks bantuan murni tanpa fungsi backdoor / seeding tersembunyi
                    Center(
                      child: Text(
                        "Bantuan & Dukungan", 
                        style: AppTheme.label(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    
                    const SizedBox(height: 36),
                    _buildFeatureInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Sub-Widgets pembantu UI ---

  Widget _buildHeaderLabels() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "KERIS",
          style: AppTheme.label(fontSize: 12, color: AppTheme.primaryOrange),
        ),
        Text(
          "Ruang Belajar",
          style: AppTheme.pageTitle(fontSize: 36),
        ),
        const SizedBox(height: 12),
        Text(
          "Pintu gerbang menuju keahlian baru. Pilih kurikulum terbaik dan mulai petualangan belajarmu hari ini.",
          style: AppTheme.body(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSelectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB), 
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, 
            style: AppTheme.label(fontSize: 11, color: const Color(0xFF6B7280)),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureInfo() {
    return Column(
      children: [
        _buildFeatureItem(Icons.settings_outlined, "Completion Banner", "Setiap penyelesaian jalur belajar memberikan banner menarik."),
        const SizedBox(height: 28),
        _buildFeatureItem(Icons.chat_bubble_outline, "Forum Mentoring", "Dapatkan bantuan langsung dari praktisi industri."),
        const SizedBox(height: 28),
        _buildFeatureItem(Icons.access_time, "Update Berkala", "Materi selalu diperbarui mengikuti tren teknologi."),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44, 
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle, 
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5),
          ),
          child: Icon(icon, color: const Color(0xFF0D285F), size: 22),
        ),
        const SizedBox(width: 16), 
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, 
                style: AppTheme.sectionTitle(fontSize: 16),
              ),
              const SizedBox(height: 6),
              Text(
                description, 
                style: AppTheme.body(fontSize: 13, color: const Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}