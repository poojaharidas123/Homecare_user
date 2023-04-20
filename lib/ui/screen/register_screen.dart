import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecare_user/ui/widgets/custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../blocs/auth/sign_up/sign_up_bloc.dart';
import '../../util/value_validators.dart';
import '../../values/values.dart';
import '../widgets/custom_alert_dialog.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (Supabase.instance.client.auth.currentUser != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F3DF),
      body: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed',
                  message: state.message,
                  primaryButtonLabel: 'Ok',
                ),
              );
            } else if (state is SignUpSuccessState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "HomeCare",
                              style: GoogleFonts.dynalight(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Sign Up",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: emailValidator,
                      onTap: () {
                        setState(() {});
                        log('message');
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: isObscure,
                      onTap: () {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value != null && value.trim().isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter password';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_outlined,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _cpController,
                      obscureText: isObscure,
                      onTap: () {
                        setState(() {});
                      },
                      validator: (value) {
                        return confirmPasswordValidator(
                            value, _passwordController.text.trim());
                      },
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      label: 'Register',
                      buttonColor: Color(0xFFAAD013),
                      textColor: Colors.white,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpBloc>(context).add(
                            CreateUserEvent(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          );
                        }
                      },
                      isLoading: state is SignUpLoadingState,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "Already Have Account?",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      label: 'Login',
                      buttonColor: Colors.white,
                      textColor: primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isLoading: state is SignUpLoadingState,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
