import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilovam/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Accaunts extends StatefulWidget {
  const Accaunts({super.key});

  @override
  State<Accaunts> createState() => _AccauntsState();
}

class _AccauntsState extends State<Accaunts> {
  TextEditingController sendmessages = TextEditingController();
  String location = "Locatsiya olinmadi";
  GoogleMapController? _mapController;
  LatLng? _currentPosition;

  void getLocation() async {
    try {
      final position = await LocationService().determinePosition();
      if (position != null) {
        setState(() {
          location = "Lat: ${position.latitude}, Long: ${position.longitude}";
        });
        await FirebaseFirestore.instance.collection("locations").add({
          "latitude": position.latitude,
          "longitude": position.longitude,
          "timestamp": FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      setState(() {
        location = "Xatolik $e";
      });
    }
  }

  void addMessages() {
    setState(() {
      FirebaseFirestore.instance.collection("messages").add({
        "userId": FirebaseAuth.instance.currentUser!.uid,
        "text": sendmessages.text,
        "createdAt": FieldValue.serverTimestamp(),
      });
      sendmessages.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/icons/apple.png"),
        ),
        title: Text("Smith Mathew"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: requestMicrophonePermission,
                icon: Icon(Icons.phone_enabled_outlined),
              ),
              IconButton(
                onPressed: requestMultiplePermissions,
                icon: Icon(Icons.video_camera_front_outlined),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: Provider.of<MessagesProvider>(context).messageStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  var docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.message),
                        title: Text(docs[index]["text"]),
                      );
                    },
                  );
                },
              ),
            ),
            Text(location, style: TextStyle(fontSize: 16, color: Colors.blue)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sendmessages,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write someting",
                    ),
                  ),
                ),
                IconButton(onPressed: addMessages, icon: Icon(Icons.send)),
                IconButton(
                  onPressed: getLocation,
                  icon: Icon(Icons.map_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesProvider with ChangeNotifier {
  Stream<QuerySnapshot> get messageStream {
    return FirebaseFirestore.instance
        .collection("messages")
        .orderBy("createdAt")
        .snapshots();
  }
}
