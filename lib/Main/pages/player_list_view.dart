import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/user_service.dart';

class PlayerListView extends StatelessWidget {

  const PlayerListView({super.key});

  Future<void> tryDeleteAllParticipants(BuildContext context) async{
    await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Supprimer les participants"),
      content: Text("Attention, cette action est irréversible"),
      actions: [
        IconButton(
          icon: Icon(Icons.check, color: AppPallette.gradiant2, size: 25,),
          onPressed: () async {
            await userService.value.deleteAllParticipants();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.check, color: AppPallette.textColor1, size: 20,),

                    SizedBox(width: 20),

                    Text("Suppression confirmée",
                      style: TextStyle(
                        color: AppPallette.textColor1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                backgroundColor: AppPallette.gradiant3,
              ),
            );

            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: Icon(Icons.clear, color: AppPallette.errorColor2, size: 25,),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallette.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallette.backgroundColor2,
        title: Text('Participants'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('participants')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Aucun participant pour le moment.'));
          }

          final participants = snapshot.data!.docs;

          return Stack(
            children: [
              ListView.separated(
                itemCount: participants.length,
                separatorBuilder: (_, _) => Divider(
                  color: AppPallette.borderColor2,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                itemBuilder: (context, index) {
                  final data = participants[index].data() as Map<String, dynamic>;
                  return ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: AppPallette.gradiant2,size: 28,),
                        Text(DateFormat('HH:mm').format(data['timestamp'].toDate().toLocal())),
                        Text(DateFormat('dd/MM').format(data['timestamp'].toDate().toLocal()),
                          style: TextStyle(
                              color: AppPallette.textColor3,
                              fontSize: 8
                          ),
                        ),
                      ],
                    ),
                    title: Text(data['name'] ?? 'Nom inconnu',
                      style: TextStyle(
                        color: AppPallette.gradiant2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text((data['email']) ?? 'Email non reconnu'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(participants[index].id,
                                style: TextStyle(
                                  color: AppPallette.borderColor2,
                                  fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    isThreeLine: true,

                  );
                },
              ),

              Positioned(
                bottom: 30,
                right: 30,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppPallette.borderColor4),
                  ),
                  onPressed: () async {
                    await tryDeleteAllParticipants(context);
                  },
                  child: Icon(Icons.delete,
                    color: AppPallette.errorColor2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}