import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jint/core/services/services_locator.dart';
import 'package:jint/core/theme/themeData/themeDataDark.dart';
import 'package:jint/core/utils/app_size.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/core/utils/widget/app_constance.dart';
import 'package:jint/core/utils/widget/build_default_button.dart';
import 'package:jint/core/utils/widget/show_toast.dart';
import 'package:jint/core/utils/widget/text_field.dart';
import 'package:jint/core/utils/widget/text_field_password.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:jint/jint/presentation/contriller/login_bloc/login_bloc.dart';
import 'package:jint/jint/presentation/contriller/login_bloc/login_event.dart';
import 'package:jint/jint/presentation/contriller/login_bloc/login_state.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
        previous.loginState != current.loginState,
        listener: (context, state) {
          if (state.loginState == RequestState.error) {
            // todo: show toast
            ShowToast().showToast(
              message: state.loginMessage, states: ToastStates.error,

            );
          }
        },

        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppSize().height(context: context) / 6,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Jint",
                                style: context
                                    .styleHeader1
                                    .copyWith(fontFamily: 'PacificoRegular'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: AppSize().height(context: context) / 16,
                              left: AppSize().height(context: context) / 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Login to your Account",
                                  style: context.styleHeader3.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: AppSize().height(context: context) / 16,
                              left: 10,
                              right: 10,
                            ),
                            child: FormFieldUtils().textField(
                              readOnly: false,
                              context: context,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              leadingIcon: Icons.email,
                              emptyErrorText:
                              "Kindly provide your email or username.",
                              labelText: "Email or Username",
                              borderRadius: 25,
                            ),
                          ),
                          textFieldPassword(
                            passwordController: passwordController,
                            emptyErrorText: "Kindly provide your Password",
                            labelText: "Password",),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BuildDefaultButton().buildDefaultTextButton(
                                text: "Forgotten password?",
                                fontSize: 18,
                                onPressed: () {},
                              )
                            ],
                          ),
                          switch(state.loginState){
                            RequestState.loading =>
                                AppConstance().circularProgress(),
                            RequestState.idle =>
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0,
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: BuildDefaultButton().button(
                                    context: context,
                                    condition: true,
                                    text: "Login",
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(
                                          LoginJintEvent(
                                            userName: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                            RequestState.error => Text(state.loginMessage ?? 'error occurred'),
                            RequestState.loaded => Container(
                          child: const Text('It was successful'),
                          ),
                          null => const SizedBox.shrink(),
                          },
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "new user.",
                                style: context.styleHeader3.copyWith(
                                    fontSize: 16),
                              ),
                              BuildDefaultButton().buildDefaultTextButton(
                                text: "Sign Up",
                                fontSize: 18,
                                onPressed: () {},
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "ـــــــــــــــــــــــــــــــــــــ   ${" Or login with "}ـــــــــــــــــــــــــــــــــــــ  ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                  size: 45,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              IconButton(
                                icon: const Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                  size: 45,
                                ),
                                onPressed: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
