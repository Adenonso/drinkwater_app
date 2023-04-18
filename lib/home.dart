import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        drawerEdgeDragWidth: 250,
        drawerScrimColor: Colors.black.withOpacity(0.5),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade400,
                ),
                child: Text(
                  'YouFit',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              ExpansionTile(
                title: Text(
                  'Contact us',
                  style: TextStyle(color: Colors.brown),
                ),
                children: [
                  ListTile(
                      leading: Icon(Icons.mail),
                      title: Text('balogundaniel2001@yahoo.com')),
                  ListTile(
                    leading: Icon(Icons.message_outlined),
                    title: Text('+234(0)701 710 8311'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_pin),
                    title: Text('Head Office: 2-3 Branko, Island, Lagos.'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.brown),
                ),
                children: [
                  ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Balogun Daniel')),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Male'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_pin),
                    title: Text('Liverpool, United Kingdom'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.brown),
                ),
                children: [
                  ListTile(
                    leading: Icon(Icons.message_outlined),
                    title: Text('Privacy and User Agreement'),
                    onTap: () {
                      Navigator.pushNamed(context, '/privacy');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info_rounded),
                    title: Text('About Us'),
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ListTile(
                // leading: Icon(Icons.favorite),
                title: Text('Rate Us'),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/water4.jpg',
                      fit: BoxFit.cover,
                      color: Colors.lightBlue.shade100,
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  floating: true,
                  pinned: true,
                  snap: false,
                  centerTitle: true,
                  title: Text(
                    'Healthy Drinking',
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: Scroll(
                    pic: 'assets/water1.jpg',
                    direct: '/watergrade',
                    topic: 'Grading of consumption water',
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: Scroll(
                    pic: 'assets/water3.jpg',
                    direct: '/waterplan',
                    topic: 'Daily water in take plan',
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: Scroll(
                    pic: 'assets/water5.jpg',
                    direct: '',
                    topic: 'Benefits of healthy water in \n take',
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
                ),
              ],
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 25),
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 5),
                      )
                    ],
                    border: Border.all(color: Colors.blueGrey, width: 1),
                  ),
                  child: Builder(builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.menu_open_sharp),
                      color: Colors.blueGrey,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ));
  }
}

class Scroll extends StatelessWidget {
  final String pic;
  final String topic;
  final String direct;

  const Scroll({Key key, this.pic, this.direct, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, direct);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 5),
            )
          ],
          border: Border.all(color: Colors.blueGrey, width: 1),
        ),
        width: 30,
        // height: MediaQuery.of(context).size.height * 0.30,
        padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(23.0))),
              width: 270.0,
              height: MediaQuery.of(context).size.height * 0.15,
              // padding: EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    pic,
                    fit: BoxFit.cover,
                    color: Colors.lightBlue.shade100,
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              topic,
              textAlign: TextAlign.center,
              style: GoogleFonts.sairaExtraCondensed(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
