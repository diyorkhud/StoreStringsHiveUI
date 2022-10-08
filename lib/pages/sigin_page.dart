import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:storestringswith_hive/pages/signup_page.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void openAccountPage(BuildContext ctx){
    Navigator.push(ctx, MaterialPageRoute(builder: (_){
      return const SignUp();
    }));
  }
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doSignin() async{
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box('hive_nosql');
    box.put("username", username);
    box.put("password", password);

    String id = box.get("username");
    String pw = box.get("password");
    print(id);
    print(pw);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://bs-uploads.toptal.io/blackfish-uploads/components/image/content/file_file/file/537781/764x764-3f483634bbf0f89f0d6057da3ec6f3d3.jpg"
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const Text("Welcome Back!", style: TextStyle(color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                const Text("Sign in to continue", style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),),
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
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.key, color: Colors.white70,),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("Forget Password?", style: TextStyle(color: Colors.white70,),),
                const SizedBox(height: 40,),
                IconButton(
                  icon: const Image(image: NetworkImage("https://cdn.pixabay.com/photo/2014/04/02/10/15/arrow-303271_1280.png"),),
                  iconSize: 70,
                  onPressed: _doSignin,
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
                      const Text("Don't have an account?", style: TextStyle(color: Colors.white70, fontSize: 16),),
                      const SizedBox(width: 10,),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        onPressed: (){
                          openAccountPage(context);
                        },
                        child: const Text('SIGN UP'),
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
