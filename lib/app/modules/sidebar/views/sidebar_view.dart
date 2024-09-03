import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../constanta/app_colors.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Lebar sidebar
      color: AppColors.abu, // Warna latar sidebar
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'construx_beta/assets/images/logo.svg', // Gambar logo
                  width: 60.0,
                  height: 60.0,
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
                leading: const Icon(Icons.info, color: Colors.white),
                title: const Text('Company Information', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.toNamed('/company-information'); // Navigasi ke halaman Company Information
                },
              ),
              ListTile(
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