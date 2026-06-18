// providers/enroll_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/enrollment_model.dart';
import '../services/enroll_service.dart';
import 'auth_provider.dart';

final enrollServiceProvider = Provider<EnrollService>((ref) {
  return EnrollService();
});

// Stream enrollment aktif berdasarkan user yang sedang login
final currentEnrollmentProvider = StreamProvider<EnrollmentModel?>((ref) {
  final authState = ref.watch(authStateProvider);
  final enrollService = ref.watch(enrollServiceProvider);

  return authState.when(
    data: (user) {
      if (user != null) {
        return enrollService.getUserActiveEnrollment(user.uid);
      }
      return Stream.value(null);
    },
    loading: () => Stream.value(null),
    error: (_, __) => Stream.value(null),
  );
});

// Provider sederhana untuk mengecek apakah user sudah enroll (true/false) secara sinkron
final isEnrolledProvider = Provider<bool>((ref) {
  final enrollment = ref.watch(currentEnrollmentProvider).value;
  return enrollment != null && enrollment.status == 'active';
});

// Provider untuk menyimpan jalur/program yang dipilih secara otomatis
final selectedTrackProvider = Provider<String>((ref) {
  final enrollment = ref.watch(currentEnrollmentProvider).value;
  return enrollment?.track ?? 'Web Development';
});