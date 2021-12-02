import 'package:flutter/cupertino.dart';
import 'package:flutter_miniproject/api/fake_blog_api.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:flutter_miniproject/provider/blogs_api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final blogProvider = ChangeNotifierProvider<BlogsNotifier>((ref) {
  final initialdata = ref.watch(initialMealProvider).dummydata;
  return BlogsNotifier(blog: initialdata);
});

class BlogsNotifier extends ChangeNotifier {
  final InitialDummyMeals blog;

  List<Meal> _mealList = [];

  BlogsNotifier({
    required this.blog,
  });

  List<Meal> get mealList => _mealList;

  Future<List<Meal>> getBlogs() async {
    final data = await blog.initializeListBlog();

    _mealList = data;

    return _mealList;
  }

  Future<void> addBlog({required Meal newblog}) async {
    _mealList = [..._mealList, newblog];

    notifyListeners();
  }

  Future<void> deleteBlog({required String id}) async {
    _mealList.removeWhere((everyblog) => everyblog.id == id);

    notifyListeners();
  }

  Future<void> updateBlog({required Meal updatedBlog}) async {
//https://stackoverflow.com/questions/56283870/how-to-update-a-single-item-in-flutter-list-as-a-best-way/60678253

    _mealList[_mealList.indexWhere(
        (everyblog) => everyblog.id == updatedBlog.id)] = updatedBlog;

    notifyListeners();
  }
}
