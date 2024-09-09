import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/appbar_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';

class AppbarView extends GetView<AppbarController>
    implements PreferredSizeWidget {
  const AppbarView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, dd/MM/yyyy').format(now);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.abuabu,
            width: 2.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 198.0,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Center(
            child: Text(
              formattedDate,
              style: const TextStyle(fontSize: 16.0, color: Colors.black54),
              overflow: TextOverflow.ellipsis,
            ),
          )),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.person_outline_rounded),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              const Text(
                'Nusa',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
