import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lagoon_app/Authentication/Widgets/validate_button.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/pages/player_list_view.dart';

class AdminWidget extends StatefulWidget {
  const AdminWidget({super.key});

  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  final durationController = TextEditingController();
  final repetitionController = TextEditingController();

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Accueil',
            style: TextStyle(
              color: AppPallette.textColor1,
              fontSize: 35,
              fontWeight: FontWeight.w800,
            ),
          ),

          Text(
            'Admin',
            style: TextStyle(
              color: AppPallette.textColor1,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 100),

          Divider(
            color: AppPallette.borderColor2,
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),

          const SizedBox(height: 25),

          Text(
            'Tirage au sort',
            style: TextStyle(
              color: AppPallette.textColor1,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Durée : ',
                  style: TextStyle(
                    color: AppPallette.textColor1,
                    fontSize: 16,
                  ),
                ),

                SizedBox(width: 5),
                Container(
                  height: 48,
                  width: 60,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: durationController,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppPallette.borderColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppPallette.gradiant1,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      hintText: '000',
                    ),
                  ),
                ),

                SizedBox(width: 5),

                Text(
                  'mn',
                  style: TextStyle(
                    color: AppPallette.textColor1,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'répétitions : ',
                  style: TextStyle(
                    color: AppPallette.textColor1,
                    fontSize: 16,
                  ),
                ),

                SizedBox(width: 5),
                Container(
                  height: 48,
                  width: 48,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: repetitionController,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppPallette.borderColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppPallette.gradiant1,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      hintText: '00',
                    ),
                  ),
                ),

                SizedBox(width: 5),

                Text(
                  'x',
                  style: TextStyle(
                    color: AppPallette.textColor1,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: InkWell(
          onTap: null,
          borderRadius: BorderRadius.circular(15),
          focusColor: AppPallette.gradiant2,
          child: Ink(
            padding: const EdgeInsets.all(12),
            //margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: AppPallette.gradiant1,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Text('Lancer le tirage',
                      style: TextStyle(
                        color: AppPallette.textColor1,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: InkWell(
              onTap: null,
              borderRadius: BorderRadius.circular(15),
              focusColor: AppPallette.gradiant2,
              child: Ink(
                padding: const EdgeInsets.all(10),
                //margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: AppPallette.gradiant3,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: Text('Tirer un gagnant',
                          style: TextStyle(
                            color: AppPallette.textColor1,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerListView())),
                onHover: (bool) => log('eee'),
                child: Text('Voir les inscrits',
                  style: TextStyle(
                    color: AppPallette.gradiant1,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: AppPallette.gradiant1,
                  ),
                ),
              ),

              Icon(Icons.search, color: AppPallette.gradiant1, size: 20),
            ],
          ),

          const SizedBox(height: 10),

          Divider(
            color: AppPallette.borderColor2,
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),

          const SizedBox(height: 25),

          //TimePickerDialog(initialTime: TimeOfDay(minute: TimeOfDay.now().minute + 10, hour: TimeOfDay.now().hour))
        ],
      ),
    );
  }
}
