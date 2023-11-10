import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/dynamic_links.dart';
import '../../../../core/common/session_data.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/widgets/blur_widget.dart';
import '../../../../core/ui/widgets/route_aware_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../chat/screen/chat_screen.dart';
import '../../../profile/presentation/screen/profile_screen.dart';
import 'explore_screen.dart';
import 'home_screen/home_screen.dart';
import 'more_screen.dart';

class NavigatorScreen extends StatefulWidget {
  static const String routeName = "NavigatorScreen/";
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends RouteAwareState<NavigatorScreen> {
  late List<Widget> _pages;
  late PageController _pageController;
  int _selectedPage = 0;
  GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');
  bool _inScreen = true;

  @override
  void initState() {
    super.initState();
    if (Provider.of<SessionDataProvider>(context, listen: false)
            .sharedStoryId !=
        null) {
      _selectedPage = 2;
      _pageController = PageController(initialPage: 2);
    } else
      _pageController = PageController();
    _pages = [
      HomeScreen(),
      ChatView(),
      const ExploreScreen(),
      const ProfileScreen(),
      const MoreScreen()
    ];

    DynamicLinkService dynamicLinkService = DynamicLinkService();
    dynamicLinkService.fetchLinkData(onHandle: (id) {
      _onDynamicLinkExists(id);
    });
  }

  Widget _buildBottomNavigationBar() {
    List<String> titles = [
      Translation.of(context).homePage,
      Translation.of(context).mail,
      Translation.of(context).search,
      Translation.of(context).profile,
      Translation.of(context).more
    ];
    List<dynamic> icons = [
      AppConstants.HOME_ICON,
      AppConstants.MAIL_ICON,
      AppConstants.SEARCH_ICON,
      AppConstants.PROFILE_ICON,
      Icons.more_horiz
    ];
    return SizedBox(
      width: 1.sw,
      height: 66.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlurWidget(
              borderRadius: AppConstants.borderRadius12,
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: AppColors.transparent),
              child: BottomNavigationBar(
                key: globalKey,
                backgroundColor: AppColors.red,
                currentIndex: _selectedPage,
                showUnselectedLabels: true,
                elevation: 0.0,
                iconSize: 18.w,
                selectedLabelStyle: TextStyle(
                    fontSize: AppConstants.textSize12,
                    fontWeight: FontWeight.bold),
                selectedItemColor: AppColors.accentColorLight,
                items: List.generate(
                    5,
                    (index) => BottomNavigationBarItem(
                        icon: Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: icons[index] is IconData
                                ? Icon(icons[index])
                                : ImageIcon(AssetImage(icons[index]))),
                        label: titles[index])),
                onTap: (value) {
                  _onItemTapped(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      //
      //
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    });
  }

  void _onDynamicLinkExists(String? id) {
    Provider.of<SessionDataProvider>(context, listen: false).sharedStoryId = id;

    if (_inScreen) {
      _onItemTapped(2);
      print('nnnav');
    } else {
      Nav.off(NavigatorScreen.routeName, cleanHistory: true, context: context);
      print('nnnot');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _selectedPage = value;
                });
              },
              children: _pages,
            ),
          ),
          Positioned(bottom: 28.h, child: _buildBottomNavigationBar()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void onEnterScreen() {
    // TODO: implement onEnterScreen
  }

  @override
  void onLeaveScreen() {
    print('nnnnext');
    setState(() {
      _inScreen = false;
    });
  }
}
