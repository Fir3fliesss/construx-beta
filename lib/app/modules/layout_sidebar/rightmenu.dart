import 'package:flutter/material.dart';
// import '../../helpers/utils/reso.dart';
// import '../../helpers/utils/assets.dart';
// import '../../helpers/utils/small_text.dart';
// import 'package:construx/helpers/utils/color.dart';
import 'package:construx_beta/app/modules/helper/utils/reso.dart';
import 'package:construx_beta/app/modules/helper/utils/small_text.dart';
import 'package:construx_beta/app/modules/helper/utils/color.dart';
import 'package:construx_beta/app/modules/helper/utils/assets.dart';

class RightMenu extends StatelessWidget {
  const RightMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsCustom.backgroundScaffold,
      child: Padding(
        padding: EdgeInsets.only(
            right: Reso.width10 * 2,
            top: Reso.height10 * 2,
            left: Reso.width10 * 1.8),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: Reso.height10 * 4.2,
                width: Reso.height10 * 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsCustom.buttonBlack),
                child: Center(
                  child: SmallText(
                    text: "AA",
                    color: ColorsCustom.textWhite,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: Reso.height10 * 4.2,
                width: Reso.height10 * 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsCustom.buttonWhite),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: ImageIcon(
                    AssetImage(bell),
                    color: Color(0xFF3A5A98),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: Reso.height10 * 4.2,
                width: Reso.height10 * 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsCustom.buttonWhite),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: ImageIcon(
                    AssetImage(mail),
                    color: Color(0xFF3A5A98),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: Reso.height10 * 4.2,
                width: Reso.height10 * 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsCustom.buttonWhite),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: ImageIcon(
                    AssetImage(chat),
                    color: Color(0xFF3A5A98),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
