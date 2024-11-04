import 'package:get/get.dart';
// import 'package:construx_beta/main.dart';
import 'package:flutter/material.dart';
// import '../../helpers/utils/ui_mixins.dart';
// import '../../widgets/custom_pop_menu.dart';
// import '../../helpers/widgets/my_spacing.dart';
import 'package:lucide_icons/lucide_icons.dart';
// import '../../helpers/services/url_service.dart';
// import '../../helpers/widgets/my_container.dart';
// import 'package:construx/helpers/utils/color.dart';
// import 'package:construx/views/layouts/left_bar.dart';
// import 'package:construx/helpers/widgets/my_text.dart';
// import '../../controller/layouts/layout_controller.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:construx_beta/app/modules/helper/utils/ui_mixins.dart';
import 'package:construx_beta/app/modules/helper/utils/color.dart';
import 'package:construx_beta/app/modules/layout_sidebar/left_bar.dart';
import 'package:construx_beta/app/modules/layout_sidebar/controller/layout_controller.dart';
import 'package:construx_beta/app/modules/helper/widgets/custom_pop_menu.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_spacing.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_text.dart';
import 'package:construx_beta/app/modules/helper/widgets/my_container.dart';
import 'package:construx_beta/app/modules/helper/services/url_service.dart';

//Menu Utils
class MenuWidgetUtils extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItemUtils> children;

  const MenuWidgetUtils(
      {super.key,
      required this.iconData,
      required this.title,
      this.isCondensed = false,
      this.active = false,
      this.children = const []});

  @override
  _MenuWidgetUtilsState createState() => _MenuWidgetUtilsState();
}

class _MenuWidgetUtilsState extends State<MenuWidgetUtils>
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

    if (widget.isCondensed) {
      return CustomPopupMenu(
        backdrop: true,
        show: popupShowing,
        hideFn: (_) => hideFn = _,
        onChange: (_) {
          // popupShowing = _;
        },
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
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
            margin: MySpacing.fromLTRB(0, 0, 0, 8),
            borderRadius: BorderRadius.circular(6),
            color: isActive || isHover
                ? ColorsCustom.buttonGrey
                : ColorsCustom.buttonGrey,
            padding: MySpacing.xy(8, 8),
            child: Center(
              child: Icon(
                widget.iconData,
                color: (isHover || isActive)
                    ? ColorsCustom.textWhite
                    : ColorsCustom.textWhite,
                size: 15,
              ),
            ),
          ),
        ),
        menuBuilder: (_) => MyContainer.bordered(
          paddingAll: 8,
          width: 190,
          color: ColorsCustom.themeSideBlack2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          ),
        ),
      );
    } else {
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
        child: MyContainer(
          color: ColorsCustom.themeSideBlack2,
          margin: MySpacing.fromLTRB(0, 0, 0, 0),
          borderRadius: BorderRadius.circular(6),
          paddingAll: 0,
          child: ListTileTheme(
            tileColor: ColorsCustom.buttonGrey,
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child: ExpansionTile(
                tilePadding: const EdgeInsets.only(left: 0, right: 20),
                initiallyExpanded: isActive,
                maintainState: true,
                onExpansionChanged: (_) {
                  LeftbarObserver.notifyAll(widget.title);
                  onChangeExpansion(_);
                },
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: const Icon(
                    LucideIcons.chevronDown,
                    size: 20,
                    color: ColorsCustom.textWhite,
                  ),
                ),
                iconColor: leftBarTheme.activeItemColor,
                childrenPadding: MySpacing.x(0),
                title: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: MyText.bodySmall(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    fontSize: 13,
                    color: isHover || isActive
                        ? ColorsCustom.textWhite
                        : ColorsCustom.textWhite,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    widget.iconData,
                    size: 15,
                    color: isHover || isActive
                        ? ColorsCustom.textWhite
                        : ColorsCustom.textWhite,
                  ),
                ),
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // LeftbarObserver.detachListener(widget.title);
  }
}

