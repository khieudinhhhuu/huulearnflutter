import 'package:flutter/material.dart';
import 'package:hello_world/home/home_screen.dart';
import 'package:hello_world/tab/more_screen.dart';

void main() => runApp(const TabNavigator());

class TabNavigator extends StatelessWidget {
    const TabNavigator({super.key});

    static const String _title = 'Flutter Code Sample';

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: _title,
            home: MyStatefulWidget(),
        );
    }
}

class MyStatefulWidget extends StatefulWidget {
    const MyStatefulWidget({super.key});

    @override
    State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    int _selectedIndex = 0;
    static const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static const List<Widget> _widgetOptions = <Widget>[
        HomeScreen(),
        Text(
        'Index 2: School',
        style: optionStyle,
        ),
        MoreScreen(),
    ];

    void _onItemTapped(int index) {
        setState(() {
        _selectedIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'Chat',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz),
                    label: 'More',
                ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
            ),
        );
    }
}