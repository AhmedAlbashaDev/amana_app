import 'package:amana/screens/login/login_bloc.dart';
import 'package:amana/screens/login/login_extras.dart';
import 'package:amana/utils/globals.dart';
import 'package:amana/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../repositories/login_repository.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginBLoc bloc = LoginBLoc(Idle(),loginRepository: LoginRepository());

  TextEditingController usernameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  bool isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height / 100;
    screenWidth = MediaQuery.of(context).size.width / 100 ;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/login_background.png',
              height: screenHeight * 100,
              width: screenWidth * 100,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: BlocListener(
                bloc: bloc,
                listener: (context , state){
                  if(state is LoginSuccess){
                    Fluttertoast.showToast(msg: 'تم تسجيل الدخول بنجاح' , toastLength: Toast.LENGTH_LONG , backgroundColor: Colors.green[400] , textColor: Colors.white);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user: state.username,)));
                  }
                  if(state is LoginFailed){
                    Fluttertoast.showToast(msg: state.message ?? '' , toastLength: Toast.LENGTH_LONG , backgroundColor: Colors.red[400] , textColor: Colors.white);
                  }
                },
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo1.png',
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 20,),
                        Image.asset(
                          'assets/images/logo2.png',
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 270,
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xffF7F7F7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                              controller: usernameController,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize:17, height: 2,color: Theme.of(context).primaryColor,decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                focusColor: Theme.of(context).primaryColor,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor
                                    )
                                ),
                                prefixIcon: Icon(Icons.person , size: 25 , color: Theme.of(context).primaryColor,),
                                hintText: 'اسم المستخدم',
                              ),
                              cursorColor: Theme.of(context).primaryColor,
                              validator: (text){
                                if(text!.isEmpty){
                                  return 'هذا الحقل مطلوب';
                                }
                                return null;
                              },
                            ),
                            BlocBuilder(
                              bloc: bloc,
                              builder: (context , state){
                                if(state is PasswordVisibilityState){
                                  isPasswordVisible = state.visibility!;
                                }
                                return TextFormField(
                                  controller: userPasswordController,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize:17, height: 2,color: Theme.of(context).primaryColor,decoration: TextDecoration.none),
                                  obscureText: !isPasswordVisible,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).primaryColor
                                        )
                                    ),
                                    prefixIcon: Icon(Icons.lock , size: 25 , color: Theme.of(context).primaryColor,),
                                    suffixIcon: IconButton(onPressed: (){
                                      bloc.add(PasswordVisibility(visibility: !isPasswordVisible));
                                    },icon: Icon(isPasswordVisible ? Icons.remove_red_eye_outlined : Icons.remove_red_eye , size: 22 , color: Theme.of(context).primaryColor,),),
                                    hintText: '************',
                                  ),
                                  cursorColor:Theme.of(context).primaryColor,
                                  validator: (text){
                                    if(text!.isEmpty){
                                      return 'هذا الحقل مطلوب';
                                    }
                                    return null;
                                  },
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: true,
                                      activeColor: const Color(0xff7F7F7F),
                                      onChanged: (value) {

                                      },
                                    ),
                                    MaterialButton(
                                      onPressed: (){},
                                      // padding: EdgeInsets.zero,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      child:   Center(
                                        child: Text('تذكرني'
                                          ,style: TextStyle(
                                              fontSize: 18,
                                              color:  Colors.grey[600],
                                              fontWeight: FontWeight.bold
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                MaterialButton(
                                  onPressed: (){},
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  child:   Center(
                                    child: Text('إعادة كلمة السر'
                                      ,style: TextStyle(
                                          fontSize: 18,
                                          color:  Colors.grey[600],
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                      width: screenWidth * 90,
                      child: BlocBuilder(
                        bloc: bloc,
                        builder: (context , state){
                          if(state is Loading){
                            return MaterialButton(
                              onPressed: (){},
                              color:  Theme.of(context).primaryColor,
                              height: 55,
                              elevation: .1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              child: const Center(
                                child: SpinKitWave(
                                  color:  Color(0xffF7F7F7),
                                  size: 25,
                                ),
                              ),
                            );
                          }

                            return CustomButton(
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  bloc.add(Login(username: usernameController.text.trim() , password: userPasswordController.text.trim()));
                                }
                              },
                              title: 'تسجيل دخول',
                              width: screenWidth * 90,
                              height: 55,
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 15,
                              textColor: Color(0xffF7F7F7),
                              textSize: 18,
                              fontWeight: FontWeight.w600,
                            );
                        },
                      )
                    ),

                    const SizedBox(height: 25,),
                    CustomButton(
                      onPressed: (){},
                      title: 'دليل ارشادي',
                      width: screenWidth * 90,
                      height: 50,
                      backgroundColor: const Color(0xffF7F7F7),
                      radius: 20,
                      textColor: Theme.of(context).primaryColor,
                      textSize: 18,
                      fontWeight: FontWeight.w600,
                    ),

                    const SizedBox(height: 25,),
                    CustomButton(
                      onPressed: (){},
                      title: 'تأهيل الشركاء',
                      width: screenWidth * 90,
                      height: 50,
                      backgroundColor: const Color(0xffF7F7F7),
                      radius: 20,
                      textColor: Theme.of(context).primaryColor,
                      textSize: 18,
                      fontWeight: FontWeight.w600,
                    ),

                    const SizedBox(height: 25,),
                    CustomButton(
                      onPressed: (){},
                      title: 'منصة كفو',
                      width: screenWidth * 90,
                      height: 50,
                      backgroundColor: const Color(0xffF7F7F7),
                      radius: 20,
                      textColor: Theme.of(context).primaryColor,
                      textSize: 18,
                      fontWeight: FontWeight.w600,
                    ),

                    const SizedBox(height: 25,),
                    CustomButton(
                      onPressed: (){},
                      title: 'الدعم الفني',
                      width: screenWidth * 90,
                      height: 50,
                      backgroundColor: const Color(0xffF7F7F7),
                      radius: 20,
                      textColor: Theme.of(context).primaryColor,
                      textSize: 18,
                      fontWeight: FontWeight.w600,
                    ),

                    const SizedBox(height: 25,),

                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
