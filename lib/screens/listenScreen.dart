import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_app/widgets/sectionGridWidget.dart';
import 'package:provider/provider.dart';
import '../widgets/sectionItemWidget.dart';
import '../widgets/sliderWidget.dart';
import '../model/listenSliderModel.dart';
import '../widgets/appBarWidget.dart';
import '../provider/sectionProvider.dart';

class ListenScreen extends StatefulWidget {
  @override
  _ListenScreenState createState() => _ListenScreenState();
}

class _ListenScreenState extends State<ListenScreen>
    with SingleTickerProviderStateMixin {
  var _isInit;
  var _isLoading;

  @override
  void initState() {
    super.initState();
    _isInit = true;
    _isLoading = false;

    tabController = TabController(length: 3, vsync: this);

    // Provider.of<Sections>(context).getSection("https://swapi.dev/api/people/4"); WONT WORK
    // Future.delayed(Duration.zero).then(
    //     (value) => {Sections().getSection("https://swapi.dev/api/people/4")});
  }

  @override
  void didChangeDependencies() {
    print(_isInit);
    print(_isLoading);
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProvideSection>(context)
          .getSection("https://swapi.dev/api/people/4")
          .then((_) => {
                setState(() {
                  _isLoading = false;
                })
              });
    }

    _isInit = false;

    print(_isInit);
    super.didChangeDependencies();
  }

  TabController tabController;

  final List<ListenSlider> sliderItem = [
    ListenSlider(
      title: "first",
      subtitle: "first pictue",
      image: "assets/images/recent.jpg",
    ),
    ListenSlider(
      title: "second",
      image: "assets/images/image1.jpeg",
      subtitle: "second pictue",
    ),
    ListenSlider(
      title: "third",
      image: "assets/images/image2.jpeg",
      subtitle: "third pictue",
    ),
    ListenSlider(
      title: "fouth",
      image: "assets/images/image3.jpeg",
      subtitle: "fourth pictue",
    ),
    ListenSlider(
      title: "fifth",
      image: "assets/images/image4.jpeg",
      subtitle: "fifth pictue",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double mobileWidth = MediaQuery.of(context).size.width;
    final sectionData = Provider.of<ProvideSection>(context);
    final section = sectionData.sectionItems;
    print("section");
    print(section);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarWidget(
        "Listen",
        "SAMSUNG Podcasts",
        Icon(Icons.search),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      "Recent",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/recent.jpg",
                              height: 150,
                              width: 150,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: CircleAvatar(
                                backgroundColor: Colors.black54,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "E236 Ghostly Dog",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Breath and a sardine a..",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "And thats why we drink",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white30),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliderWidget(mobileWidth, sliderItem),
                  // using provider
                  SectionGridWidget(section),
                  // using consumer
                  Consumer<ProvideSection>(
                    builder: (ctx, section, _) =>
                        SectionGridWidget(section.sectionItems),
                  ),
                  Text(
                    "hello",
                    style: TextStyle(fontSize: 10, color: Colors.white30),
                  )
                ],
              ),
            ),
    );
  }
}
