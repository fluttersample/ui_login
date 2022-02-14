import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_login/Theme/MyThemes.dart';
import 'package:ui_login/screen/register.dart';
import 'package:ui_login/widgets/text_field.dart';
import 'package:provider/provider.dart';


class LoginSc extends StatefulWidget {
  const LoginSc({Key? key}) : super(key: key);

  @override
  _LoginScState createState() => _LoginScState();
}

class _LoginScState extends State<LoginSc> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppBar appBar =AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
      leading:   const Directionality(
          textDirection: TextDirection.rtl,
          child: ChangeThemeButtonWidget()),


    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20,left: 20,
        top: 15),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                kBottomNavigationBarHeight -
            appBar.preferredSize.height,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(
                  child: Lottie.asset(
                    'assets/login.json',
                    height: 220,
                    repeat: true
                  ),
                ),
                 Text('ورود',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text('لطفا برای ادامه وارد شوید',
                style: Theme.of(context).textTheme.subtitle1,),
                const SizedBox(
                  height: 30,
                ),
                  const TextFieldWidget(iconData: Icons.email_outlined,
                      hint: ' نام کاربری خود را وارد کنید ',

                  ),
                const SizedBox(
                  height: 30,
                ),
                const TextFieldWidget(hint: ' رمز عبور ',
                    iconData: Icons.lock_outlined,
                hidePassword: true,),

                const SizedBox(
                  height: 30,
                ),
                const Hero(
                  tag: 'button',
                    child: ButtonLogin(text: 'ورود',)),
                const SizedBox(
                  height: 10,
                ),
                 Center(
                   child: Text('آیا رمز خود را فراموش کردید ؟'
                      ,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1
                     !.copyWith(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold
                    ),

                ),
                 ),
                const Spacer(),
                 BuildRichText(
                  qText: 'حساب کاربری ندارید ؟ ',
                  aText: 'ثبت نام',
                  function: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:
                            (context) => const RegisterSc(),));
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  final String text ;
  const ButtonLogin({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 60,
        child: TextButton(
            onPressed: () {

            },

            child: Text(text,
               style: Theme.of(context).textTheme.button,
            )),
      ),
    );
  }
}
class BuildRichText extends StatelessWidget {
  final String qText;
  final String aText;
  final Function? function;
  const BuildRichText({Key? key,
    required this.aText,
    required this.qText,
  required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: RichText(
          text:  TextSpan(
            text: qText,
            style: Theme.of(context).textTheme.subtitle1,
            children: <TextSpan>[
              TextSpan(text: aText,
                  style:  Theme
                      .of(context).
                  textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      function!.call();
                    }
              )
            ],
          ),
        )
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final themeProvider = Provider.of<ThemeProvider>(context,
              listen: false);
          themeProvider.toggleTheme(value);
        },);
  }
}
