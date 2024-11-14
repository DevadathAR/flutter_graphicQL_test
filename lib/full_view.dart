import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Widget body;
  const Home({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://scontent.fccj6-1.fna.fbcdn.net/v/t39.30808-6/466064826_555510340760721_4864105821243659003_n.jpg?stp=dst-jpg_s640x640&_nc_cat=100&ccb=1-7&_nc_sid=833d8c&_nc_ohc=wRWM04MLeM0Q7kNvgG6lzY7&_nc_zt=23&_nc_ht=scontent.fccj6-1.fna&_nc_gid=AUO2DUiDyNx4AQQtd2eeTAe&oh=00_AYC0zxBL67TL_ar7E2EpShc5mWwvPB2B7TbxJ2ZDaGlG1A&oe=673BA5A2',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: const Icon(Icons.menu),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Send'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {},
        child: Container(
          height: 35,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.greenAccent,
          ),
          child: Center(child: Text('FILTER')),
        ),
      ),
      body: body,
    );
  }
}

class PageShow extends StatelessWidget {
  const PageShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(Icons.home),
          Icon(Icons.arrow_forward_ios),
          Text('data'),
          Icon(Icons.arrow_forward_ios),
          Text('data'),
          Icon(Icons.arrow_forward_ios),
          Text('data'),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}

class IteamBox extends StatelessWidget {
  final ScrollPhysics scroll;
  final bool ispage;
  const IteamBox(
      {super.key,
      this.scroll = const BouncingScrollPhysics(),
      this.ispage = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (ispage) PageShow(),
        Expanded(
          child: GridView.builder(
            physics: scroll,
            padding: const EdgeInsets.all(8.0),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const IteamDetailed();
                      },
                    ),
                  );
                },
                child: SingleIteam(
                  isDetailed: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SingleIteam extends StatelessWidget {
  final bool isDetailed;
  final double? length;
  const SingleIteam({
    super.key,
    this.length,
    this.isDetailed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: length,
      decoration: BoxDecoration(
        border: isDetailed ? null : Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  'https://scontent.fccj6-1.fna.fbcdn.net/v/t39.30808-6/466103301_402855722902973_6623377381814001043_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=127cfc&_nc_ohc=wY8vY_XU6l4Q7kNvgEOP78y&_nc_zt=23&_nc_ht=scontent.fccj6-1.fna&_nc_gid=AUO2DUiDyNx4AQQtd2eeTAe&oh=00_AYBa2hPgx7lb41yNoF2p0_Na3E42DvextJw3tDmarubFQw&oe=673B8694',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Text('data'),
              if (isDetailed) Stars(),
              RichText(
                text: const TextSpan(
                  text: 'dollar ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'amount',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              if (!isDetailed)
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyan,
                    ),
                    alignment: Alignment.center,
                    child: const Text('data'),
                  ),
                ),
            ],
          ),
          Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.favorite,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}

class Stars extends StatelessWidget {
  final bool? view;
  const Stars({
    super.key,
    this.view = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        SizedBox(
          width: 100,
        ),
        if (view!) Text('review')
      ],
    );
  }
}

class IteamDetailed extends StatelessWidget {
  const IteamDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Home(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const PageShow(),
            // Add any other details or widgets here
            Expanded(
                child: SingleIteam(
              isDetailed: true,
              length: 400,
            )),
            Row(
              children: [
                Text('color : '),
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(
                  width: 16,
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('size  :'),
                SizedBox(
                  width: 50,
                ),
                _sizecontainer(text: 'XS'),
                SizedBox(
                  width: 16,
                ),
                _sizecontainer(text: 'S'),
                SizedBox(
                  width: 16,
                ),
                _sizecontainer(
                  text: 'M'
                ),
                SizedBox(
                  width: 16,
                ),
                _sizecontainer(

                  text: 'L'
                ),
                SizedBox(
                  width: 16,
                ),
                _sizecontainer(text: "X"),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('Quantity : '),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: 40,
                      width: 60,
                      child: Center(
                        child: Text(
                          '1',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      height: 40,
                      width: 60,
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size: 15,
                          ),
                          Icon(
                            Icons.arrow_downward,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button(text: 'add cart'),
                _button(color: const Color.fromARGB(255, 126, 126, 126),text: 'buy'),
              ],
            ),
            _datum(datum: "Detailed", size: 22),
            _datum(color: Colors.black, size: 18, datum: '''
        Flutter is a powerful UI toolkit developed by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It leverages the Dart programming language and provides developers with a high-performance rendering engine that allows for smooth, high-fidelity applications. One of Flutter's standout features is its "hot reload," enabling real-time updates and rapid iteration, which greatly enhances productivity.
        
        A core component of Flutter is its widget-based architecture. Every element of a Flutter app—from layout structures to text, buttons, and animations—is a widget. These widgets are highly customizable and composable, enabling developers to create complex UIs efficiently. Flutter also supports both Material Design (for Android) and Cupertino (for iOS) widgets, ensuring a native-like experience across platforms.
        '''),
            _datum(datum: "Review", size: 18),
            Row(
              children: [
                Text('data'),
                Stars(
                  view: false,
                )
              ],
            ),
            _datum(datum: 'great fit', size: 18, color: Colors.black),
            _datum(datum: 'great fit', size: 18, color: Colors.black),

            Row(
              children: [
                Text('data'),
                Stars(
                  view: false,
                )
              ],
            ),
            _datum(datum: "data", size: 18, color: Colors.black),

            _datum(datum: "data", size: 16, color: Colors.black),
            _button(color: Colors.amber, height: 40),
            Center(child: _datum(datum: 'Product', size: 22)),

            Container(
              height: 500,
              child: IteamBox(
                scroll: NeverScrollableScrollPhysics(),
                ispage: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _datum({datum, color = Colors.cyan, double? size}) => Text(
        datum,
        style: TextStyle(color: color, fontSize: size!),
      );

  Container _button({color = Colors.cyan, double height = 30,String? text = 'data'}) {
    return Container(
      margin: const EdgeInsets.all(6),
      height: height,
      width: 150,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      alignment: Alignment.center,
      child:  Text(text!),
    );
  }

  Container _sizecontainer({String ?text}) => Container(
        child: Text(
          text!,
          textAlign: TextAlign.center,
        ),
        height: 20,
        width: 30,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      );
}
