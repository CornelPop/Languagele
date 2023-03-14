import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'Languages.dart';
import 'Hints.dart';
import 'dart:math';
import 'package:first/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'DataForTextField.dart';
import 'package:is_first_run/is_first_run.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const SplashScreen());
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const StartPage(),
      duration: 3000,
      imageSize: 230,
      imageSrc: "assets/GameLogo_2.png",
      backgroundColor: Colors.white);
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  bool isLoading = false;
  String appRate = '';
  Icon? emoji;
  Icon star1Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  Icon star2Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  Icon star3Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  Icon star4Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  Icon star5Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);



  void fillStars1 () {
    star1Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star2Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
    star3Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
    star4Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
    star5Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  }
  void fillStars2 () {
    star1Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star2Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star3Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
    star4Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
    star5Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  }
  void fillStars3 () {
    star1Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star2Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star3Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star4Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
    star5Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  }
  void fillStars4 () {
    star1Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star2Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star3Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star4Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star5Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
  }
  void fillStars5 () {
    star1Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star2Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star3Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star4Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
    star5Rate = const Icon(Icons.star, size: 35, color: Colors.teal);
  }

  final myControllerName = TextEditingController();
  final myControllerSentence = TextEditingController();
  final myControllerOpinion = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  Future<void> sendEmailSentence() async {
    const serviceId = 'service_4wejtie';
    const templateId = 'template_c0g3vmb';
    const userId = 'z2swDcLIPp9H0pa6e';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': myControllerName.text,
          'user_message': myControllerSentence.text,
        }
      }),
    );
  }

  Future<void> sendEmailReview() async {
    const serviceId = 'service_4wejtie';
    const templateId = 'template_opfo9rj';
    const userId = 'z2swDcLIPp9H0pa6e';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_rate': appRate,
          'user_opinion': myControllerOpinion.text,
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) => isLoading
      ?const LoadingPage()
      : Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            IconButton(
              splashColor: Colors.lightBlueAccent,
              tooltip: 'Help',
              icon: const Icon(Icons.info),
              iconSize: 25,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                );
              },
            ),
            const Spacer(),
            IconButton(
              splashColor: Colors.lightBlueAccent,
              tooltip: 'Profile',
              icon: const Icon(Icons.account_circle_sharp),
              iconSize: 25,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
      body: Column(
          children: <Widget>[
            Image.asset('assets/GameLogo_2.png'),
            Container(
              height: 70,
            ),
            SizedBox(
                width: 170,
                height: 80,
                child: ElevatedButton(
                  child: const Text('START!'),
                  onPressed: () async {
                    setState(() => isLoading = true);
                    await Future.delayed(const Duration(seconds: 3));
                    setState(() => isLoading = false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Languagele()),
                    );
                  },
                )
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.teal[50],
                              title: const Text('Add your sentence!', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                              content: SizedBox(
                                  height: 250,
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('Write here a sentence in your own language and it might be included in the game.', textAlign: TextAlign.center),
                                        Container(height: 20),
                                        GestureDetector(
                                          child: TextFormField(
                                            maxLength: 100,
                                            validator: (value) {
                                              if (value != null && value.isEmpty)
                                                {
                                                  return 'Please enter your name';
                                                }
                                              return null;
                                            },
                                            cursorColor: Colors.teal,
                                            controller: myControllerName,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter your name',
                                            ),
                                          ),
                                        ),
                                        Container(height: 10),
                                        TextFormField(
                                          maxLength: 100,
                                          validator: (value) {
                                            if (value != null && value.isEmpty)
                                            {
                                              return 'Please enter your sentence';
                                            }
                                            return null;
                                          },
                                          cursorColor: Colors.teal,
                                          controller: myControllerSentence,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a sentence',
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                              elevation: 24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Back'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (!formKey.currentState!.validate())
                                      {
                                        return;
                                      }
                                    sendEmailSentence();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Submit'),
                                )
                              ],
                            )
                        );
                        myControllerName.clear();
                        myControllerSentence.clear();
                      },
                      child: const Text('Add sentences!', textAlign: TextAlign.center,)
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.teal[50],
                              title: const Text('Rate the game!', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                              content: StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return SizedBox(
                                        height: 220,
                                        child: Form(
                                          key: formKey2,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  IconButton(
                                                    onPressed: () {
                                                      fillStars1();
                                                      appRate = 'Poor!';
                                                      emoji = const Icon(Icons.sentiment_very_dissatisfied_outlined, size: 35, color: Colors.teal);
                                                      setState(() {});
                                                    },
                                                    icon: star1Rate,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      fillStars2();
                                                      appRate = 'Fair!';
                                                      emoji = const Icon(Icons.sentiment_dissatisfied, size: 35, color: Colors.teal);
                                                      setState(() {});
                                                    },
                                                    icon: star2Rate,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      fillStars3();
                                                      appRate = 'Acceptable!';
                                                      emoji = const Icon(Icons.sentiment_neutral, size: 35, color: Colors.teal);
                                                      setState(() {});
                                                    },
                                                    icon: star3Rate,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      fillStars4();
                                                      appRate = 'Good!';
                                                      emoji = const Icon(Icons.sentiment_satisfied_alt, size: 35, color: Colors.teal);
                                                      setState(() {});
                                                    },
                                                    icon: star4Rate,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      fillStars5();
                                                      appRate = 'Outstanding!';
                                                      emoji = const Icon(Icons.sentiment_very_satisfied_outlined, size: 35, color: Colors.teal);
                                                      setState(() {});
                                                    },
                                                    icon: star5Rate,
                                                  ),
                                                ],
                                              ),
                                              Container(height: 10),
                                              Text(appRate, style: const TextStyle(fontSize: 20)),
                                              Container(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(child: emoji),
                                                  SizedBox(child: emoji),
                                                  SizedBox(child: emoji),
                                                ],
                                              ),
                                              Container(height: 10),
                                              TextFormField(
                                                maxLength: 100,
                                                validator: (value) {
                                                  if (value != null && value.isEmpty)
                                                  {
                                                    return 'Please enter your opinion';
                                                  }
                                                  return null;
                                                },
                                                cursorColor: Colors.teal,
                                                controller: myControllerOpinion,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Enter your opinion',
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    );
                                  }
                              ),
                              elevation: 24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Back'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (!formKey2.currentState!.validate())
                                    {
                                      return;
                                    }
                                    Navigator.pop(context);
                                    sendEmailReview();
                                    },
                                  child: const Text('Submit'),
                                )
                              ],
                            )
                        );
                        myControllerOpinion.clear();
                        appRate = '';
                        emoji = null;
                        star1Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
                        star2Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
                        star3Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
                        star4Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
                        star5Rate = const Icon(Icons.star_border, size: 35, color: Colors.teal);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text('Rate the app! '),
                          Icon(Icons.star)
                        ],
                      )
                  ),
                ),
                const Spacer(),
              ],
            )
          ]
      ),
      backgroundColor: Colors.white,
    );

}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitFoldingCube(
          size: 50,
          color: Colors.teal[200],
        ),
      )
    );
  }
}