class MenuItemUtils extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final String subtitle;
  final bool isCondensed;
  final String? route;

  const MenuItemUtils({
    Key? key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
    required this.subtitle,
  }) : super(key: key);

  @override
  _MenuItemUtilsState createState() => _MenuItemUtilsState();
}

class _MenuItemUtilsState extends State<MenuItemUtils> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
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
          margin: MySpacing.fromLTRB(4, 0, 8, 4),
          color: isActive || isHover
              ? leftBarTheme.activeItemBackground
              : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          padding: MySpacing.xy(5, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodySmall(
                //"${widget.isCondensed ? "" : "- "}  ${widget.title}",
                widget.title,
                overflow: TextOverflow.clip,
                maxLines: 1,
                textAlign: TextAlign.left,
                fontSize: 10,
                color: isActive || isHover
                    ? ColorsCustom.themeGreen
                    : ColorsCustom.textWhite,
                fontWeight: isActive || isHover ? 500 : 500,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorsCustom.bgUtilsGrey2,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 27,
                      decoration: const BoxDecoration(
                          color: ColorsCustom.bgUtilsGrey1,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                    ),
                    const SizedBox(width: 10),
                    MyText.bodySmall(
                      widget.subtitle,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      fontSize: 11,
                      color: isActive || isHover
                          ? ColorsCustom.themeGreen
                          : ColorsCustom.textWhite,
                      fontWeight: isActive || isHover ? 500 : 500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Menu Dashboard, Task
class MenuWidgetDrawer extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItemDrawer> children;

  const MenuWidgetDrawer(
      {super.key,
      required this.iconData,
      required this.title,
      this.isCondensed = false,
      this.active = false,
      this.children = const []});

  @override
  _MenuWidgetDrawerState createState() => _MenuWidgetDrawerState();
}

class _MenuWidgetDrawerState extends State<MenuWidgetDrawer>
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

    if (widget.isCondensed) {
      return CustomPopupMenu(
        backdrop: true,
        show: popupShowing,
        hideFn: (_) => hideFn = _,
        onChange: (_) {
          // popupShowing = _;
        },
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
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
            margin: MySpacing.fromLTRB(0, 0, 0, 8),
            borderRadius: BorderRadius.circular(6),
            color: isActive || isHover
                ? ColorsCustom.themeGreen
                : ColorsCustom.themeSideBlack,
            padding: MySpacing.xy(8, 8),
            child: Center(
              child: Icon(
                widget.iconData,
                color: (isHover || isActive)
                    ? ColorsCustom.textWhite
                    : ColorsCustom.passiveTextColor,
                size: 15,
              ),
            ),
          ),
        ),
        menuBuilder: (_) => MyContainer.bordered(
          paddingAll: 8,
          width: 190,
          color: ColorsCustom.themeSideBlack2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          ),
        ),
      );
    } else {
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
          color: isActive || isHover
              ? ColorsCustom.themeSideBlack2
              : Colors.transparent,
          margin: MySpacing.fromLTRB(0, 0, 0, 0),
          borderRadius: BorderRadius.circular(6),
          paddingAll: 0,
          child: ListTileTheme(
            tileColor: isHover || isActive
                ? ColorsCustom.themeGreen
                : ColorsCustom.themeSideBlack,
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child: ExpansionTile(
                tilePadding: const EdgeInsets.only(left: 0, right: 20),
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
                    size: 20,
                    color: isHover || isActive
                        ? ColorsCustom.textWhite
                        : ColorsCustom.passiveTextColor,
                  ),
                ),
                iconColor: leftBarTheme.activeItemColor,
                childrenPadding: MySpacing.x(0),
                title: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: MyText.bodySmall(widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      fontSize: 13,
                      color: isHover || isActive
                          ? ColorsCustom.textWhite
                          : ColorsCustom.passiveTextColor),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(widget.iconData,
                      size: 15,
                      color: isHover || isActive
                          ? ColorsCustom.textWhite
                          : ColorsCustom.passiveTextColor),
                ),
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // LeftbarObserver.detachListener(widget.title);
  }
}

