import 'package:firebase_project/features/auth/cubit/auth_cubit.dart';
import 'package:firebase_project/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/arrow_back_icon.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/sign_in_with_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowBackIcon(),
              SizedBox(height: 29),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 32),
              CustomTextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter your email",
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                controller: passwordController,
                obscureText: !isVisible,
                keyboardType: TextInputType.visiblePassword,
                hintText: "Enter your password",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: isVisible
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = false;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                          child: SvgPicture.asset(
                            "assets/icons/hidepassword.svg",
                          ),
                        ),
                ),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "forget password ?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6A707C),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is AuthLoadingState){
                     Center(child: CircularProgressIndicator(),);
                  }else if(state is AuthSuccessState){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                    
                  }else{
                    Center(child: Text("Erorrr"),);
                  }
                },
                child: AppButton(
                  title: "Login",
                  onTap: () {
                    context.read<AuthCubit>().loginWithEmailAndPassword(
                      emailAddress: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
              ),

              SizedBox(height: 34),
              Center(
                child: Text(
                  "or",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ).copyWith(color: Color(0xff6A707C)),
                ),
              ),
              SizedBox(height: 21),
              SignInWithCard(
                title: "SignIn With Google",
                image: "assets/icons/google.svg",
              ),
              SizedBox(height: 34),
              SignInWithCard(
                title: "SignIn With Apple",
                image: "assets/icons/apple.svg",
              ),
              Spacer(),
              CustomText(
                onTap: () {},
                text1: "DoNot Have Account",
                text2: "Register Now",
              ),
              SizedBox(height: 19),
            ],
          ),
        ),
      ),
    );
  }
}
