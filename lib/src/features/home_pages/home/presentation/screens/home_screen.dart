import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/core/theme/app_styles.dart';

import '../../../../../core/theme/app_colors.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(child: Text("Home  ${Supabase.instance.client.auth.currentUser!.userMetadata!['username']}", style: AppStyles.text10PxSemiBold.white,)),
    );
  }
}
