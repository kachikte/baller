import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateProvider((ref) => 0);
final secProvider = StateProvider((ref) => 30);
final passwordCreatedProvider = StateProvider((ref) => false);
final isIndividualAccountTypeProvider = StateProvider((ref) => '');
final isPinEditProvider = StateProvider((ref) => false);
final switchOnProvider = StateProvider((ref) => false);
