import 'package:Quran/data/utils/data.dart';
import 'package:Quran/data/utils/style.dart';
import 'package:Quran/ui/about.dart';
import 'package:Quran/ui/listpage/ayatkursi.dart';
import 'package:Quran/ui/listpage/listalquran.dart';
import 'package:Quran/ui/listpage/listasmaul.dart';
import 'package:Quran/ui/listpage/listdoa.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_admob/firebase_admob.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  // static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   keywords: <String>[
  //     'İslam',
  //     'Quran',
  //     'pusula',
  //     'dua',
  //     'Çevirmek',
  //     'yorumlama'
  //   ],
  //   childDirected: true,
  //   nonPersonalizedAds: false,
  // );

  // BannerAd _bannerAd;
  // InterstitialAd _interstitialAd;
  //    int _coins = 0;
  // BannerAd createBannerAd() {
  //   return BannerAd(
  //     adUnitId: BannerAd.testAdUnitId,
  //     size: AdSize.banner,
  //     targetingInfo: targetingInfo,
  //     listener: (MobileAdEvent event) {
  //       print("BannerAd event $event");
  //     },
  //   );
  // }

  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //     adUnitId: InterstitialAd.testAdUnitId,
  //     targetingInfo: targetingInfo,
  //     listener: (MobileAdEvent event) {
  //       print("InterstitialAd event $event");
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    // _bannerAd = createBannerAd()..load();
    // RewardedVideoAd.instance.listener =
    //     (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
    //   print("RewardedVideoAd event $event");
    //   if (event == RewardedVideoAdEvent.rewarded) {
    //     setState(() {
    //       _coins += rewardAmount;
    //     });
    //   }
    // };
  }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    // _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: Drawers()),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    },
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          Static.appName,
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                expandedHeight: 150.0,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.6),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        'Alquran',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Doa Harian',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Asmaul Husna',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Ayat Kursi',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListAlquran(),
              ListDoa(),
              ListAsmaul(),
              AyatKursi(),
            ],
          ),
        ));
  }
}

class Drawers extends StatelessWidget {
  const Drawers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Text(
                'QuranTr',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              AppStyle.spaceH5,
              Text(
                '______________',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        ListTile(
            title: Text('About'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/about')),
        ListTile(
            title: Text('Settings'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/settings')),
        ListTile(
            title: Text('Kiblat'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.popAndPushNamed(context, '/kiblah')),
      ],
    );
  }
}
