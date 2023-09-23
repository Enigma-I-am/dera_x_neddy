// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

import 'package:dera_x_neddy/assets/assets.gen.dart';
import 'package:dera_x_neddy/counter/counter.dart';
import 'package:dera_x_neddy/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svgs.icLogo.svg(
                      width: context.screenWidth(.4),
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFAD8F64),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                const Gap(40),
                if (currentWidth <= 399)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TouchableOpacity(
                        width: context.screenWidth(.4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFAD8F64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onTap: () {
                          js.context.callMethod(
                            'open',
                            ['https://photos.app.goo.gl/sMwCwf4fpukXTY9bA'],
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Upload photos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      TouchableOpacity(
                        width: context.screenWidth(.4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFAD8F64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'View our menu',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TouchableOpacity(
                        width: context.screenWidth(.2),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFAD8F64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onTap: () {
                          js.context.callMethod(
                            'open',
                            ['https://photos.app.goo.gl/sMwCwf4fpukXTY9bA'],
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Upload memories',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Gap(40),
                      TouchableOpacity(
                        width: context.screenWidth(.2),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFAD8F64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<MenuPage>(
                            builder: (context) => const MenuPage(),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'View our menu',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future(() => true);
      },
      child: Scaffold(
        appBar: const EmptyAppBar(),
        body: Center(
          child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/todolist-a3a31.appspot.com/o/Menu.png?alt=media&token=0a952dd0-71ad-49ce-ac7d-1b2059ed6413',
            height: context.screenHeight(),
          ),
        ),
      ),
    );
  }
}

class CustomBorder extends StatelessWidget {
  const CustomBorder({
    required this.child,
    super.key,
    // this.onTap,
    this.borderColor = const Color(0xFFEFE9E7),
    this.backgroundColor,
    this.padding = const EdgeInsets.all(16),
    this.radius = 8,
  });
  final Widget child;
  // final void Function()? onTap;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}
