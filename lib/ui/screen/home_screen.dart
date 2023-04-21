import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecare_user/ui/screen/home_screen_sections/member_section.dart';
import 'package:homecare_user/ui/screen/home_screen_sections/settings_section.dart';
import 'package:homecare_user/ui/screen/home_screen_sections/requests_section.dart';
import 'package:homecare_user/ui/widgets/custom_alert_dialog.dart';
import 'package:homecare_user/ui/widgets/custom_dropdown.dart';

import '../../blocs/manage_nurse_requests/manage_nurse_request_bloc.dart';
import '../../values/values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "HomeCare",
          style: GoogleFonts.dynalight(
            textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: primaryColor,
                ),
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          RequestSection(),
          MemberSection(),
          SettingsSection(),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavBarButton(
                iconData: Icons.add_box_outlined,
                label: "Request",
                onPressed: () {
                  BlocProvider.of<ManageNurseRequestBloc>(context)
                      .add(GetAllNurseRequestEvent());
                  tabController.animateTo(0);
                },
                isSelected: tabController.index == 0,
              ),
              BottomNavBarButton(
                iconData: Icons.people_alt_rounded,
                label: "Member",
                onPressed: () {
                  tabController.animateTo(1);
                },
                isSelected: tabController.index == 1,
              ),
              BottomNavBarButton(
                iconData: Icons.settings_outlined,
                label: "Settings",
                onPressed: () {
                  tabController.animateTo(2);
                },
                isSelected: tabController.index == 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Function() onPressed;
  final bool isSelected;
  const BottomNavBarButton({
    Key? key,
    required this.iconData,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Icon(
              iconData,
              color: isSelected ? Colors.green : Colors.black54,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.green : Colors.black54,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
