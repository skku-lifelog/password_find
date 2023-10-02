import 'package:flutter/material.dart';
import 'package:lifelog/password_page2.dart';
// import 'amplifyconfiguration.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_core/amplify_core.dart';

void main() {
  runApp(const PasswordPage1());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await _configureAmplify();
//   runApp(PasswordPage1());
// }

class LoginData {
  String email;
  String password;

  LoginData({
    required this.email,
    required this.password,
  });
}

class PasswordPage1 extends StatefulWidget {
  const PasswordPage1({Key? key}) : super(key: key);

  @override
  PasswordPage1State createState() => PasswordPage1State();
}

class PasswordPage1State extends State<PasswordPage1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
          body: ListView(
        children: [Subpage1()],
      )),
    );
  }
}

class Subpage1 extends StatefulWidget {
  const Subpage1({Key? key}) : super(key: key);

  @override
  Subpage1State createState() => Subpage1State();
}

class Subpage1State extends State<Subpage1> {
  TextEditingController emailController = TextEditingController();
  late String personalEmail;
  late TextEditingController _controller1;
  bool isConfirmed = false;

  // Future<bool> isEmailMatched() async {
  //   String? userEmailFromCognito = await getCognitoEmail();
  //   return emailController.text == userEmailFromCognito;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPassword1(context),
      ],
    );
  }

  Container buildPassword1(BuildContext context) {
    String instructionA = '메일을 받을 이메일을 입력하세요.';
    String instructionB = '이메일로 보내드린 6자리 인증 코드를 입력하세요.';
    String boxletterA = '비밀번호 변경';
    String boxletterB = '인증하기';

    TextStyle textStyle = const TextStyle(
      color: Color(0xFFBEBEBE),
      fontSize: 20,
      fontFamily: 'Pretendard Variable',
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: 390,
      height: 844,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(children: [
        buildTitle(),
        buildPassowrdText(isConfirmed ? '비밀번호 인증' : '비밀번호를 잊으셨나요?'),
        buildInstructionText(isConfirmed ? instructionB : instructionA),
        !isConfirmed ? buildEmailTextField() : const SizedBox.shrink(),
        !isConfirmed ? buildDomainText() : const SizedBox.shrink(),
        Positioned(
            left: 35,
            top: 366,
            child: buildSubmitButton(
                context, isConfirmed ? boxletterB : boxletterA)),
        isConfirmed
            ? Padding(
                padding: const EdgeInsets.fromLTRB(40, 249, 0, 0),
                child: SizedBox(
                  width: 292.19,
                  height: 58,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 204,
                        top: 45,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: buildPositionedText(
                              0,
                              0,
                              '인증번호 다시 보내기',
                              const TextStyle(
                                color: Color(0xFFBEBEBE),
                                fontSize: 10,
                                fontFamily: 'Pretendard Variable',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              )),
                        ),
                      ),
                      buildVerificationField(0, textStyle),
                      buildVerificationField(51, textStyle),
                      buildVerificationField(101, textStyle),
                      buildVerificationField(151, textStyle),
                      buildVerificationField(201, textStyle),
                      buildVerificationField(251, textStyle),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ]),
    );
  }

  HeaderTitle buildTitle() {
    return const HeaderTitle(left: 285, top: 24);
  }

  PasswordText buildPassowrdText(String text) {
    return PasswordText(left: 35, top: 136, text: text);
  }

  InstructionText buildInstructionText(String text) {
    return InstructionText(left: 37, top: 167, text: text);
  }

  DomainText buildDomainText() {
    return const DomainText(left: 245, top: 254);
  }

  CustomTextField buildEmailTextField() {
    return CustomTextField(left: 35, top: 240, controller: emailController);
  }

  SubmitButton buildSubmitButton(BuildContext context, String text) {
    return SubmitButton(
      left: 35,
      top: 366,
      text: text,
      onPressed: () async {
        personalEmail = "${emailController.text}@g.skku.edu";
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PasswordPage2(personalEmail),
        //   ),
        // );
        setState(() {
          if (isConfirmed == false) {
            // 서버에서 email 데이터 가져와서 비교
            isConfirmed = true;
          } else if (isConfirmed == true) {
            // email 동일화 로직 구현
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PasswordPage2(),
              ),
            );
          }
        });
      },
    );
  }
}

class HeaderTitle extends StatelessWidget {
  final double left;
  final double top;

  const HeaderTitle({super.key, required this.left, required this.top});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: const Text(
        'Lifelog',
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class PasswordText extends StatelessWidget {
  final double left;
  final double top;
  final String text;

  const PasswordText({
    super.key,
    required this.left,
    required this.top,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }
}

class InstructionText extends StatelessWidget {
  final double left;
  final double top;
  final String text;

  const InstructionText({
    super.key,
    required this.left,
    required this.top,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFFBEBEBE),
        ),
      ),
    );
  }
}

class DomainText extends StatelessWidget {
  final double left;
  final double top;

  const DomainText({super.key, required this.left, required this.top});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: const Text(
        '@ g.skku.edu',
        style: TextStyle(
          color: Color(0xFF505050),
          fontSize: 15,
          fontFamily: 'Pretendard Variable',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final double left;
  final double top;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.left,
    required this.top,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 201,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xFFBEBEBE)),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 17, bottom: 11),
        child: TextField(
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '이메일 입력',
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Pretendard Variable',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double left;
  final double top;
  final String text;

  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.left,
    required this.top,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 46,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFBEBEBE)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Pretendard Variable',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

Positioned buildPositionedText(
    double left, double top, String text, TextStyle style) {
  return Positioned(
    left: left,
    top: top,
    child: Text(
      text,
      style: style,
    ),
  );
}

Positioned buildVerificationField(double left, TextStyle textStyle) {
  return Positioned(
    left: left,
    top: 0,
    child: Container(
      width: 39,
      height: 38,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 28,
          child: TextField(
            textAlign: TextAlign.center,
            style: textStyle,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              border: InputBorder.none,
              hintText: '*',
              hintStyle: textStyle,
            ),
          ),
        ),
      ),
    ),
  );
}
