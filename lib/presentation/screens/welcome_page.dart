import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/auth/authentication_cubit.dart';
import '../../bloc/connectivity/connectivity_cubit.dart';
import '../../shared/constants/assets_path.dart';
import '../../shared/constants/strings.dart';
import '../../shared/styles/colors.dart';
import '../widgets/mybutton.dart';
import '../widgets/myindicator.dart';
import '../widgets/mysnackbar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationCubit authcubit = BlocProvider.of(context);
    ConnectivityCubit connectivitycubit = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccessState) {
            Navigator.pushReplacementNamed(context, homepage);
          }
        },
        builder: (context, state) {
          if (state is AuthenticationLoadingState) {
            return const MyCircularIndicator();
          }

          if (state is! AuthenticationSuccessState) {
            return SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BounceInDown(
                      duration: const Duration(milliseconds: 1500),
                      child: Image.asset(
                        MyAssets.welcomesketch,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Hello !',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(letterSpacing: 3),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Welcome to the best Task manager baby !',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            letterSpacing: 3,
                            fontSize: 10.sp,
                            wordSpacing: 2,
                          ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    MyButton(
                      color: Colors.deepPurple,
                      width: 80.w,
                      title: 'Login',
                      func: () {
                        Navigator.pushNamed(context, loginpage);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MyButton(
                      color: Colors.deepPurple,
                      width: 80.w,
                      title: 'Sign Up',
                      func: () {
                        Navigator.pushNamed(context, signuppage);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    _myOutlinedButton(context, authcubit, connectivitycubit),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Container _myOutlinedButton(BuildContext context, AuthenticationCubit cubit,
      ConnectivityCubit connectivityCubit) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color: Colors.deepPurple, width: 2)),
      child: MaterialButton(
        onPressed: () {
          if (connectivityCubit.state is ConnectivityOnlineState) {
            cubit.signinanonym();
          } else {
            MySnackBar.error(
                message: 'Please Check Your Internet Conection',
                color: Colors.red,
                context: context);
          }
        },
        child: Center(
          child: Text(
            'Register Later',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 11.sp,
                  color: Colors.deepPurple,
                ),
          ),
        ),
      ),
    );
  }
}
