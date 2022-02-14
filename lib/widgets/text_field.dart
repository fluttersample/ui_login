import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String _hint;
  final IconData _iconData;
  final bool _hidePassword;
    const TextFieldWidget({Key? key,
      required String hint ,
      required IconData iconData,
     bool hidePassword=false}) :
          _hint=hint,
          _iconData = iconData,
          _hidePassword=hidePassword,
          super(key: key) ;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final FocusNode _focus = FocusNode();
  Color fieldColor = Colors.white54;
  final TextEditingController _controller = TextEditingController(
  );
  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      setState(() {
        fieldColor = _focus.hasFocus ? Colors.blue : Colors.white54;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
      return SizedBox(
      height: 50,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          obscureText: widget._hidePassword,
          controller: _controller,
          focusNode: _focus,
          style: TextStyle(
            color: theme.textTheme.headline1!.color
          ),
          decoration: InputDecoration(
            labelText: widget._hint,
            floatingLabelStyle:  TextStyle(
              color: _focus.hasFocus ?Colors.blue : theme.textTheme.subtitle1!
                  .color,
              fontSize: 16

            ),
            labelStyle: Theme.of(context)
                .textTheme.subtitle1!.copyWith(
                fontSize: 16,
            ),
            prefixIcon:  Icon(widget._iconData,
           color: fieldColor,),
            focusedBorder: _inputBorder(theme.textTheme.subtitle1!.color!,30.0),
            enabledBorder: _inputBorder( _controller.text.isNotEmpty
                ? theme.colorScheme.onBackground:
            theme.textTheme.subtitle1!.color!
                ,20.0),


          ),
        ),
      ),
    );
  }
   _inputBorder(Color color, double radius)
  {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            color: color,
            width: 2
        )
    );
  }
}
