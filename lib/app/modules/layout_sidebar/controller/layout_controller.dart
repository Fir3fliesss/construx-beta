import 'package:flutter/material.dart';
import 'package:construx_beta/app/modules/layout_sidebar/controller/my_controller.dart';
import 'package:construx_beta/app/modules/helper/theme/theme_customizer.dart';


class LayoutController extends MyController {
  ThemeCustomizer themeCustomizer = ThemeCustomizer();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> scrollKey = GlobalKey();

  // LayoutController() {
  //   save = false;
  // }

  bool minimize = false;
  changeMinimize() {
    minimize = !minimize;
    update();
  }

  //Side menu
  var pageControll = PageController();
  var tabIndex = 0;
  Future changeTabIndex(int index) async {
    if (index != tabIndex) {
      tabIndex = index;
      update();
    }
  }

  changePage(tabIndex) {
    pageControll.animateToPage(tabIndex,
        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  //sidemenu
  var expandClick = true;
  changeExpand() {
    expandClick = !expandClick;
    update();
  }

  @override
  void onInit() {
    //changeExpand();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    ThemeCustomizer.addListener(onChangeTheme);
  }

  void onChangeTheme(ThemeCustomizer oldVal, ThemeCustomizer newVal) {
    themeCustomizer = newVal;
    update();

    if (newVal.rightBarOpen) {
      scaffoldKey.currentState?.openEndDrawer();
    } else {
      scaffoldKey.currentState?.closeEndDrawer();
    }
  }

  enableNotificationShade() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  disableNotificationShade() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    super.dispose();
    ThemeCustomizer.removeListener(onChangeTheme);
    //changeExpand();
    //changePage(tabIndex);
  }
}
