import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class PlayerListView extends StatelessWidget {

  const PlayerListView({super.key});

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

          return ListView.separated(
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
          );
        },
      ),
    );
  }
}