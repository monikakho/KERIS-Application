// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/user_provider.dart';
import 'akun.dart';
import 'banner.dart';
import 'privacy.dart';
import 'faq.dart';
import '../../widgets/keris_app_bar.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';
import '../../models/user_model.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider); // Membaca data user

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: const KerisAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Pengaturan', style: AppTheme.pageTitle(fontSize: 32)),
              const SizedBox(height: 24),

              // Widget Profil menggunakan data dari Riverpod
              userAsync.when(
                data: (user) => user != null ? _buildProfileCard(user) : const SizedBox(),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Error: $e'),
              ),

              const SizedBox(height: 32),
              _buildSectionTitle('UMUM'),
              const SizedBox(height: 12),
              _buildMenuCard([
                _buildMenuItem(Icons.person_outline, 'Akun', 'Kelola informasi pribadi',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditAkunPage()))),
                _buildDivider(),
                _buildMenuItem(
                    Icons.workspace_premium_outlined, 'Banner', 'Galeri pencapaian',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BannerPage()))),
              ]),

              const SizedBox(height: 32),
              _buildSectionTitle('DUKUNGAN & LEGAL'),
              const SizedBox(height: 12),
              _buildMenuCard([
                _buildMenuItem(Icons.shield_outlined, 'Kebijakan Privasi', null,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyPage()))),
                _buildDivider(),
                _buildMenuItem(Icons.help_outline, 'Pusat Bantuan', null,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpSupportPage()))),
              ]),
              const SizedBox(height: 40),
              
              // Masukkan context ke dalam fungsi logout agar navigasi bekerja
              _buildLogoutButton(context, ref), 
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(UserModel user) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: const Color(0xFFF0F0FF),
            // Gunakan errorBuilder atau fallback jika asset gagal dimuat
            backgroundImage: user.profileImageUrl != null
                ? NetworkImage(user.profileImageUrl!) as ImageProvider
                : const AssetImage('assets/image/farhan_kebab.png'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.username, style: AppTheme.sectionTitle(fontSize: 18, color: AppTheme.primaryBlue)),
                Text(user.email, style: AppTheme.body(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                      color: const Color(0xFFE8EFFF),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(user.role.toUpperCase(), style: AppTheme.label(color: AppTheme.primaryBlue, fontSize: 11)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildSectionTitle(String title) => Text(title, style: AppTheme.label(fontSize: 13, color: Colors.grey));

  Widget _buildMenuCard(List<Widget> children) => Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(children: children));

  Widget _buildMenuItem(IconData icon, String title, String? subtitle,
          {VoidCallback? onTap}) =>
      ListTile(
          onTap: onTap,
          leading: Icon(icon, color: AppTheme.primaryBlue),
          title: Text(title, style: AppTheme.sectionTitle(fontSize: 16, color: AppTheme.primaryBlue)),
          subtitle: subtitle != null ? Text(subtitle, style: AppTheme.body(fontSize: 12, color: Colors.grey)) : null,
          trailing: const Icon(Icons.chevron_right));

  Widget _buildDivider() =>
      const Divider(height: 1, indent: 70, color: Color(0xFFF0F2F5));

  // Fungsi Logout
  Widget _buildLogoutButton(BuildContext context, WidgetRef ref) => SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
          onPressed: () async {
            // Logika logout Firebase
            await ref.read(authServiceProvider).logout();
            // main.dart authStateChanges akan otomatis redirect ke LoginPage,
            // tidak perlu manual pushAndRemoveUntil.
          },
          icon: const Icon(Icons.logout, color: Color(0xFFE57373)),
          label: Text('Keluar', style: AppTheme.button(color: const Color(0xFFB71C1C))),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFEBEE),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))));
}