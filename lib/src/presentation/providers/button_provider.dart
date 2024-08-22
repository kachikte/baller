import 'package:baller/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonProvider = StateProvider((ref) => true);

final bookingsTabProvider = StateProvider((ref) => Constants.upcomingBookings);
