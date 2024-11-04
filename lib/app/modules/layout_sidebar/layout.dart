// import 'package:construx/images.dart';
import 'package:flutter/material.dart';
import 'package:construx_beta/app/modules/helper/utils/reso.dart';
import 'package:construx_beta/app/modules/helper/utils/color.dart';
import 'package:construx_beta/app/modules/helper/utils/my_shadow.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_card.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:construx_beta/app/modules/layout_sidebar/left_bar.dart';
import 'package:construx_beta/app/modules/layout_sidebar/rightmenu.dart';
import 'package:construx_beta/app/modules/helper/theme/app_style.dart';
import 'package:construx_beta/app/modules/helper/theme/app_theme.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_text.dart';
import 'package:construx_beta/app/modules/layout_sidebar/right_bar.dart';
import 'package:construx_beta/app/modules/helper/widgets/custom_pop_menu.dart';

import 'package:construx_beta/app/modules/helper/theme/admin_theme.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_button.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_spacing.dart';
import 'package:construx_beta/app/modules/helper/widgets/responsive.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_container.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_responsiv.dart';


import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:construx_beta/app/modules/helper/theme/theme_customizer.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_dashed_divider.dart';
import 'package:construx_beta/app/modules/layout_sidebar/controller/layout_controller.dart';

class Layout extends StatelessWidget {
  final Widget? child;
  final Widget menuItem;
  final String menuName, menuSubName;

  final LayoutController controller = LayoutController();
  final topBarTheme = AdminTheme.theme.topBarTheme;
  final contentTheme = AdminTheme.theme.contentTheme;

