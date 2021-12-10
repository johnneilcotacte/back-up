import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/config/route.dart';
import 'package:flutter_miniproject/model/screen_argument.dart';
import 'package:flutter_miniproject/provider/current_user_provider.dart';
//import 'package:flutter_miniproject/module/meals_screens_components/add_meal_widget.dart';
import 'package:flutter_miniproject/provider/meal_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_miniproject/module/meals_screens_components/meal_item.dart';
import 'package:flutter_miniproject/provider/const_provider.dart';
import 'package:flutter_miniproject/model/meal.dart';

class AllMealsPage extends HookWidget {
  const AllMealsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(false);
    final _mealProvider = useProvider(mealProvider);
    final _user = useProvider(currentUserProvider);
    final _scrollController = useScrollController();
    int page = 0;
    //final _index = useState(0);
/////////////////////////////
    _loadMeals() async {
      _isLoading.value = true;

      try {
        await _mealProvider.getMeals(
            page: page,
            user_id: _user.user!.id!,
            access_token: _user.user!.access_token!);
      } on Exception catch (error) {
        print(error);
      }
      _isLoading.value = false;
    }

    bool _isAllLoaded() {
      int maxitem = _mealProvider.getTotalMeals();
      if (_mealProvider.mealList.length == maxitem) {
        return true;
      }
      return false;
    }

    useEffect(() {
      //  _loadMeals();
      page++;
      return;
    }, []);
    useEffect(() {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          if (!_isAllLoaded()) {
            _loadMeals();
            page++;
          }
        }
      });
    }, [_scrollController]);
//////////////////////////////////////////////
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TODO: Change Container Widget to SearchBarWidget
              Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                ),
                child: TextField(
                  //controller: controller,
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '${RouteGenerator.createmealRoute}',
                      arguments: ScreenArguments(null));
                },
                //color: Colors.blue
              ),
            ],
          ),
          Row(
            children: [
              Chip(
                label: Text('all'),
                backgroundColor: Colors.black.withOpacity(0.7),
              ),
              Chip(
                label: Text('breakfast'),
                backgroundColor: Colors.black.withOpacity(0.7),
              ),
              Chip(
                label: Text('lunch'),
                backgroundColor: Colors.black.withOpacity(0.7),
              ),
              Chip(
                label: Text('dinner'),
                backgroundColor: Colors.black.withOpacity(0.7),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: _mealProvider.mealList.length,
              itemBuilder: (ctx, i) =>
                  MealItem(meal: _mealProvider.mealList[i]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
