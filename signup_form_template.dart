import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultButton({
  double width = 280.0,
  double height = 64.0,
  String hexColor = '#045255',
  double borderRadius = 15.0,
  required Function()? onPressed,
  required String text,
  Color textColor = Colors.white,
  double fontSize = 25.0,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: HexColor(
      hexColor,
    ),
    borderRadius: BorderRadius.circular(
      borderRadius,
    ),
  ),
  child: MaterialButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    ),
  ),
);

Widget defaultTextFormField({
  double height = 50.0,
  Color color = Colors.white,
  double borderRadius = 15.0,
  required var controller,
  required TextInputType keyboardType,
  required String label,
  required bool isPassword,
  ValueChanged? onSubmit,
  required FormFieldValidator validate,
  bool labelIsOn = false,
  IconData? suffixIcon,
  Function()? suffixPressed,
}) => Container(
  height: height,
  padding: EdgeInsetsDirectional.only(
    start: 10.0,
  ),
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(
      borderRadius,
    ),
  ),
  child: TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: isPassword,
    onFieldSubmitted: onSubmit,
    validator: validate,

    decoration: InputDecoration(
      labelText: label,
      suffixIcon: suffixIcon != null ? IconButton(
        highlightColor: HexColor('#e3c099'),
        onPressed: suffixPressed,
        icon: Icon(
          suffixIcon,
        ),
      ) : null,
      floatingLabelBehavior: labelIsOn ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
      border: InputBorder.none,
    ),
  ),
);

bool signupIsPassword = true;
Widget defaultSignupForm({
  required GlobalKey<FormState> signupKey,
  required var usernameController,
  required var passwordController,
  required var confirmPasswordController,
  required Function()? onPressed,
  required Function()? suffixPressed,
  double padding = 25.0,
  double buttonFontSize = 25.0,
  double buttonWidth = 280.0,
  double buttonHeight = 64.0,
  double buttonBorderRadius = 15.0,
  double titleFontSize = 62.6,
  FontWeight titleFontWeight = FontWeight.w700,
  String title = 'SignUp',
  String usernameLabel = 'Username',
  String passwordLabel = 'Password',
  String confirmPasswordLabel = 'Confirm Password',
  String usernameValidateMessage = 'username should not be empty!',
  String passwordValidateMessage = 'password should not be empty!',
  String confirmPasswordValidateMessage = 'password should not be empty!',
  String buttonHexColor = '#045255',
  String buttonText = 'register',
  TextInputType usernameKeyboardType = TextInputType.text,
  TextInputType passwordKeyboardType = TextInputType.visiblePassword,
  IconData suffixOff = Icons.visibility_off,
  IconData suffixOn = Icons.visibility,
  Color buttonTextColor = Colors.white,
}) => Form(
  key: signupKey,
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: padding,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Text(
          title,
          style: TextStyle(
            fontWeight: titleFontWeight,
            fontSize: titleFontSize,

          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        defaultTextFormField(
          controller: usernameController,
          keyboardType: usernameKeyboardType,
          label: usernameLabel,
          isPassword: false,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return usernameValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        defaultTextFormField(
          controller: passwordController,
          keyboardType: passwordKeyboardType,
          label: passwordLabel,
          isPassword: signupIsPassword,
          suffixIcon: signupIsPassword ? suffixOff : suffixOn,
          suffixPressed: suffixPressed,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return passwordValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        defaultTextFormField(
          controller: confirmPasswordController,
          keyboardType: passwordKeyboardType,
          label: confirmPasswordLabel,
          isPassword: signupIsPassword,
          suffixIcon: signupIsPassword ? suffixOff : suffixOn,
          suffixPressed: suffixPressed,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return confirmPasswordValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: defaultButton(
            onPressed: onPressed,
            text: buttonText,
            textColor: buttonTextColor,
            fontSize: buttonFontSize,
            borderRadius: buttonBorderRadius,
            height: buttonHeight,
            width: buttonWidth,
            hexColor: buttonHexColor,
          ),
        ),
      ],
    ),
  ),
);
