import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:construx_beta/app/modules/helper/utils/color.dart';
import 'package:construx_beta/app/modules/helper/utils/ui_mixins.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_text.dart';
// import 'package:construx_beta/app/modules/helper/widgets/custom_pop_menu.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_spacing.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_container.dart';
import 'package:construx_beta/app/modules/helper/services/url_service.dart';
import 'package:construx_beta/app/modules/layout_sidebar/left_bar.dart';
import 'package:construx_beta/app/modules/layout_sidebar/controller/layout_controller.dart';

//Dashboard
//Icon

class NavigationItemDashboard extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;
  //final int? indexMenu;

  const NavigationItemDashboard(
      {Key? key,
      this.iconData,
      required this.title,
      this.isCondensed = false,
      //this.indexMenu,
      this.route})
      : super(key: key);

  @override
  _NavigationItemDashboardState createState() =>
      _NavigationItemDashboardState();
}

class _NavigationItemDashboardState extends State<NavigationItemDashboard>
    with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GetBuilder<LayoutController>(builder: (menu) {
      return GestureDetector(
        onTap: () {
          if (widget.route != null) {
            Get.toNamed(widget.route!);
            //menu.changeTabIndex(widget.indexMenu!);
            // MyRouter.pushReplacementNamed(context, widget.route!, arguments: 1);
          }
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: MyContainer(
            margin: MySpacing.fromLTRB(0, 0, 0, 0),
            color: isActive || isHover
                ? Colors.transparent //ganti warna hover
                : Colors.transparent,
            padding: MySpacing.xy(8, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              // widget.isCondensed
              //     ? MainAxisAlignment.center
              //     : MainAxisAlignment.start,
              children: [
                Icon(
                  widget.iconData,
                  color: isHover || isActive
                      ? ColorsCustom.textWhite
                      : ColorsCustom.passiveTextColor,
                  size: 12,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: MySpacing.width(8),
                ),
                Expanded(
                  flex: 3,
                  child: MyText.bodySmall(widget.title,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      fontSize: 12,
                      letterSpacing: 0,
                      color: isHover || isActive
                          ? ColorsCustom.textWhite
                          : ColorsCustom.passiveTextColor),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

//DropDown
class MenuItemDashboardSide extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItemsDashboardSide> children;
  final String? route;

  const MenuItemDashboardSide(
      {super.key,
      required this.iconData,
      required this.title,
      this.isCondensed = false,
      this.active = false,
      this.children = const [],
      this.route});

  @override
  _MenuItemDashboardSideState createState() => _MenuItemDashboardSideState();
}

class _MenuItemDashboardSideState extends State<MenuItemDashboardSide>
    with UIMixin, SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isActive = false;
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeIn)));
    LeftbarObserver.attachListener(widget.title, onChangeMenuActive);
  }

  void onChangeMenuActive(String key) {
    if (key != widget.title) {
      // onChangeExpansion(false);
    }
  }

  void onChangeExpansion(value) {
    isActive = value;
    if (isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var route = UrlService.getCurrentUrl();
    isActive = widget.children.any((element) => element.route == route);
    onChangeExpansion(isActive);
    if (hideFn != null) {
      hideFn!();
    }
    // popupShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    // var route = Uri.base.fragment;
    // isActive = widget.children.any((element) => element.route == route);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: MyContainer.transparent(
        //color: isActive || isHover ? Colors.transparent : Colors.transparent,
        margin: MySpacing.fromLTRB(0, 0, 12, 0),
        borderRadius: BorderRadius.circular(6),
        paddingAll: 0,
        child: ListTileTheme(
          tileColor: isHover || isActive
              ? ColorsCustom.themeSideBlack2
              : ColorsCustom.themeSideBlack2,
          contentPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          dense: true,
          horizontalTitleGap: 0.0,
          minLeadingWidth: 0,
          child: ExpansionTile(
              tilePadding: const EdgeInsets.only(left: 8, right: 0),
              initiallyExpanded: isActive,
              maintainState: true,
              onExpansionChanged: (_) {
                LeftbarObserver.notifyAll(widget.title);
                onChangeExpansion(_);
              },
              trailing: RotationTransition(
                turns: _iconTurns,
                child: Icon(
                  LucideIcons.chevronDown,
                  size: 15,
                  color: isHover || isActive
                      ? ColorsCustom.textWhite
                      : ColorsCustom.passiveTextColor,
                ),
              ),
              iconColor: leftBarTheme.activeItemColor,
              childrenPadding: MySpacing.x(0),
              title: GestureDetector(
                onTap: () {
                  Get.toNamed(widget.route!);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: MyText.bodySmall(widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      fontSize: 12,
                      color: isHover || isActive
                          ? ColorsCustom.textWhite
                          : ColorsCustom.passiveTextColor),
                ),
              ),
              leading: Icon(widget.iconData,
                  size: 12,
                  color: isHover || isActive
                      ? ColorsCustom.textWhite
                      : ColorsCustom.passiveTextColor),
              collapsedBackgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent),
              ),
              backgroundColor: Colors.transparent,
              children: widget.children),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // LeftbarObserver.detachListener(widget.title);
  }
}

class MenuItemsDashboardSide extends StatefulWidget {
  final IconData? iconData;
  final String title;

  final bool isCondensed;
  final String? route;

  const MenuItemsDashboardSide({
    super.key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
  });

  @override
  _MenuItemsDashboardSideState createState() => _MenuItemsDashboardSideState();
}

class _MenuItemsDashboardSideState extends State<MenuItemsDashboardSide>
    with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GetBuilder<LayoutController>(builder: (menu) {
      return GestureDetector(
        onTap: () {
          if (widget.route != null) {
            Get.toNamed(widget.route!);
            // MyRouter.pushReplacementNamed(context, widget.route!, arguments: 1);
          }
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: MyContainer.transparent(
            margin: MySpacing.fromLTRB(8, 10, 8, 7),
            color: isActive || isHover
                ? Colors.transparent
                //leftBarTheme.activeItemBackground
                : Colors.transparent,
            width: MediaQuery.of(context).size.width,
            padding: MySpacing.xy(5, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(
                    widget.iconData,
                    color: isHover || isActive
                        ? ColorsCustom.textWhite
                        : ColorsCustom.passiveTextColor,
                    size: 10,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: MySpacing.width(8),
                ),
                MyText.bodySmall(
                  //"${widget.isCondensed ? "" : "- "}  ${widget.title}",
                  widget.title,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  fontSize: 11,
                  color: isActive || isHover
                      ? ColorsCustom.textWhite
                      : ColorsCustom.passiveTextColor,
                  fontWeight: isActive || isHover ? 500 : 500,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
