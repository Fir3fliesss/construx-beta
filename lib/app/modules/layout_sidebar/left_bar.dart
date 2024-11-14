import 'package:flutter/material.dart';
import 'package:construx_beta/app/modules/helper/utils/reso.dart';
// import '../../helpers/utils/assets.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:construx_beta/app/modules/helper/utils/color.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:construx_beta/app/modules/helper/utils/my_shadow.dart';
import 'package:construx_beta/app/modules/helper/utils/ui_mixins.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_card.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_text.dart';
import 'package:construx_beta/app/modules/layout_sidebar/menu_side_a.dart';
import 'package:construx_beta/app/modules/layout_sidebar/controller/layout_controller.dart';
import 'package:construx_beta/app/modules/helper/utils/string.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_spacing.dart';
import 'package:construx_beta/app/modules/helper/services/url_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:construx_beta/app/modules/helper/theme/theme_customizer.dart';

typedef LeftbarMenuFunction = void Function(String key);

class LeftbarObserver {
  static Map<String, LeftbarMenuFunction> observers = {};

  static attachListener(String key, LeftbarMenuFunction fn) {
    observers[key] = fn;
  }

  static detachListener(String key) {
    observers.remove(key);
  }

  static notifyAll(String key) {
    for (var fn in observers.values) {
      fn(key);
    }
  }
}

class LeftBar extends StatefulWidget {
  final bool isCondensed;

