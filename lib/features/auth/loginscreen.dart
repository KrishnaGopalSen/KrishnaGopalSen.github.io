// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../core/network/api_endpoints.dart';
// import '../../core/network/apiservice.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   final formKey = GlobalKey<FormState>();
//   bool isPasswordVisible = false;
//
//   bool isLoading = false;
//
//   Future<void> loginUser() async {
//     FocusScope.of(context).unfocus();
//
//     if (!formKey.currentState!.validate()) {
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     final response = await ApiService.login(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//       endPoint: ApiEndpoints.login.trim(),
//     );
//
//     setState(() {
//       isLoading = false;
//     });
//
//     if (response != null) {
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(response.message),
//         ),
//
//       );
//
//       if (response.success) {
//         print("TOKEN => ${response.token}");
//         print("USER ID => ${response.user.id}");
//         print("EMAIL => ${response.user.email}");
//
//         /// SAVE LOGIN DATA
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setBool("isLogin", true);
//         await prefs.setString( "token",response.token,);
//         await prefs.setString("userId",response.user.id,);
//         await prefs.setString( "email",response.user.email,);
//         /// Navigate Screen
//         // Get.offAll(() => HomeScreen());
//
//       }
//
//     } else {
//
//       ScaffoldMessenger.of(context).showSnackBar(
//
//         const SnackBar(
//           content: Text("Something went wrong"),
//         ),
//
//       );
//
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final size = MediaQuery.of(context).size;
//
//     final isWeb = size.width > 700;
//
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//
//       resizeToAvoidBottomInset: true,
//
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//
//             physics: isWeb
//                 ? const NeverScrollableScrollPhysics()
//                 : const BouncingScrollPhysics(),
//
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: size.height - 40,
//               ),
//
//               child: IntrinsicHeight(
//                 child: Center(
//                   child: Container(
//
//                     width: isWeb ? 420 : double.infinity,
//
//                     padding: const EdgeInsets.all(25),
//
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//
//                       borderRadius: BorderRadius.circular(20),
//
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withValues(alpha:0.08),
//                           blurRadius: 12,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//
//                     child: Form(
//                       key: formKey,
//
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//
//                           /// Logo
//                           Container(
//                             height: 100,
//                             width: 100,
//
//                             decoration: BoxDecoration(
//                               color: Colors.blue.shade100,
//                               shape: BoxShape.circle,
//                             ),
//
//                             child: const Icon(
//                               Icons.person,
//                               size: 60,
//                               color: Colors.blue,
//                             ),
//                           ),
//
//                           const SizedBox(height: 25),
//
//                           /// Title
//                           const Text(
//                             "Welcome Back",
//                             style: TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           const SizedBox(height: 10),
//
//                           Text(
//                             "Login to continue",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey.shade600,
//                             ),
//                           ),
//
//                           const SizedBox(height: 35),
//
//                           /// Email
//                           /// Email
//                           CommonTextField(
//                             controller: emailController,
//                             hintText: "Enter Email",
//                             prefixIcon: Icons.email,
//                             keyboardType:TextInputType.emailAddress,
//                             validator: (value) {
//                               if (value == null ||
//                                   value.trim().isEmpty) {
//                                 return "Please enter email";
//                               }
//                               if (!RegExp(
//                                 r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                               ).hasMatch(value)) {
//                                 return "Enter valid email";
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           /// Password
//                           CommonTextField(
//                             controller: passwordController,
//
//                             hintText: "Enter Password",
//
//                             prefixIcon: Icons.lock,
//
//                             isPassword: true,
//
//                             validator: (value) {
//
//                               if (value == null ||
//                                   value.trim().isEmpty) {
//
//                                 return "Please enter password";
//                               }
//
//                               if (value.length < 6) {
//
//                                 return "Password must be 6 characters";
//                               }
//
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 15),
//
//                           /// Forgot
//                           Align(
//                             alignment: Alignment.centerRight,
//
//                             child: TextButton(
//                               onPressed: () {},
//
//                               child: const Text(
//                                 "Forgot Password?",
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(height: 10),
//                           /// Login Button
//                           SizedBox(
//                             width: double.infinity,
//                             height: 55,
//
//                             child: ElevatedButton(
//
//                               onPressed:
//                               isLoading ? null : loginUser,
//
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                   BorderRadius.circular(12),
//                                 ),
//                               ),
//
//                               child: isLoading
//                                   ? const CircularProgressIndicator(
//                                 color: Colors.white,
//                               )
//                                   : const Text(
//                                 "Login",
//
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 25),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }