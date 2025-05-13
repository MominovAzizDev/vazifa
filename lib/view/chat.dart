import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHat", style: TextStyle(fontSize: 20)),
        actions: [Icon(Icons.edit_calendar_outlined, size: 35)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 58,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Icon(Icons.search, color: Colors.green),
                title: TextField(
                  decoration: InputDecoration(hintText: "Search here.."),
                ),
                trailing: Icon(Icons.mic, color: Colors.blueGrey),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/icons/google.png"),
                      ),
                      SizedBox(width: 10),
                    ],
                  );
                }),
              ),
            ),
            Column(
              children: List.generate(10, (index) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/icons/apple.png"),
                        ),
                        title: SizedBox(
                          height: 30,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Smith Mathew",
                            ),
                          ),
                        ),
                        subtitle: SizedBox(
                          height: 30,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Hi, David. Hope you’re doing....",
                            ),
                          ),
                        ),
                        trailing: Text("29 mart"),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blueGrey),
            label: 'person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.blueGrey),
            label: 'people',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: Colors.blueGrey),
            label: 'camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.blueGrey),
            label: 'settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
