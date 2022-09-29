import 'dart:developer';
import 'package:explore/Models/GroupModel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'Models/Offers.dart';
import 'data.dart';
import 'Models/Highlights.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 33, 33, 33),
          onPrimary: const Color.fromARGB(255, 27, 27, 27),
          background: const Color.fromARGB(255, 43, 43, 43),
          secondary: const Color.fromARGB(255, 117, 117, 117),
          onSecondary: const Color.fromARGB(255, 57, 57, 57),
          tertiary: const Color.fromARGB(255, 0, 137, 123),
          outline: const Color.fromARGB(255, 63, 81, 181),
          inverseSurface: const Color.fromARGB(255, 224, 205, 52),
        ),
      ),
      home: ExploreScreen(),
    );
  }
}

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {
  int pageIndex = 1;
  void setPage(int i) {
    setState(() {
      pageIndex = i;
      log('page Index: $pageIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    pageIndex = 0;
    double groupHFactor = 9.5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text(
          'Explore',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.outline,
              child: IconButton(
                color: Theme.of(context).colorScheme.secondary,
                icon: const Icon(Icons.beenhere_rounded, color: Colors.white),
                onPressed: () {
                  log("Gifts");
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.outline,
              child: IconButton(
                color: Theme.of(context).colorScheme.secondary,
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  log("Cart");
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: height,
        color: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            SingleChildScrollView(
              reverse: true,
              controller: ScrollController(initialScrollOffset: height * 1.3),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  playAndEarn(context),
                  Card(
                    margin: const EdgeInsets.all(6.5),
                    borderOnForeground: true,
                    child: highlightSlideShow(context),
                  ),
                  headingsWithButton(context, "All Subscriptions"),
                  Container(
                      height: width / 1.7,
                      width: width * 0.98,
                      //color: Color.fromARGB(255, 74, 74, 74),
                      padding: const EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: subscriptionsSlideView()),
                  headingsWithButton(context, "Public Groups"),
                  SizedBox(
                    width: width * 0.98,
                    child:
                        Column(children: groupsWidgets(context, groupHFactor)),
                  ),
                  Container(
                    height: height * 0.015,
                  ),
                  Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Container(
                          width: width * 0.98,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            log('Show All Public Groups');
                          },
                          child: const AnimatedGradientButton(),
                        )
                      ]),
                  Container(
                      height: height * 0.015,
                      child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom *
                                  0.5))),
                  contact(
                    context,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: bottomNavBar(context),
            ),
          ],
        ),
      ),
    );
  }

  // #################     Functions       #################################################################

  // #######################################################################################################

  Widget contact(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width * 0.98,
      height: 140,
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 130),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '   What do you want us to list next?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              '     Suggest us a subscription',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  child: const Center(
                    widthFactor: 0.5,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                        border: InputBorder.none,
                        hintText: 'Give your suggestion',
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ],
            ),
          ]),
    );
  }

  Widget playAndEarn(BuildContext ctx) {
    return Container(
        width: width * 0.95,
        height: height / 15,
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 64, 83, 116), width: 2),
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black,
                  Color.fromARGB(255, 4, 33, 59),
                ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: imagesAssets['coin'],
            ),
            const Text(
              'Play and earn coins ',
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w500,
               fontSize: 25),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white, size: 30),
          ],
        ));
  }

  Widget bottomNavBar(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          //  B Nav Bar shape

          CustomPaint(
            size: Size(width, height / 15),
            painter: BNBCustomPainter(),
          ),

          // B Nav Bar Icons
          Container(
            height: height / 11,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottomNavBarIcon(context, 1, Icons.home, 'Home'),
                    bottomNavBarIcon(context, 0, Icons.explore, 'Explore'),
                    const SizedBox(width: 80),
                    bottomNavBarIcon(context, 2, Icons.chat_bubble, 'Chat'),
                    bottomNavBarIcon(
                        context, 3, Icons.account_balance_wallet, 'Wallet'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: imagesAssets['subSpace'],
                    ),
                    const SizedBox(height: 0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavBarIcon(
      BuildContext context, int index, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              setPage(index);
            });
          },
          icon: Icon(icon,
              color: pageIndex == index
                  ? Theme.of(context).colorScheme.outline
                  : Colors.white),
        ),
        Text(
          label,
          style: TextStyle(
            color: pageIndex == index
                ? Theme.of(context).colorScheme.outline
                : Colors.white,
            fontFamily: 'penSans',
            fontWeight: FontWeight.w800
          ),
        ),
      ],
    );
  }

  List<Widget> groupsWidget =
      List<Widget>.filled(groups.length, const Placeholder());
  bool groupsListCreated = false;
  List<Widget> groupsWidgets(BuildContext ctx, double groupHFactor) {
    //if(groupsListCreated) return groupsWidget;
    for (int i = 0; i < groups.length; i++) {
      groupsWidget[i] = groupWidget(context, groups[i], groupHFactor);
    }
    groupsListCreated = true;
    return groupsWidget;
  }

  Widget groupWidget(BuildContext ctx, Group group, double groupHFactor) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
        color: Theme.of(context).colorScheme.background,
        height: height / groupHFactor,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 0),
                      SizedBox(
                          height: height / groupHFactor - 10,
                          width: height / groupHFactor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(height: 0),
                              Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    CircleAvatar(
                                      radius: (height / groupHFactor - 30) / 2,
                                      backgroundImage: group.logo,
                                    ),
                                    CircleAvatar(
                                      radius: (height / groupHFactor - 70) / 2,
                                      backgroundImage: group.creatorImage,
                                    ),
                                  ]),
                              const SizedBox(height: 0),
                            ],
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(group.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'penSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          SizedBox(height: 5),
                          Text('by ${group.creator}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 10,
                                fontFamily: 'penSans',
                                color: Colors.white,
                              )),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '${group.currentMemberCount} / ${group.requiredMemberCount} ',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 170, 204, 255),
                                    fontSize: 15),
                              ),
                              const Text(
                                'friends sharing',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 170, 204, 255),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '₹ ${group.amount} / User / ${group.timeSpan}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).colorScheme.outline),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () {},
                              child: const Text('       Join        '))
                        ],
                      ),
                      const SizedBox(width: 0),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: group.currentMemberCount / group.requiredMemberCount,
                    color: Theme.of(context).colorScheme.outline,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  )
                ],
              ),
              Card(
                color: Theme.of(context).colorScheme.tertiary,
                child: Text(
                  '  ${group.similarGroups} + groups  ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  ListView subscriptionsSlideView() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: offers.length,
      itemBuilder: ((context, index) {
        Offer o = offers[index];
        return Container(
          margin: const EdgeInsets.all(3),
          width: width * 0.98 / 2,
          height: width / 1.5,
          child: InkWell(
            onTap: () {
              log(o.title);
            },
            child: Stack(
              clipBehavior: Clip.antiAlias,
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: o.image,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(1, 0, 0, 0),
                          Color.fromARGB(1, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ]),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Column(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                            color: Theme.of(context).colorScheme.tertiary,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                const Text(
                                  'UPTO',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  '  ${o.offer}%  ',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const Text(
                                  'OFF',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                const SizedBox(height: 5),
                              ],
                            )),
                        const SizedBox(
                          width: 95,
                        ),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: o.logo,
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              o.title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Starting at ₹${o.price}',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget headingsWithButton(BuildContext context, String text) {
    return Container(
      height: height / 15,
      width: width,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 0,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 22),
            ),
            SizedBox(width: width / 4),
            Container(
              height: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 55, 55, 55),
                        Color.fromARGB(255, 74, 74, 74),
                      ])),
              child: TextButton(
                  onPressed: () {
                    log('See More');
                  },
                  child: Text(
                    "See More",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface),
                  )),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  Widget highlightSlideShow(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      height: height / 4,
      child: PageView.builder(
        clipBehavior: Clip.antiAlias,
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.down,
        controller: PageController(
          initialPage: 99,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          int i = index % highlights.length;
          Highlight h = highlights[i];
          return Card(
            child: InkWell(
              onTap: () {
                log(h.id);
              },
              child: Container(
                //clipBehavior: Clip.antiAlias,
                width: width,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: highlights[i].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

double height = 0;
double width = 0;

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double y = height / 60;
    Paint paintG = Paint()
      ..color = const Color.fromARGB(255, 26, 26, 26)
      ..style = PaintingStyle.fill;
    Paint paintB = Paint()
      ..color = const Color.fromARGB(255, 63, 81, 181)
      ..style = PaintingStyle.fill;

    double graySize = 1.5;
    double circleSize = 100;
    double circleCenter = 70;
    var rG = Rect.fromLTRB(0, -graySize, size.width, 600);
    Offset cG = Offset(width / 2, circleCenter + 2 - graySize);
    var rB = Rect.fromLTRB(0, 0, size.width, 600);
    Offset cB = Offset(width / 2, circleCenter);

    canvas.drawRect(rG, paintB);
    canvas.drawCircle(cG, circleSize + graySize + 1, paintB);

    canvas.drawRect(rB, paintG);
    canvas.drawCircle(cB, circleSize, paintG);
  }

  @override
  bool shouldRepaint(BNBCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BNBCustomPainter oldDelegate) => false;
}

class AnimatedGradientButton extends StatefulWidget {
  const AnimatedGradientButton({super.key});

  @override
  State<StatefulWidget> createState() => AnimatedGradientButtonState();
}

class AnimatedGradientButtonState extends State<AnimatedGradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  void repeat() async {
    await _animationController.forward();
    await _animationController.reverse();
    repeat();
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animation = Tween(
      begin: 0.1,
      end: 0.9,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    repeat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 60,
      width: width * 0.98,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        child: Stack(
          children: [
            ShaderMask(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: const Center(
                        child: Text('Show All Public Groups',
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
                shaderCallback: (rect) {
                  return LinearGradient(stops: [
                    0.01,
                    _animation.value,
                    0.95
                  ], colors: const [
                    Colors.orange,
                    Colors.white,
                    Colors.green,
                  ]).createShader(rect);
                }),
          ],
        ),
      ),
    );
  }
}
