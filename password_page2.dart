import 'package:flutter/material.dart';
// import 'package:lifelog/Password_page4.dart';

class PasswordPage2 extends StatefulWidget {
  const PasswordPage2({super.key});

  @override
  State<PasswordPage2> createState() => Passwordpage2State();
}

class Passwordpage2State extends State<PasswordPage2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
          body: ListView(
        children: [Subpage2()],
      )),
    );
  }
}

class Subpage2 extends StatefulWidget {
  const Subpage2({super.key});

  @override
  Subpage2State createState() => Subpage2State();
}

class Subpage2State extends State<Subpage2> {
  bool isChecked = false;
  bool isConfirmed = false;
  late TextEditingController _controller1, _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPassword2(context),
      ],
    );
  }

  Container buildPassword2(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(children: [
        buildTitle(),
        // !isConfirmed
        //     ? buildPassowrdText('비밀번호 새로 만들기')
        //     : const SizedBox.shrink(),
        buildPasswordChangedText(isConfirmed),
        !isConfirmed
            ? buildInstructionText('영문, 숫자 포함 8자 이상')
            : const SizedBox.shrink(),
        !isConfirmed
            ? buildPasswordField("새 비밀번호", _controller1, 240)
            : const SizedBox.shrink(),
        !isConfirmed
            ? buildPasswordField("비밀번호 재입력", _controller2, 290)
            : const SizedBox.shrink(),
        // !isConfirmed ? buildCheckmarkImage() : const SizedBox.shrink(),
        // !isConfirmed ? buildAllDevicesText() : const SizedBox.shrink(),
        // !isConfirmed ? buildCheckbox() : const SizedBox.shrink(),
        Positioned(
            left: 35,
            top: 366,
            child:
                buildSubmitButton(context, isConfirmed ? "Lifelog로 가기" : "전송")),
      ]),
    );
  }

  HeaderTitle buildTitle() {
    return const HeaderTitle(left: 285, top: 24);
  }

  PasswordChangedText buildPasswordChangedText(bool isConfirmed) {
    double textSize = isConfirmed ? 40.0 : 20.0;
    String text = isConfirmed ? '비밀번호가\n변경되었습니다.' : '비밀번호 새로 만들기';
    return PasswordChangedText(
        left: 35, top: 138, textSize: textSize, text: text);
  }

  PasswordText buildPassowrdText(String text) {
    return PasswordText(left: 35, top: 136, text: text);
  }

  InstructionText buildInstructionText(String text) {
    return InstructionText(left: 37, top: 167, text: text);
  }

  CustomTextField buildPasswordField(
      String placeholder, TextEditingController controller, double top) {
    return CustomTextField(
        left: 35, top: top, placeholder: placeholder, controller: controller);
  }

  // CheckmarkImage buildCheckmarkImage() {
  //   return const CheckmarkImage(
  //       left: 39, top: 364);
  // }

  AllDevicesText buildAllDevicesText() {
    return const AllDevicesText(left: 62, top: 340);
  }

  // CustomCheckbox buildCheckbox() {
  //   return CustomCheckbox(
  //       left: 35,
  //       top: 380,
  //       isChecked: isChecked,
  //       onChanged: (value) {
  //         setState(() {
  //           isChecked = value!;
  //         });
  //       });
  // }

  SubmitButton buildSubmitButton(BuildContext context, String text) {
    return SubmitButton(
      left: 35,
      top: 366,
      text: text,
      onPressed: () async {
        setState(() {
          if (isConfirmed == false) {
            // 서버에서 email 데이터 가져와서 비교
            isConfirmed = true;
          } else if (isConfirmed == true) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       // builder: (context) => const main_page(),
            //       ),
            // );
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
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
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

class CustomTextField extends StatelessWidget {
  final double left;
  final double top;
  final String placeholder;
  final TextEditingController controller;

  // super.key와의 차이를 모르겠다
  const CustomTextField(
      {required this.left,
      required this.top,
      required this.placeholder,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 320,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xFFBEBEBE)),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 17, bottom: 11),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.black, fontSize: 11),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Pretendard Variable',
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class AllDevicesText extends StatelessWidget {
  final double left;
  final double top;

  const AllDevicesText({required this.left, required this.top, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: const Text(
        '모든 기기에서 새 비밀번호로 로그인',
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}

// class CustomCheckbox extends StatefulWidget {
//   final double left;
//   final double top;
//   final bool isChecked;
//   final ValueChanged<bool?> onChanged;

//   const CustomCheckbox({
//     required this.left,
//     required this.top,
//     required this.isChecked,
//     required this.onChanged,
//     Key? key,
//   }) : super(key: key);

//   @override
//   CustomCheckboxState createState() => CustomCheckboxState();
// }

// class CustomCheckboxState extends State<CustomCheckbox> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: widget.left,
//       top: widget.top,
//       child: Checkbox(
//         value: widget.isChecked,
//         onChanged: widget.onChanged,
//         activeColor: Colors.black,
//         checkColor: Colors.white,
//         fillColor: MaterialStateProperty.resolveWith((states) {
//           if (states.contains(MaterialState.selected)) {
//             return Colors.black;
//           }
//           return null; // Use the default value.
//         }),
//       ),
//     );
//   }
// }

class CheckmarkImage extends StatelessWidget {
  final double left;
  final double top;

  const CheckmarkImage({Key? key, required this.left, required this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: const Placeholder(),
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

class PasswordChangedText extends StatelessWidget {
  final double left;
  final double top;
  final double textSize;
  final String text;

  const PasswordChangedText({
    Key? key,
    required this.left,
    required this.top,
    required this.textSize,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: SizedBox(
        width: 310,
        height: 143,
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF505050),
            fontSize: textSize,
            fontFamily: 'Pretendard Variable',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
