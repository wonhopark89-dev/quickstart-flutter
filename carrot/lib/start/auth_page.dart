import 'package:carrot/constants/common_size.dart';
import 'package:carrot/uilts/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:carrot/states/user_provider.dart';
import "package:provider/provider.dart";
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

const duration = Duration(milliseconds: 500);

class _AuthPageState extends State<AuthPage> {
  final inputBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  TextEditingController _phoneNumberController =
      TextEditingController(text: "010");

  TextEditingController _codeController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        return IgnorePointer(
          ignoring: _verificationStatus == VerificationStatus.verifying,
          child: Form(
            key: _formkey,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "전화번호 로그인",
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(common_padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ExtendedImage.asset(
                          "assets/imgs/carrot_bunny.jpeg",
                          width: size.width * 0.15,
                          height: size.width * 0.15,
                        ),
                        SizedBox(
                          width: common_small_padding,
                        ),
                        Text(
                          "당근마켓은 휴대폰 번호로 가입해요.\n번호는 안전하게 보관 되며\n어디에도 공개되지 않아요.",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: common_padding,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [MaskedInputFormatter("000 0000 0000")],
                      decoration: InputDecoration(
                          focusedBorder: inputBorder, border: inputBorder),
                      validator: (phoneNumber) {
                        if (phoneNumber != null && phoneNumber.length == 13) {
                          return null;
                        } else {
                          // error
                          // 리턴값이 에러메시지
                          return "전화번호를 올바르게 입력해주세요.";
                        }
                      },
                    ),
                    SizedBox(
                      height: common_small_padding,
                    ),
                    TextButton(
                        onPressed: () {
                          _getAddress();
                          // if (_formkey.currentState != null) {
                          //   bool passed = _formkey.currentState!.validate();
                          //   todo :fix
                          //   if (passed) {
                          //     setState(() {
                          //       _verificationStatus =
                          //           VerificationStatus.codeSent;
                          //     });
                          //   }
                          //   setState(() {
                          //     _verificationStatus = VerificationStatus.codeSent;
                          //   });
                          // }
                        },
                        child: Text("인증문자 발송")),
                    SizedBox(
                      height: common_padding,
                    ),
                    AnimatedOpacity(
                      duration: duration,
                      curve: Curves.easeInOut,
                      opacity: (_verificationStatus == VerificationStatus.none)
                          ? 0
                          : 1,
                      child: AnimatedContainer(
                        duration: duration,
                        curve: Curves.easeInOut,
                        height: getVerificationHeight(_verificationStatus),
                        child: TextFormField(
                          controller: _codeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [MaskedInputFormatter("000000")],
                          decoration: InputDecoration(
                              focusedBorder: inputBorder, border: inputBorder),
                          validator: (auth) {
                            if (auth != null && auth.length == 6) {
                              return null;
                            } else {
                              // error
                              // 리턴값이 에러메시지
                              return "인증번호 올바르게 입력해주세요.";
                            }
                          },
                        ),
                      ),
                    ),
                    AnimatedContainer(
                        duration: duration,
                        curve: Curves.easeInOut,
                        height: getVerificationBtnHeight(_verificationStatus),
                        child: TextButton(
                            onPressed: () {
                              attemptVerity();
                            },
                            child: (_verificationStatus ==
                                    VerificationStatus.verifying)
                                ? CircularProgressIndicator(color: Colors.black)
                                : Text("인증")))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double getVerificationHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 60 + common_small_padding;
    }
  }

  double getVerificationBtnHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 48;
    }
  }

  void attemptVerity() async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });
    // 로그인을 성공(true)으로 바꿔줌
    context.read<UserProvider>().setUserAuth(true);
  }

  _getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String address = prefs.getString("address") ?? ""; // null 될수 있음
    logger.d(address);
  }
}

enum VerificationStatus {
  none,
  codeSent,
  verifying,
  verificationDone,
}
