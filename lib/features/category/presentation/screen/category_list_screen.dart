import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/ui/error_ui/errors_screens/error_widget.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../notification/presentation/view/notification_screen.dart';
import '../state_m/cubit/category_cubit.dart';
import '../state_m/provider/category_list_screen_notifier.dart';
import 'category_list_screen_content.dart';

class CategoryListScreen extends StatefulWidget {
  static const String routeName = "/CategoryListScreen";

  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  late final sn = CategoryListScreenNotifier();
  List<TempTabBarItem> _tabs = [];

  @override
  void initState() {
    super.initState();
    _apiRequest();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? _path = Nav.getCurrentPath(context: context);
    if (_path != null) print('nnn' + _path);
    _tabs.add(
        TempTabBarItem(0, AppConstants.MALE_ICON, Translation.of(context).men));
    _tabs.add(TempTabBarItem(
        1, AppConstants.FEMALE_ICON, Translation.of(context).women));
    _tabs.add(TempTabBarItem(
        2, AppConstants.KID_ICON, Translation.of(context).under_16));
    sn.tabs = _tabs;
    return ChangeNotifierProvider<CategoryListScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).categories,
          actions: [
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                },
                child: const Icon(Icons.notifications)),
            Gaps.hGap20,
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                sn.showSearchField = !sn.showSearchField;
              },
              splashRadius: 20.w,
            ),
            Gaps.hGap12,
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<CategoryCubit, CategoryState>(
            bloc: sn.categoryCubit,
            builder: (context, state) {
              return state.map(
                categoryInitState: (value) => WaitingWidget(),
                categoryLoadingState: (value) => WaitingWidget(),
                categoryErrorState: (value) => ErrorScreenWidget(
                    error: value.error, callback: value.callback),
                getCategoriesState: (value) {
                  sn.setCategoriesLists(value.categoriesEntity);
                  return CategoryListScreenContent();
                },
              );
            }),
      ),
    );
  }

  void _apiRequest() {
    sn.categoryCubit.getCategories(NoParams());
  }
}
