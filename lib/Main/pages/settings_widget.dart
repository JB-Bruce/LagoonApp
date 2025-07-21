import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/Pages/SettingsSubpages/cgu_page.dart';
import 'package:lagoon_app/Authentication/Pages/SettingsSubpages/confidentialite_page.dart';
import 'package:lagoon_app/Authentication/Pages/SettingsSubpages/mentions_legales_page.dart';
import 'package:lagoon_app/Main/Widgets/selection_button.dart';
import 'package:lagoon_app/Main/Widgets/settings_subpage_button.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/theme_notifier.dart';
import 'package:lagoon_app/Main/user_service.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),

            Text(
              'Paramètres',
              style: TextStyle(
                color: appColor.textColor1,
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),



            const SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionButton(
                    label: "Option A",
                    elevated: !userService.value.isDarkTheme,
                    icon: Icons.dark_mode,
                    event: (){userService.value.isDarkTheme ? null : setState(() {
                      themeNotifier.toggle();
                    });},
                  ),
                  SizedBox(width: 20),
                  SelectionButton(
                    label: "Option B",
                    elevated: userService.value.isDarkTheme,
                    icon: Icons.light_mode,
                    event: (){userService.value.isDarkTheme ? setState(() {
                      themeNotifier.toggle();
                    }) : null;},
                  ),
                ],
              )
            ),



            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: null,
                borderRadius: BorderRadius.circular(15),
                focusColor: appColor.borderColor4,
                child: Ink(
                  padding: const EdgeInsets.all(10),
                  //margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: appColor.backgroundColor2,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        SettingsSubpageButton(
                          text: 'Mentions légales',
                          event: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MentionsLegalesPage()
                            ));},
                          icon: Icons.chevron_right,),

                        const SizedBox(height: 10),

                        SettingsSubpageButton(
                          text: 'Conditions générales d’utilisation',
                          event: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => CguPage()
                          ));},
                          icon: Icons.chevron_right,
                        ),

                        const SizedBox(height: 10),

                        SettingsSubpageButton(
                          text: 'Politique de confidentialité',
                          event: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ConfidentialitePage()
                            ));},
                          icon: Icons.chevron_right,),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height: 30),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: null,
                borderRadius: BorderRadius.circular(15),
                focusColor: appColor.borderColor4,
                child: Ink(
                  padding: const EdgeInsets.all(10),
                  //margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: appColor.backgroundColor2,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        SettingsSubpageButton(text: 'Nous contacter', event: () {  }, icon: Icons.chevron_right,),

                        const SizedBox(height: 10),

                        SettingsSubpageButton(text: 'Reporter un bug', event: () {  }, icon: Icons.chevron_right,),

                        const SizedBox(height: 10),

                        SettingsSubpageButton(text: "version de l'app : v" + userService.value.version, event: null),

                        const SizedBox(height: 10),
                      ],
                    ),
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
