import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/program_model.dart';

class ProgramDetailPage extends StatelessWidget {
  final ProgramModel program;

  const ProgramDetailPage({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderSection(),
                _buildStatsRow(),
                _buildDescriptionSection(),
                _buildHighlightsSection(),
                _buildModulesSection(),
                _buildToolsSection(),
                _buildMentorSection(),
                _buildEnrollButton(context),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- SLIVER APP BAR with Hero Image ---
  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      backgroundColor: program.accentColor,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              program.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(
                color: program.accentColor,
                child: const Icon(Icons.image, color: Colors.white38, size: 60),
              ),
            ),
            // Gradient overlay for readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    program.accentColor.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HEADER: Title & Subtitle ---
  Widget _buildHeaderSection() {
    // Memisahkan kata pertama dan sisanya agar bisa diberi warna berbeda
    List<String> titleParts = program.title.split(' ');
    String firstPart = titleParts.first;
    String lastPart = titleParts.sublist(1).join(' ');

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$firstPart ",
                  style: AppTheme.pageTitle(fontSize: 30).copyWith(
                    color: AppTheme.primaryBlue,
                  ),
                ),
                TextSpan(
                  text: lastPart,
                  style: AppTheme.pageTitle(fontSize: 30).copyWith(
                    color: program.accentColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            program.subtitle,
            style: AppTheme.body(fontSize: 15, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // --- STATS ROW: Duration, Level, Projects ---
  Widget _buildStatsRow() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: program.accentColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(Icons.schedule, program.duration, "Durasi"),
          _buildStatDivider(),
          _buildStatItem(Icons.trending_up, program.level, "Level"),
          _buildStatDivider(),
          _buildStatItem(Icons.folder_outlined, program.projects, "Proyek"),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: program.accentColor, size: 22),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppTheme.sectionTitle(fontSize: 12, color: AppTheme.primaryBlue),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTheme.body(fontSize: 11, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 35,
      width: 1,
      color: Colors.grey.withOpacity(0.2),
    );
  }

  // --- DESCRIPTION ---
  Widget _buildDescriptionSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("TENTANG PROGRAM", Icons.info_outline),
          const SizedBox(height: 12),
          Text(
            program.description,
            style: AppTheme.body(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // --- HIGHLIGHTS: What You Will Learn ---
  Widget _buildHighlightsSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 30,
                decoration: BoxDecoration(
                  color: program.accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Yang Akan Kamu Pelajari",
                style: AppTheme.sectionTitle(fontSize: 18, color: AppTheme.primaryBlue),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...program.highlights.map((item) => _buildHighlightItem(item)),
        ],
      ),
    );
  }

  Widget _buildHighlightItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: program.accentColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: program.accentColor,
              size: 14,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTheme.body(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // --- MODULES: Learning Path Timeline ---
  Widget _buildModulesSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("KURIKULUM", Icons.menu_book_outlined),
          const SizedBox(height: 18),
          ...List.generate(program.modules.length, (index) {
            final module = program.modules[index];
            final isLast = index == program.modules.length - 1;
            return _buildModuleItem(module, index + 1, isLast);
          }),
        ],
      ),
    );
  }

  Widget _buildModuleItem(LearningModule module, int number, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline column
          Column(
            children: [
              // Circle number
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: program.accentColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "$number",
                  style: AppTheme.sectionTitle(fontSize: 14, color: Colors.white),
                ),
              ),
              // Connecting line
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: program.accentColor.withOpacity(0.2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 15),
          // Card content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFEEEEEE)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: program.accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      module.icon,
                      color: program.accentColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module.title,
                          style: AppTheme.sectionTitle(
                            fontSize: 14,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          module.description,
                          style: AppTheme.body(fontSize: 12, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          module.weekRange,
                          style: AppTheme.label(
                            fontSize: 9,
                            color: program.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- TOOLS & TECHNOLOGIES ---
  Widget _buildToolsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("TOOLS & TEKNOLOGI", Icons.build_outlined),
          const SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: program.tools.map((tool) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Text(
                  tool,
                  style: AppTheme.sectionTitle(fontSize: 12, color: AppTheme.primaryBlue),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // --- MENTOR SECTION ---
  Widget _buildMentorSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E2C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[700],
            backgroundImage: AssetImage(program.mentorImage),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MENTOR",
                  style: AppTheme.label(fontSize: 9, color: program.accentColor),
                ),
                const SizedBox(height: 6),
                Text(
                  program.mentorName,
                  style: AppTheme.sectionTitle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  program.mentorRole,
                  style: AppTheme.body(fontSize: 12, color: Colors.white60),
                ),
              ],
            ),
          ),
          Icon(
            Icons.verified,
            color: program.accentColor,
            size: 28,
          ),
        ],
      ),
    );
  }

  // --- ENROLL BUTTON ---
  Widget _buildEnrollButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Pendaftaran ${program.title} akan segera dibuka!",
                  style: AppTheme.body(fontSize: 13, color: Colors.white),
                ),
                backgroundColor: program.accentColor,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: program.accentColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.play_arrow_rounded, size: 24),
              const SizedBox(width: 8),
              Text(
                "Daftar Program Ini",
                style: AppTheme.sectionTitle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER: Section Header ---
  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: program.accentColor, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTheme.label(fontSize: 11, color: program.accentColor),
        ),
      ],
    );
  }
}
