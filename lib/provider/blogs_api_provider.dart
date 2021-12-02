import 'package:flutter_miniproject/api/fake_blog_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initialMealProvider = Provider<FakeMealAPI>((ref) {
  return FakeMealAPI();
});

class FakeMealAPI {
  final dummydata = InitialDummyMeals();
}