class Languagele extends StatefulWidget {
  const Languagele({Key? key}) : super(key: key);

  @override
  LanguageleState createState() => LanguageleState();
}

class LanguageleState extends State<Languagele> {

  /*late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState (){
    super.initState();
    _initBannerAd();
  }

  _initBannerAd()
  {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-2655085548618220/2361654748',
      listener: BannerAdListener(
          onAdLoaded: (ad){
            setState((){
              _isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {}
      ),
      request: AdRequest(),
    );
    _bannerAd.load();
  }*/

  final formKey3 = GlobalKey<FormState>();

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[50],
        title: const Text('Alert', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
        content: const SizedBox(
            height: 80,
            child: Center(
              child: Text('You can not press this button here! You need to finish this round,'
                  ' or to press the "Home" button in the bottom bar.', textAlign: TextAlign.center, style: const TextStyle(fontSize: 17)),
            )
        ),
        elevation: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Ok'),
          ),
        ],
      )
    )) ??
        false;
  }

  late final int sentence;

  int counter = 0;

  void _incrementCounter() {
      counter++;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
        color: Colors.teal[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              IconButton(
                tooltip: 'Home',
                splashColor: Colors.lightBlueAccent,
                icon: const Icon(Icons.home),
                iconSize: 25,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
            ],
          ),
        ),
        body: buildScroll(),
        backgroundColor: Colors.white,
      ),
    );

  }

  String firstAttempt = "";
  String secondAttempt = "";
  String thirdAttempt = "";

  int correctGuesses = 0;

  String language1 = "";
  String language2 = "";
  String language3 = "";

  bool alreadyOpenedOnce = false;
  bool alreadyOpenedTwice = false;
  bool alreadyUpdateStatistics = false;

  final ScrollController scrollController = ScrollController();

  Widget buildGame() {

    var myController = TextEditingController();

    @override
    void dispose() {
      myController.dispose();
      super.dispose();
    }

    int nextNumber({required int min, required int max}) =>
        min + Random().nextInt(max - min + 1);

    int rowNumber = Random().nextInt(5);
    int columnNumber = nextNumber(min: 1, max: 10);
    int columnNumberHints = nextNumber(min: 1, max: 10);
    final String language = languageMatrix[rowNumber][0];
    final sentence = languageMatrix[rowNumber][columnNumber];
    final String languageLowerCases = language.toLowerCase();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Image.asset('assets/GameLogo_2.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black)
            ),
            height: 125,
            child: Center(
                child: language == 'Arabic'
                    ? Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          sentence,
                          style: const  TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,),
                      )
                    : Text(
                          sentence,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,),
            ),
          ),
        ),
        Container(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: SizedBox(
                  width: 80,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),),
                    onPressed: () {
                      if (alreadyOpenedOnce == false && alreadyOpenedTwice == false) {
                        showDialog<String>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.teal[50],
                              title: const Text('Hint / Fun Fact', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                              content: SizedBox(
                                  height: 130,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(hintMatrix[rowNumber][columnNumberHints], textAlign: TextAlign.center, style: const TextStyle(fontSize: 17)),
                                        Container(height: 10),
                                        const Text('You have 1 hint left!', textAlign: TextAlign.center, style: TextStyle(fontSize: 17))
                                      ]
                                  )
                              ),
                              elevation: 24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                  Navigator.pop(context);
                                  alreadyOpenedOnce = true;
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            )
                        );
                      }
                      else if (alreadyOpenedOnce == true && alreadyOpenedTwice == false)
                      {
                        showDialog<String>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.teal[50],
                              title: const Text('Hint / Fun Fact', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                              content: SizedBox(
                                  height: 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(hintMatrix[rowNumber][columnNumberHints], textAlign: TextAlign.center, style: const TextStyle(fontSize: 17),),
                                      Container(height: 10),
                                      const Text('You have 0 hints left!', textAlign: TextAlign.center, style: TextStyle(fontSize: 17))
                                    ]
                                  )
                              ),
                              elevation: 24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    alreadyOpenedOnce = true;
                                    alreadyOpenedTwice = true;
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            )
                        );
                      }
                      else if (alreadyOpenedTwice == true && alreadyOpenedOnce == true)
                      {
                        showDialog<String>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.teal[50],
                              title: const Text('Alert', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                              content: const SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text('You already used the hints for this round!', textAlign: TextAlign.center, style: const TextStyle(fontSize: 17)),
                                  )
                              ),
                              elevation: 24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            )
                        );
                      }
                    },
                    child: const Center(child: Text('Hint')),
                  ),
                ),
              ),
              Form(
                key: formKey3,
                child: SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        if (scrollController.hasClients) {
                          scrollController.animateTo(
                              scrollController.position.minScrollExtent,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: TypeAheadFormField(
                        enabled: true,
                        validator: (value) {
                          if (value != null && value.isEmpty)
                          {
                            return 'Please enter a language!';
                          }
                          return null;
                        },
                        noItemsFoundBuilder: (context) => const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text('No languages found!'),
                          ),
                        ),
                        textFieldConfiguration: TextFieldConfiguration(
                          maxLength: 12,
                          cursorColor: Colors.teal,
                          controller: myController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a language',
                            ),
                          ),
                        debounceDuration: const Duration(milliseconds: 400),
                        suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                            color: Colors.white,
                            elevation: 4.0,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )
                        ),
                        suggestionsCallback: (value) {
                          return LanguageService.getSuggestions(value);
                        },
                        itemBuilder: (context, String suggestion) {
                          return Flexible(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.grey)
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Center(
                                      child: Text(
                                        suggestion,
                                        style: const TextStyle(fontSize: 16),
                                        maxLines:1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                        },
                        onSuggestionSelected: (String suggestion) {
                            myController.text = suggestion;
                        },
                      ),
                    )
                  ),
              ),
              //const Padding(padding: EdgeInsets.all(5.0)),
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: SizedBox(
                  width: 80,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {
                      if (!formKey3.currentState!.validate())
                      {
                        return;
                      }
                      _incrementCounter();
                      if (counter >= 1 && counter <= 3 )
                          {
                            myController.text = myController.text.trim();
                            if (myController.text == language || myController.text == languageLowerCases)
                            {
                              if (counter == 1)
                              {
                                language1 = language;
                                firstAttempt = myController.text;
                                correctGuesses++;
                              }
                              if (counter == 2)
                              {
                                language2 = language;
                                secondAttempt = myController.text;
                                correctGuesses++;
                              }
                              if (counter == 3)
                              {
                                language3 = language;
                                thirdAttempt = myController.text;
                                correctGuesses++;
                              }
                            }
                            else
                            {
                              if (counter == 1)
                              {
                                language1 = language;
                                firstAttempt = myController.text;
                              }
                              if (counter == 2)
                              {
                                language2 = language;
                                secondAttempt = myController.text;
                              }
                              if (counter == 3)
                              {
                                language3 = language;
                                thirdAttempt = myController.text;
                              }
                            }
                          }
                      if (counter == 3)
                      {
                        if (correctGuesses == 0)
                          {
                            showDialog<String>(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.teal[50],
                                  title: const Text('Your Score', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                                  content: SizedBox(
                                      height: 300,
                                      child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const <Widget>[
                                                Icon(Icons.star_border, size: 70, color: Colors.teal),
                                                Icon(Icons.star_border, size: 70, color: Colors.teal),
                                                Icon(Icons.star_border, size: 70, color: Colors.teal),
                                              ],
                                            ),
                                            Container(height: 5),
                                            Text('Sentence 1: $language1', textAlign: TextAlign.center),
                                            Text('Answer 1: $firstAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            Text('Sentence 2: $language2', textAlign: TextAlign.center),
                                            Text('Answer 2: $secondAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            Text('Sentence 3: $language3', textAlign: TextAlign.center),
                                            Text('Answer 3: $thirdAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            const Text('Check your profile to see your total number of stars, or go back home and start a new round!', textAlign: TextAlign.center,),
                                            /*_isAdLoaded
                                                ? SizedBox(
                                              height: _bannerAd.size.height.toDouble(),
                                              width: _bannerAd.size.width.toDouble(),
                                              child: AdWidget(ad: _bannerAd),
                                            )
                                                :const SizedBox(),*/
                                          ]
                                      )
                                  ),
                                  elevation: 24,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  actionsAlignment: MainAxisAlignment.spaceAround,
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        if (alreadyUpdateStatistics == false) {
                                          getOldStarsNumber();
                                          updateStarsNumber();
                                          getOldZeroStarsNumber();
                                          updateZeroStarsNumber();
                                          getOldOneStarNumber();
                                          updateOneStarNumber();
                                          getOldTwoStarsNumber();
                                          updateTwoStarsNumber();
                                          getOldThreeStarsNumber();
                                          updateThreeStarsNumber();
                                          alreadyUpdateStatistics = true;
                                        }
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        },
                                      child: const Text('Home'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (alreadyUpdateStatistics == false) {
                                          getOldStarsNumber();
                                          updateStarsNumber();
                                          getOldZeroStarsNumber();
                                          updateZeroStarsNumber();
                                          getOldOneStarNumber();
                                          updateOneStarNumber();
                                          getOldTwoStarsNumber();
                                          updateTwoStarsNumber();
                                          getOldThreeStarsNumber();
                                          updateThreeStarsNumber();
                                          alreadyUpdateStatistics = true;
                                        }
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                                      },
                                      child: const Text('Profile'),
                                    ),
                                  ],
                                )
                            );
                          }
                        if (correctGuesses == 1)
                          {
                            showDialog<String>(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.teal[50],
                                  title: const Text('Your Score', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                                  content: SizedBox(
                                      height: 300,
                                      child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const <Widget>[
                                                Icon(Icons.star, size: 70, color: Colors.teal),
                                                Icon(Icons.star_border, size: 70, color: Colors.teal),
                                                Icon(Icons.star_border, size: 70, color: Colors.teal),
                                              ],
                                            ),
                                            Container(height: 5),
                                            Text('Sentence 1: $language1', textAlign: TextAlign.center),
                                            Text('Answer 1: $firstAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            Text('Sentence 2: $language2', textAlign: TextAlign.center),
                                            Text('Answer 2: $secondAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            Text('Sentence 3: $language3', textAlign: TextAlign.center),
                                            Text('Answer 3: $thirdAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            const Text('Check your profile to see your total number of stars, or go back home and start a new round!', textAlign: TextAlign.center,)
                                          ]
                                      )
                                  ),
                                  elevation: 24,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  actionsAlignment: MainAxisAlignment.spaceAround,
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        if (alreadyUpdateStatistics == false) {
                                        getOldStarsNumber();
                                        updateStarsNumber();
                                        getOldZeroStarsNumber();
                                        updateZeroStarsNumber();
                                        getOldOneStarNumber();
                                        updateOneStarNumber();
                                        getOldTwoStarsNumber();
                                        updateTwoStarsNumber();
                                        getOldThreeStarsNumber();
                                        updateThreeStarsNumber();
                                        alreadyUpdateStatistics = true;
                                        }
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Home'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (alreadyUpdateStatistics == false) {
                                          getOldStarsNumber();
                                          updateStarsNumber();
                                          getOldZeroStarsNumber();
                                          updateZeroStarsNumber();
                                          getOldOneStarNumber();
                                          updateOneStarNumber();
                                          getOldTwoStarsNumber();
                                          updateTwoStarsNumber();
                                          getOldThreeStarsNumber();
                                          updateThreeStarsNumber();
                                          alreadyUpdateStatistics = true;
                                        }
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                      },
                                      child: const Text('Profile'),
                                    ),
                                  ],
                                )
                            );
                          }
                        if (correctGuesses == 2)
                          {
                            showDialog<String>(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.teal[50],
                                  title: const Text('Your Score', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                                  content: SizedBox(
                                      height: 300,
                                      child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const <Widget>[
                                                Icon(Icons.star, size: 70, color: Colors.teal),
                                                Icon(Icons.star, size: 70, color: Colors.teal),
                                                Icon(Icons.star_border, size: 70, color: Colors.teal),
                                              ],
                                            ),
                                            Container(height: 5),
                                            Text('Sentence 1: $language1', textAlign: TextAlign.center),
                                            Text('Answer 1: $firstAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            Text('Sentence 2: $language2', textAlign: TextAlign.center),
                                            Text('Answer 2: $secondAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            Text('Sentence 3: $language3', textAlign: TextAlign.center),
                                            Text('Answer 3: $thirdAttempt', textAlign: TextAlign.center),
                                            Container(height: 5),
                                            const Text('Check your profile to see your total number of stars, or go back home and start a new round!', textAlign: TextAlign.center,)
                                          ]
                                      )
                                  ),
                                  elevation: 24,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  actionsAlignment: MainAxisAlignment.spaceAround,
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        if (alreadyUpdateStatistics == false) {
                                          getOldStarsNumber();
                                          updateStarsNumber();
                                          getOldZeroStarsNumber();
                                          updateZeroStarsNumber();
                                          getOldOneStarNumber();
                                          updateOneStarNumber();
                                          getOldTwoStarsNumber();
                                          updateTwoStarsNumber();
                                          getOldThreeStarsNumber();
                                          updateThreeStarsNumber();
                                          alreadyUpdateStatistics = true;
                                        }
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Home'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (alreadyUpdateStatistics == false) {
                                          getOldStarsNumber();
                                          updateStarsNumber();
                                          getOldZeroStarsNumber();
                                          updateZeroStarsNumber();
                                          getOldOneStarNumber();
                                          updateOneStarNumber();
                                          getOldTwoStarsNumber();
                                          updateTwoStarsNumber();
                                          getOldThreeStarsNumber();
                                          updateThreeStarsNumber();
                                          alreadyUpdateStatistics = true;
                                        }
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                      },
                                      child: const Text('Profile'),
                                    ),
                                  ],
                                )
                            );
                          }
                      if (correctGuesses == 3)
                        {
                          showFireworks();
                          showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Colors.teal[50],
                                title: const Text('Your Score', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                                content: SizedBox(
                                    height: 300,
                                    child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const <Widget>[
                                              Icon(Icons.star, size: 70, color: Colors.teal),
                                              Icon(Icons.star, size: 70, color: Colors.teal),
                                              Icon(Icons.star, size: 70, color: Colors.teal),
                                            ],
                                          ),
                                          Container(height: 5),
                                          Text('Sentence 1: $language1', textAlign: TextAlign.center),
                                          Text('Answer 1: $firstAttempt', textAlign: TextAlign.center),
                                          Container(height: 5),
                                          Text('Sentence 2: $language2', textAlign: TextAlign.center),
                                          Text('Answer 2: $secondAttempt', textAlign: TextAlign.center),
                                          Container(height: 5),
                                          Text('Sentence 3: $language3', textAlign: TextAlign.center),
                                          Text('Answer 1: $thirdAttempt', textAlign: TextAlign.center),
                                          Container(height: 5),
                                          const Text('Check your profile to see your total number of stars, or go back home and start a new round!', textAlign: TextAlign.center,)
                                        ]
                                    )
                                ),
                                elevation: 24,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                actionsAlignment: MainAxisAlignment.spaceAround,
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      if (alreadyUpdateStatistics == false) {
                                      getOldStarsNumber();
                                      updateStarsNumber();
                                      getOldZeroStarsNumber();
                                      updateZeroStarsNumber();
                                      getOldOneStarNumber();
                                      updateOneStarNumber();
                                      getOldTwoStarsNumber();
                                      updateTwoStarsNumber();
                                      getOldThreeStarsNumber();
                                      updateThreeStarsNumber();
                                      alreadyUpdateStatistics = true;
                                      }
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Home'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (alreadyUpdateStatistics == false) {
                                        getOldStarsNumber();
                                        updateStarsNumber();
                                        getOldZeroStarsNumber();
                                        updateZeroStarsNumber();
                                        getOldOneStarNumber();
                                        updateOneStarNumber();
                                        getOldTwoStarsNumber();
                                        updateTwoStarsNumber();
                                        getOldThreeStarsNumber();
                                        updateThreeStarsNumber();
                                        alreadyUpdateStatistics = true;
                                      }
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                    },
                                    child: const Text('Profile'),
                                  ),
                                ],
                              )
                          );
                        }
                      }
                      myController.clear();
                      setState((){});
                    },
                    child: const Center(child: Text(' Guess')),
                  ),
                ),
              ),
            ]
          ),
        Container(height: 10),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.teal[200],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    const Text('Sentence 1/3: '),
                    Text(firstAttempt)
                  ]
              )
            )
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      const Text('Sentence 2/3: '),
                      Text(secondAttempt)
                    ]
                )
            )
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      const Text('Sentence 3/3: '),
                      Text(thirdAttempt)
                    ]
                )
            )
        ),
        Container(
          height: 10,
        ),
        FloatingActionButton(
          backgroundColor: Colors.teal[300],
          onPressed: () {
            showDialog<String>(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.teal[50],
                  title: const Text('Need help?', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                  content: const SizedBox(
                    height: 300,
                    child: Center(
                      child: Text("All you have to do in this step is to look carefully "
                          "at the sentence above and try to guess in which language it "
                          "is written. Your answer will start with a capital letter "
                          "(for example: 'English', 'Romanian', etc.). If you are not sure"
                          " of your answer or you can't think of any answer, press the"
                          " 'Hint' button to get a hint. After that, press the 'Guess' "
                          "button, so that your answer is recorded. You will have 3 "
                          "sentences where you have to guess the language in which they "
                          "are written, and each correct answer is worth one star.",
                        textAlign: TextAlign.center,
                      )
                    ),
                  ),
                  elevation: 24,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    ),
                  ],
                )
            );
          },
          child: const Icon(Icons.question_mark),
        ),
        Container(height: 10,)
      ]
    );
  }

  Widget buildScroll () {
    return SingleChildScrollView(
      controller: scrollController,
      child: buildGame(),
    );
  }

  Future<int> getOldStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldStarsNumber = (pref.getInt('keyStarsNumber') ?? 0);
    return oldStarsNumber;
  }

  Future<void> updateStarsNumber() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldStarsNumber = await getOldStarsNumber();
    int starsNumber = correctGuesses + oldStarsNumber;
    pref.setInt('keyStarsNumber', starsNumber);
  }

  Future<int> getOldZeroStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldZeroStarsNumber = (pref.getInt('keyZeroStarsNumber') ?? 0);
    return oldZeroStarsNumber;
  }

  Future<void> updateZeroStarsNumber() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldZeroStarsNumber = await getOldZeroStarsNumber();
    int zeroStarsNumber = oldZeroStarsNumber;
    if (correctGuesses == 0)
      {
        zeroStarsNumber = (zeroStarsNumber+ 1);
      }
    pref.setInt('keyZeroStarsNumber', zeroStarsNumber);
  }

  Future<int> getOldOneStarNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldOneStarNumber = (pref.getInt('keyOneStarNumber') ?? 0);
    return oldOneStarNumber;
  }

  Future<void> updateOneStarNumber() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldOneStarNumber = await getOldOneStarNumber();
    int oneStarNumber = oldOneStarNumber;
    if (correctGuesses == 1)
      {
        oneStarNumber = (oneStarNumber+ 1);
      }
    pref.setInt('keyOneStarNumber', oneStarNumber);
  }

  Future<int> getOldTwoStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldTwoStarsNumber = (pref.getInt('keyTwoStarsNumber') ?? 0);
    return oldTwoStarsNumber;
  }

  Future<void> updateTwoStarsNumber() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldTwoStarsNumber = await getOldTwoStarsNumber();
    int twoStarsNumber = oldTwoStarsNumber;
    if (correctGuesses == 2)
      {
        twoStarsNumber = (twoStarsNumber+ 1);
      }
    pref.setInt('keyTwoStarsNumber', twoStarsNumber);
  }

  Future<int> getOldThreeStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldThreeStarsNumber = (pref.getInt('keyThreeStarsNumber') ?? 0);
    return oldThreeStarsNumber;
  }

  Future<void> updateThreeStarsNumber() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int oldThreeStarsNumber = await getOldThreeStarsNumber();
    int threeStarsNumber = oldThreeStarsNumber;
    if (correctGuesses == 3)
      {
        threeStarsNumber = (threeStarsNumber+ 1);
      }
    pref.setInt('keyThreeStarsNumber', threeStarsNumber);
  }


  OverlayEntry? entry;

  void showFireworks() {
    entry = OverlayEntry(
        builder: (context) => SizedBox(
          height: 10,
            child: Lottie.asset('assets/fireworks.json'))
    );

    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);

    Timer(const Duration(seconds: 2, milliseconds: 43), () {
      entry?.remove();
      entry = null;
    });
  }

}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  int? starsNumber;
  int? zeroStarsNumber;
  int? oneStarNumber;
  int? twoStarsNumber;
  int? threeStarsNumber;

  @override
  void initState() {
    super.initState();
    setStarsNumber();
    setZeroStarsNumber();
    setOneStarNumber();
    setTwoStarsNumber();
    setThreeStarsNumber();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My profile'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Center(child: Text('Statistics', style: TextStyle(fontSize: 30),)),
                )
            ),
            Container(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.star_border, size: 35),
                                Icon(Icons.star_border, size: 35),
                                Icon(Icons.star_border, size: 35),
                              ],
                            ),
                          ),
                          const Text('-----'),
                          Text('$zeroStarsNumber', style: const TextStyle(fontSize: 25),)
                        ]
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.star, size: 35),
                                Icon(Icons.star_border, size: 35),
                                Icon(Icons.star_border, size: 35),
                              ],
                            ),
                          ),
                          const Text('-----'),
                          Text('$oneStarNumber', style: const TextStyle(fontSize: 25),),
                        ]
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.star, size: 35),
                                Icon(Icons.star, size: 35),
                                Icon(Icons.star_border, size: 35),
                              ],
                            ),
                          ),
                          const Text('-----'),
                          Text('$twoStarsNumber', style: const TextStyle(fontSize: 25),),
                        ]
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.star, size: 35),
                                Icon(Icons.star, size: 35),
                                Icon(Icons.star, size: 35),
                              ],
                            ),
                          ),
                          const Text('-----'),
                          Text('$threeStarsNumber', style: const TextStyle(fontSize: 25),),
                        ]
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text('Total number of ', style: TextStyle(fontSize: 25),),
                                Icon(Icons.star, size: 35),
                              ],
                            ),
                          ),
                          const Text('-----'),
                          Text('$starsNumber', style: const TextStyle(fontSize: 25),),
                        ]
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    starsNumber = pref.getInt('keyStarsNumber');
    setState(() {

    });
  }

  Future<void> setZeroStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    zeroStarsNumber = pref.getInt('keyZeroStarsNumber');
    setState(() {

    });
  }

  Future<void> setOneStarNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    oneStarNumber = pref.getInt('keyOneStarNumber');
    setState(() {

    });
  }

  Future<void> setTwoStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    twoStarsNumber = pref.getInt('keyTwoStarsNumber');
    setState(() {

    });
  }

  Future<void> setThreeStarsNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    threeStarsNumber = pref.getInt('keyThreeStarsNumber');
    setState(() {

    });
  }

}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is this game?'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Container(
            height: 600,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black),
            ),
            child: Center(
                child: Column(
                  children: [
                    Container(height: 20,),
                    const Text('About this game', style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                    Container(height: 20,),
                    const Text('This game is a guessing game. The player will receive 3 '
                        'sentences, and he will have to say in which language those sentences '
                        'are written. There is only one attempt for each sentence, and each '
                        'correctly guessed language is worth one star. The goal of this game '
                        'is to get as many stars as possible in the application and become a '
                        'specialist linguist. Currently there are over 300 sentences that you'
                        ' can guess, in over 30 languages(English, Spanish, French, German, Chinese,'
                        ' Arabic and much more). You can enter sentences yourself'
                        ' in the application by pressing the "Add sentences!" button. Those '
                        'sentences will be reviewed by our team and if everything is ok, they '
                        'will be added to the game. By doing this, you will help increase the '
                        'complexity of the game. You can also add a review of the application'
                        ' and say what else you would like to see added to this game.', style: TextStyle(fontSize: 17), textAlign: TextAlign.center)
                  ],
                )),
          )
      ),
    );
  }
}
