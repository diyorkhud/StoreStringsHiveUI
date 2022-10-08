import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:storestringswith_hive/pages/sigin_page.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void openSignInPage(BuildContext ctx){
    Navigator.push(ctx, MaterialPageRoute(builder: (_){
      return const SignIn();
    }));
  }


  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  void _doSignup() async{
    String username = usernameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box('hive_nosql');
    box.put("username", username);
    box.put("email", email);
    box.put("phone", phone);
    box.put("password", password);

    String id = box.get("username");
    String em = box.get("email");
    String ph = box.get("phone");
    String pw = box.get("password");
    print(id);
    print(em);
    print(ph);
    print(pw);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        color: const Color.fromRGBO(25, 25, 112, 1),
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create", style: TextStyle(color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                const Text("Account", style: TextStyle(color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 50,),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.white70,),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.white70,),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.phone, color: Colors.white70,),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.key, color: Colors.white70,),
                  ),
                ),
                const SizedBox(height: 60,),
                IconButton(
                  icon: const Image(image: NetworkImage("https://cdn.pixabay.com/photo/2014/04/02/10/15/arrow-303271_1280.png"),),
                  iconSize: 70,
                  onPressed: _doSignup,
                ),
                const SizedBox(height: 50,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: Colors.white70, fontSize: 16),),
                    const SizedBox(width: 10,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      onPressed: (){
                        openSignInPage(context);
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),

      ),
    );
  }
}