  Layout({
    super.key,
    this.child,
    required this.menuItem,
    required this.menuName,
    required this.menuSubName,
  });

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context, _, screenMT) {
      return GetBuilder(
          init: controller,
          builder: (controller) {
            return screenMT.isMobile ? mobileScreen() : largeScreen();
          });
    });
  }

  Widget mobileScreen() {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              ThemeCustomizer.setTheme(
                  ThemeCustomizer.instance.theme == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark);
            },
            child: Icon(
              ThemeCustomizer.instance.theme == ThemeMode.dark
                  ? FeatherIcons.sun
                  : FeatherIcons.moon,
              size: 18,
              color: topBarTheme.backroundDark,
            ),
          ),
          MySpacing.width(8),
          CustomPopupMenu(
            backdrop: true,
            onChange: (_) {},
            offsetX: -180,
            menu: Padding(
              padding: MySpacing.xy(8, 8),
              child: const Center(
                child: Icon(
                  FeatherIcons.bell,
                  size: 18,
                ),
              ),
            ),
            menuBuilder: (_) => buildNotifications(),
          ),
          MySpacing.width(8),
          CustomPopupMenu(
            backdrop: true,
            onChange: (_) {},
            offsetX: -90,
            offsetY: 4,
            menu: Padding(
              padding: MySpacing.xy(8, 8),
              // child: MyContainer.rounded(
              //     paddingAll: 0,
              //     child: Image.asset(
              //       Images.avatars[0],
              //       height: 28,
              //       width: 28,
              //       fit: BoxFit.cover,
              //     )),
            ),
            menuBuilder: (_) => buildAccountMenu(),
          ),
          MySpacing.width(20)
        ],
      ), // endDrawer: RightBar(),
      // extendBodyBehindAppBar: true,
      // appBar: TopBar(
      drawer: const LeftBar(),
      body: SingleChildScrollView(
        key: controller.scrollKey,
        child: child,
      ),
    );
  }

  Widget largeScreen() {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: ColorsCustom.backgroundScaffold,
      endDrawer: const RightBar(),
      body: Row(
        children: [
          //LeftBar(isCondensed: ThemeCustomizer.instance.leftBarCondensed),
          Expanded(
              child: Stack(
            children: [
              Container(
                color: const Color(0xFFF1F4F8),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  padding: MySpacing.fromLTRB(
                      controller.minimize
                          ? Reso.width10 * 12.7
                          : Reso.width10 * 32,
                      Reso.height10 * 2,
                      0,
                      flexSpacing),
                  key: controller.scrollKey,
                  child: child,
                ),
              ),
              Row(
                children: [
                  LeftBar(
                      isCondensed: ThemeCustomizer.instance.leftBarCondensed),
                  menuSide()
                ],
              ),
              //const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
            ],
          )),
          const RightMenu()
        ],
      ),
    );
  }

  Widget menuSide() {
    return GetBuilder<LayoutController>(builder: (pageview) {
      return Container(
        color: ColorsCustom.backgroundScaffold,
        child: Padding(
          padding: EdgeInsets.only(top: Reso.height10, bottom: Reso.height10),
          child: MyCard(
              paddingAll: 0,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18)),
              shadow: MyShadow(
                  position: MyShadowPosition.centerRight, elevation: 0.2),
              child: AnimatedContainer(
                  width: pageview.expandClick
                      ? Reso.width10 * 4.5
                      : Reso.width10 * 32,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: ColorsCustom.themeSideBlack2),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18)),
                    color: ColorsCustom.themeSideBlack2,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        physics: const PageScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            pageview.expandClick
                                ? GestureDetector(
                                    onTap: () {
                                      pageview.changeExpand();
                                    },
                                    child: pageview.expandClick
                                        ? const Icon(
                                            LucideIcons.arrowRightCircle,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        : const Icon(
                                            LucideIcons.arrowLeftCircle,
                                            color: Colors.white,
                                            size: 20,
                                          ))
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              MyText.bodySmall(
                                                menuName,
                                                textAlign: TextAlign.center,
                                                color: ColorsCustom.textWhite,
                                                maxLines: 1,
                                                fontSize: 12,
                                              ),
                                              const Icon(
                                                LucideIcons.chevronRight,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                              Expanded(
                                                child: MyText.bodySmall(
                                                  menuSubName,
                                                  textAlign: TextAlign.left,
                                                  color: ColorsCustom.textWhite,
                                                  maxLines: 1,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: GestureDetector(
                                            onTap: () {
                                              pageview.changeExpand();
                                            },
                                            child: pageview.expandClick
                                                ? const Icon(
                                                    LucideIcons
                                                        .arrowRightCircle,
                                                    color: Colors.white,
                                                    size: 20,
                                                  )
                                                : const Icon(
                                                    LucideIcons.arrowLeftCircle,
                                                    color: Colors.white,
                                                    size: 20,
                                                  )),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            SizedBox(
                              child:
                                  pageview.expandClick ? Container() : menuItem,
                            )
                          ],
                        ),
                      ))
                    ],
                  ))),
        ),
      );
    });
  }

  Widget buildNotifications() {
    Widget buildNotification(String title, String description) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.labelLarge(title),
          MySpacing.height(4),
          MyText.bodySmall(description)
        ],
      );
    }

    return MyContainer.bordered(
      paddingAll: 0,
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(16, 12),
            child: MyText.titleMedium("Notification", fontWeight: 600),
          ),
          MyDashedDivider(
              height: 1, color: theme.dividerColor, dashSpace: 4, dashWidth: 6),
          Padding(
            padding: MySpacing.xy(16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNotification("Your order is received",
                    "Order #1232 is ready to deliver"),
                MySpacing.height(12),
                buildNotification("Account Security ",
                    "Your account password changed 1 hour ago"),
              ],
            ),
          ),
          MyDashedDivider(
              height: 1, color: theme.dividerColor, dashSpace: 4, dashWidth: 6),
          Padding(
            padding: MySpacing.xy(16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton.text(
                  onPressed: () {},
                  splashColor: contentTheme.primary.withAlpha(28),
                  child: MyText.labelSmall(
                    "View All",
                    color: contentTheme.primary,
                  ),
                ),
                MyButton.text(
                  onPressed: () {},
                  splashColor: contentTheme.danger.withAlpha(28),
                  child: MyText.labelSmall(
                    "Clear",
                    color: contentTheme.danger,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildAccountMenu() {
    return MyContainer.bordered(
      paddingAll: 0,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyButton(
                  onPressed: () => {},
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  borderRadiusAll: AppStyle.buttonRadius.medium,
                  padding: MySpacing.xy(8, 4),
                  splashColor: theme.colorScheme.onSurface.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(
                        FeatherIcons.user,
                        size: 14,
                        color: contentTheme.backroundDark,
                      ),
                      MySpacing.width(8),
                      MyText.labelMedium(
                        "My Account",
                        fontWeight: 600,
                      )
                    ],
                  ),
                ),
                MySpacing.height(4),
                MyButton(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () => {},
                  borderRadiusAll: AppStyle.buttonRadius.medium,
                  padding: MySpacing.xy(8, 4),
                  splashColor: theme.colorScheme.onSurface.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(
                        FeatherIcons.settings,
                        size: 14,
                        color: contentTheme.backroundDark,
                      ),
                      MySpacing.width(8),
                      MyText.labelMedium(
                        "Settings",
                        fontWeight: 600,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: MySpacing.xy(8, 8),
            child: MyButton(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () => {},
              borderRadiusAll: AppStyle.buttonRadius.medium,
              padding: MySpacing.xy(8, 4),
              splashColor: contentTheme.danger.withAlpha(28),
              backgroundColor: Colors.transparent,
              child: Row(
                children: [
                  Icon(
                    FeatherIcons.logOut,
                    size: 14,
                    color: contentTheme.danger,
                  ),
                  MySpacing.width(8),
                  MyText.labelMedium(
                    "Log out",
                    fontWeight: 600,
                    color: contentTheme.danger,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