class MenuItemDrawer extends StatefulWidget {
  final IconData? iconData;
  final String title;
  // final int indexMenu;
  final bool isCondensed;
  final String? route;

  const MenuItemDrawer({
    Key? key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
    // required this.indexMenu,
  }) : super(key: key);

  @override
  _MenuItemDrawerState createState() => _MenuItemDrawerState();
}

class _MenuItemDrawerState extends State<MenuItemDrawer> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GetBuilder<LayoutController>(builder: (menu) {
      return GestureDetector(
        onTap: () {
          if (widget.route != null) {
            Get.toNamed(widget.route!);
            // setState(() {
            //   menu.changePage(widget.indexMenu);
            //   menu.changeTabIndex(widget.indexMenu);
            // });
            // print(widget.indexMenu);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodySmall(
                  //"${widget.isCondensed ? "" : "- "}  ${widget.title}",
                  widget.title,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  fontSize: 11,
                  color: isActive || isHover
                      ? ColorsCustom.themeGreen
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

class NavigationItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;
  //final int? indexMenu;

  const NavigationItem(
      {Key? key,
      this.iconData,
      required this.title,
      this.isCondensed = false,
      //this.indexMenu,
      this.route})
      : super(key: key);

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> with UIMixin {
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
                ? ColorsCustom.themeGreen
                : Colors.transparent,
            padding: MySpacing.xy(8, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: widget.isCondensed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (widget.iconData != null)
                  Center(
                    child: widget.isCondensed
                        ? Icon(
                            widget.iconData,
                            color: isHover || isActive
                                ? ColorsCustom.textWhite
                                : ColorsCustom.passiveTextColor,
                            size: 15,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Icon(
                              widget.iconData,
                              color: isHover || isActive
                                  ? ColorsCustom.textWhite
                                  : ColorsCustom.passiveTextColor,
                              size: 15,
                            ),
                          ),
                  ),
                if (!widget.isCondensed)
                  Flexible(
                    fit: FlexFit.loose,
                    child: MySpacing.width(8),
                  ),
                if (!widget.isCondensed)
                  Expanded(
                    flex: 3,
                    child: MyText.bodySmall(widget.title,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        fontSize: 13,
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

class NavigationLogOut extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const NavigationLogOut(
      {Key? key,
      this.iconData,
      required this.title,
      this.isCondensed = false,
      this.route})
      : super(key: key);

  @override
  _NavigationLogOutState createState() => _NavigationLogOutState();
}

class _NavigationLogOutState extends State<NavigationLogOut> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
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
        child: MyContainer(
          margin: MySpacing.fromLTRB(0, 0, 0, 0),
          color: isActive || isHover
              ? ColorsCustom.themeGreen
              : Colors.transparent,
          padding: MySpacing.xy(8, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: widget.isCondensed
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (widget.iconData != null)
                Center(
                  child: widget.isCondensed
                      ? Transform.flip(
                          flipX: true,
                          child: Icon(
                            widget.iconData,
                            color: isHover || isActive
                                ? ColorsCustom.textWhite
                                : ColorsCustom.passiveTextColor,
                            size: 15,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Transform.flip(
                            flipX: true,
                            child: Icon(
                              widget.iconData,
                              color: isHover || isActive
                                  ? ColorsCustom.textWhite
                                  : ColorsCustom.passiveTextColor,
                              size: 15,
                            ),
                          ),
                        ),
                ),
              if (!widget.isCondensed)
                Flexible(
                  fit: FlexFit.loose,
                  child: MySpacing.width(8),
                ),
              if (!widget.isCondensed)
                Expanded(
                  flex: 3,
                  child: MyText.bodySmall(widget.title,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      fontSize: 13,
                      color: isHover || isActive
                          ? ColorsCustom.textWhite
                          : ColorsCustom.passiveTextColor),
                )
            ],
          ),
        ),
      ),
    );
  }
}
