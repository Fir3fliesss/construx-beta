import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
// import 'package:construx/views/layouts/menu_side_a.dart';
// import 'package:construx/views/layouts/menu_side_b_dashboard.dart';
// import 'package:construx_beta/app/modules/layout_sidebar/menu_side_a.dart';
import 'package:construx_beta/app/modules/layout_sidebar/menu_side_b_dashboard.dart';

class SidemenuDashboard extends StatelessWidget {
  const SidemenuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          NavigationItemDashboard(
            title: 'mah?',
            iconData: LucideIcons.database,
            route: '/project_maps',
          ),
          SizedBox(height: 10),
          NavigationItemDashboard(
            title: 'Project Management Dahshboard',
            iconData: LucideIcons.database,
            route: '/project_manage',
          ),
          SizedBox(height: 10),
          MenuItemDashboardSide(
            iconData: LucideIcons.database,
            title: "Construction Management Dashboard",
            //route: "/construction_manage",
            children: [
              MenuItemsDashboardSide(
                iconData: LucideIcons.circleDot,
                title: "Schedule Report",
                // route: "/schedule_report",
              ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "asssalamualaikum mas",
              //   route: "/cash_report",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Quality Report",
              //   route: "/quality_report",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Document Record",
              //   route: "/document_record",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Weather Record",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Manpower Record",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Material Record",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Equipment Record",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Safety Record",
              // ),
              // MenuItemsDashboardSide(
              //   iconData: LucideIcons.circleDot,
              //   title: "Subcontractor Performance",
              // ),
            ],
          )
        ],
      ),
    );
  }
}
