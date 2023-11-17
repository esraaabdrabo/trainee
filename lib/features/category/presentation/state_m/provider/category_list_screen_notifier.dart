import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../domain/entity/categories_entity.dart';
import '../../../domain/entity/category_entity.dart';
import '../cubit/category_cubit.dart';
class CategoryListScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  CategoryCubit _categoryCubit = CategoryCubit();
  late TabController _tabController;
  late int _chosenTap = 0;
  bool _loading = false;
  List<CategoryEntity> _menCategories = [];
  List<CategoryEntity> _womenCategories = [];
  List<CategoryEntity> _under16Categories = [];
  List<CategoryEntity> _selectedType = [];
  List<CategoriesEntity> _displayLists = [];
  late List<TempTabBarItem> _tabs;
  bool _showSearchField = false;
  TextEditingController _searchController = TextEditingController();

  CategoryListScreenNotifier() {
    _searchController.addListener(() {
      search();
    });
  }

  /// Getters and Setters
  TabController get tabController => _tabController;

  set tabController(TabController value) {
    _tabController = value;
  }

  List<TempTabBarItem> get tabs => _tabs;

  int get chosenTap => _chosenTap;

  set chosenTap(int value) {
    _chosenTap = value;
  }

  set tabs(List<TempTabBarItem> value) {
    _tabs = value;
  }

  List<CategoryEntity> get selectedType => _selectedType;

  set selectedType(List<CategoryEntity> value) {
    _selectedType = value;

    notifyListeners();
  }

  bool get showSearchField => _showSearchField;

  set showSearchField(bool value) {
    _showSearchField = value;
    notifyListeners();
  }

  void selectType(int id) {
    if (id == 0) {
      selectedType = menCategories;
    } else if (id == 1)
      selectedType = womenCategories;
    else
      selectedType = under16Categories;

    setDisplayList(selectedType);
  }

  TextEditingController get searchController => _searchController;

  CategoryCubit get categoryCubit => _categoryCubit;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setCategoriesLists(CategoriesEntity categoriesEntity) {
    categoriesEntity.items?.forEach((element) {
      if (element.types == 0) menCategories.add(element);
      if (element.types == 1) womenCategories.add(element);
      if (element.types == 2) under16Categories.add(element);


    });
    selectType(0);
  }

  List<CategoryEntity> get menCategories => _menCategories;

  List<CategoryEntity> get womenCategories => _womenCategories;

  List<CategoryEntity> get under16Categories => _under16Categories;

  List<CategoriesEntity> get displayLists => _displayLists;

  void search() {
    List<CategoryEntity> _localCategories = [];
    if (searchController.text != '') {
      for (var element in selectedType) {
        if (element.name != null &&
                element.name!
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()) ||
            element.arName != null &&
                element.arName!
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()) ||
            element.enName != null &&
                element.enName!
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase())) {
          _localCategories.add(element);
        }
      }
    } else {
      _localCategories = selectedType;
    }

    setDisplayList(_localCategories);
  }

  void setDisplayList(List<CategoryEntity> categories) {
    displayLists.clear();
    int collections = categories.length ~/ 5;
    int fraction = categories.length % 5;
    if (fraction != 0) collections++;
    for (var count = 1; count <= collections; count++) {
      if (count < collections) {
        displayLists.add(CategoriesEntity(
            items: categories.getRange(5 * (count - 1), (5 * count)).toList()));
      } else {
      }
        displayLists.add(CategoriesEntity(
            items: categories
                .getRange(5 * (count - 1), categories.length)
                .toList()));
    }
    notifyListeners();
  }

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}

class TempTabBarItem {
  late int _id;
  late String _icon;
  late String _title;

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  TempTabBarItem(this._id, this._icon, this._title);
}
