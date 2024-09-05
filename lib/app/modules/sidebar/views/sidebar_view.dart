import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constanta/app_colors.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: AppColors.abu,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/CONSTRUX-LOGO.png',
                  width: 400.0,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home Page', style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.offAllNamed('/home');
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Basic Settings', style: TextStyle(color: Colors.white)),
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.only(left: 50.0),
                leading: const Icon(Icons.info, color: Colors.white),
                title: const Text('Company Information', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed('/company-information'); // Navigasi ke halaman Company Information
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 50.0),
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text('User Role', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed('/user-role'); // Navigasi ke halaman User Role
                },
              ),
              // Tambahkan item menu lainnya sesuai kebutuhan
            ],
          ),
          // Tambahkan item lain sesuai kebutuhan
        ],
      ),
    );
  }
}