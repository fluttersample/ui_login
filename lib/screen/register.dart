import 'package:flutter/material.dart';
import 'package:ui_login/screen/login.dart';
import 'package:ui_login/widgets/text_field.dart';


class RegisterSc extends StatefulWidget {
  const RegisterSc({Key? key}) : super(key: key);

  @override
  _RegisterScState createState() => _RegisterScState();
}

class _RegisterScState extends State<RegisterSc> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> anim;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,
    duration: const Duration(milliseconds: 1500));
    anim = Tween<double>(
      end: 0,
      begin: 100
    ).animate(CurvedAnimation(parent: controller,
    curve: Curves.bounceOut,));
    controller.forward();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar =AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      toolbarHeight: 80,
      leadingWidth: 60,
      leading:  IconButton(icon: const Icon
        (Icons.arrow_back_outlined,size: 35,),
        color: Theme.of(context).textTheme.subtitle1!.color,
      onPressed: () => Navigator.of(context).pop(),),
    );
    SizedBox _marginBetween=
    const SizedBox(
      height: 30,
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 15
        ,left: 15),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height
                -kBottomNavigationBarHeight -
            appbar.preferredSize.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Text('ساخت حساب کابری'
                  ,style: Theme.of(context).textTheme.headline1,),
                ),
                Text('لطفا همه کادرها را پر کنید',
                style: Theme.of(context).textTheme.subtitle1,),
                const SizedBox(height: 50,),


                /// ------------------ \\\\


                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Column(
                        children: [

                           Transform.translate(
                             offset: Offset(anim.value,0),
                             child: const TextFieldWidget(
                                hint: '  نام و نام خانوادگی',
                                iconData: Icons.person_outline),
                           ),
                          _marginBetween,
                          Transform.translate(
                            offset: Offset(-anim.value,0),
                            child: const TextFieldWidget(hint: '  شماره تماس',
                                iconData: Icons.phone_android_outlined),
                          ),
                          _marginBetween,
                          Transform.translate(
                            offset: Offset(anim.value,0),
                            child: const TextFieldWidget(hint: 'رمز عبور',
                                iconData: Icons.lock_outlined),
                          ),
                          _marginBetween,
                          Transform.translate(
                           offset: Offset(-anim.value,0),
                            child: const TextFieldWidget(hint: '  تایید رمز عبور',
                                iconData: Icons.password_sharp),
                          ),
                        ],
                      );
                    },),




                /// -------------- \\\\




                const SizedBox(
                  height: 40,
                ),
                const Hero(
                  tag: 'button',
                  child: ButtonLogin(text: 'ثبت نام'),
                ),
                const Spacer(),
                BuildRichText(qText: 'از قبل حساب کاربری دارید ؟ ',
                    aText: 'ورود', function:(){
                  Navigator.of(context).pop();
                    } )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
