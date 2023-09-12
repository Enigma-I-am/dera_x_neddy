import 'package:dera_x_neddy/assets/assets.gen.dart';
import 'package:dera_x_neddy/counter/counter.dart';
import 'package:dera_x_neddy/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:js' as js;

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
                Text('$currentWidth'),
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
                        width:context.screenWidth(.4),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayLarge);
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