  const LeftBar({Key? key, this.isCondensed = false}) : super(key: key);

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar>
    with SingleTickerProviderStateMixin, UIMixin {
  final ThemeCustomizer customizer = ThemeCustomizer.instance;

  bool isCondensed = false;
  String path = UrlService.getCurrentUrl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isCondensed = widget.isCondensed;
    return Container(
      color: ColorsCustom.backgroundScaffold,
      child: Padding(
        padding: EdgeInsets.only(
            top: Reso.height10, left: Reso.width10, bottom: Reso.height10),
        child: MyCard(
          paddingAll: 0,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
          shadow:
              MyShadow(position: MyShadowPosition.centerRight, elevation: 0.2),
          child: AnimatedContainer(
            width: isCondensed ? Reso.width10 * 7.7 : Reso.width10 * 26.8,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: ColorsCustom.themeSideBlack),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18)),
              color: ColorsCustom.themeSideBlack,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Reso.width10 * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<LayoutController>(builder: (controller) {
                    return SizedBox(
                      height: 70,
                      child: InkWell(
                        onTap: () {
                          ThemeCustomizer.toggleLeftBarCondensed();
                          controller.changeMinimize();
                        },
                        child: widget.isCondensed
                            ?  Center(
                                child: Image.asset(
                                  'assets/images/logo2min.png',
                                  height: 40,
                                  // width: Dimension.height20 * 10,
                                ),
                              )
                            :  Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/images/logo-construx.png',
                                    height: 40,
                                    width: 90,
                                  ),
                                  Icon(
                                    Icons.menu,
                                    color: ColorsCustom.buttonWhite,
                                  ),
                                ],
                              ),
                      ),
                    );
                  }),
                  //Select Project
                  widget.isCondensed
                      ? Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: ColorsCustom.buttonGrey,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: MyText.bodySmall(
                            "P1",
                            textAlign: TextAlign.center,
                            color: ColorsCustom.textWhite,
                            fontSize: 12,
                          )),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: ColorsCustom.buttonGrey,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: MyText.bodySmall(
                                  "Select Project",
                                  textAlign: TextAlign.left,
                                  color: ColorsCustom.textWhite,
                                  fontSize: 12,
                                )),
                                const SizedBox(width: 10),
                                const Icon(
                                  Symbols.arrow_forward_ios,
                                  color: ColorsCustom.buttonWhite,
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: SingleChildScrollView(
                    physics: const PageScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NavigationItemCustom(
                        //   iconData: maps,
                        //   title: "Project Maps".tr(),
                        //   isCondensed: isCondensed,
                        //   route: '',
                        // ),
                        // // labelWidget("apps".tr()),
                        MenuWidgetUtils(
                          iconData: LucideIcons.slidersHorizontal,
                          isCondensed: isCondensed,
                          title: "Utilization",
                          children: [
                            MenuItemUtils(
                              title: "Use Case".tr(),
                              subtitle: "Project Owner",
                              route: '',
                              isCondensed: widget.isCondensed,
                            ),
                            MenuItemUtils(
                              title: "User".tr(),
                              subtitle: "Portofolio User",
                              route: '',
                              isCondensed: widget.isCondensed,
                            ),
                            MenuItemUtils(
                              title: "Object".tr(),
                              subtitle: "All",
                              route: '',
                              isCondensed: widget.isCondensed,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        //Dashboard
                        GetBuilder<LayoutController>(builder: (dashboard) {
                          return MenuWidgetDrawer(
                            iconData: LucideIcons.settings,
                            isCondensed: isCondensed,
                            title: "Basic Settings",
                            children: [
                              MenuItemDrawer(
                                title: "Company Information".tr(),
                                route: '/company-information',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Permission Settings".tr(),
                                route: '/permission-settings',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "User Management".tr(),
                                route: '/user-management',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Commdity Category".tr(),
                                route: '/commodity-category',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Commdity Management".tr(),
                                route: '/commodity-management',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Supplier Info".tr(),
                                route: '/supplier-info',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Warehouse Settings".tr(),
                                route: '/warehouse-settings',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Owner Information".tr(),
                                route: '/owner-information',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Freight Settings".tr(),
                                route: '/freight-setting',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Customer Info".tr(),
                                route: '/customer-info',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Print Settings".tr(),
                                route: '/print-settings ',
                                isCondensed: widget.isCondensed,
                              ),
                            ],
                          );
                        }),
                        const SizedBox(height: 10),
                        NavigationItem(
                          iconData: LucideIcons.boxes,
                          title: "Receiving\nManagement".tr(),
                          isCondensed: isCondensed,
                          route: '/receiving-management',
                        ),
                        const SizedBox(height: 10),
                        NavigationItem(
                          iconData: LucideIcons.warehouse,
                          title: "Stock Management".tr(),
                          isCondensed: isCondensed,
                          route: '/stock-management',
                        ),
                        const SizedBox(height: 10),
                        GetBuilder<LayoutController>(builder: (task) {
                          return MenuWidgetDrawer(
                            iconData: LucideIcons.pieChart,
                            isCondensed: isCondensed,
                            title: "Statistic Analystic",
                            children: [
                              MenuItemDrawer(
                                title: "Safety Stock".tr(),
                                route: '/safety-stock',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Receiving Statistics".tr(),
                                route: '/receiving-statistics',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Shipment Statistics".tr(),
                                route: '/shipment-statistics',
                                isCondensed: widget.isCondensed,
                              ),
                            ],
                          );
                        }),
                         const SizedBox(height: 10),
                        GetBuilder<LayoutController>(builder: (task) {
                          return MenuWidgetDrawer(
                            iconData: LucideIcons.hardHat,
                            isCondensed: isCondensed,
                            title: "Warehouse Working",
                            children: [
                              MenuItemDrawer(
                                title: "Warehouse Processing".tr(),
                                route: '/warehouse-processing',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Inventory Move".tr(),
                                route: '/inventory-move',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Inventory freeze".tr(),
                                route: '/inventory-freeze',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Inventory adjust".tr(),
                                route: '/inventory-adjust',
                                isCondensed: widget.isCondensed,
                              ),
                              MenuItemDrawer(
                                title: "Inventory Take".tr(),
                                route: '/inventory-take',
                                isCondensed: widget.isCondensed,
                              ),
                            ],
                          );
                        }),
                        const SizedBox(height: 10),
                        NavigationItem(
                          iconData: LucideIcons.packageCheck,
                          title: "Delivery Management".tr(),
                          isCondensed: isCondensed,
                          route: '/delivery-management',
                        ),
                        const SizedBox(height: 10),
                        NavigationItem(
                          iconData: LucideIcons.mapPin,
                          title: "Visual Warehouse".tr(),
                          isCondensed: isCondensed,
                          route: '/visual-warehouse',
                        ),
                        // NavigationItemCustom(
                        //   iconData: job,
                        //   title: "Project Management Dashboard".tr(),
                        //   route: '/project_manage',
                        //   isCondensed: isCondensed,
                        // ),
                        // MenuWidgetCustom(
                        //   iconData: conIcon,
                        //   isCondensed: isCondensed,
                        //   title: "Construction Management".tr(),
                        //   children: [
                        //     MenuItem(
                        //       title: "Dashboard".tr(),
                        //       route: '/construction_manage',
                        //       isCondensed: widget.isCondensed,
                        //     ),
                        //     MenuItem(
                        //       title: "Schedule Report".tr(),
                        //       route: '/schedule_report',
                        //       isCondensed: widget.isCondensed,
                        //     ),
                        //     MenuItem(
                        //       title: "Quality Report".tr(),
                        //       route: '/quality_report',
                        //       isCondensed: widget.isCondensed,
                        //     ),
                        //     MenuItem(
                        //       title: "Document Record".tr(),
                        //       route: 'document_record',
                        //       isCondensed: widget.isCondensed,
                        //     ),

                        //   ],
                        // ),
                      ],
                    ),
                  )),
                  const SizedBox(height: 10),
                  NavigationItem(
                    iconData: LucideIcons.helpCircle,
                    title: "Help & Centre".tr(),
                    isCondensed: isCondensed,
                    route: '',
                  ),
                  const SizedBox(height: 10),
                  NavigationItem(
                    iconData: LucideIcons.settings,
                    title: "Settings".tr(),
                    isCondensed: isCondensed,
                    route: '',
                  ),
                  const SizedBox(height: 10),
                  NavigationLogOut(
                    iconData: LucideIcons.logOut,
                    title: "Log Out".tr(),
                    isCondensed: isCondensed,
                    route: '',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget labelWidget(String label) {
    return isCondensed
        ? MySpacing.empty()
        : Container(
            padding: MySpacing.xy(24, 8),
            child: MyText.labelSmall(
              label.toUpperCase(),
              color: leftBarTheme.labelColor,
              muted: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontWeight: 700,
            ),
          );
  }
}
