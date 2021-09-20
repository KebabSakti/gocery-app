import 'package:ayov2/const/const.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 200,
        leading: SvgPicture.asset(LOGO),
      ),
      body: Center(
        child: PageState(
          iconData: Icons.sync_problem_rounded,
          title: 'Terjadi Kesalahan',
          text: 'Jangan panik, sentuh tombol di bawah untuk mencoba kembali',
          buttonText: 'Coba Lagi',
          onTap: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
