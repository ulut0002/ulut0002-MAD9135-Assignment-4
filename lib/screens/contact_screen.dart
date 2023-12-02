import 'package:flutter/material.dart';
import 'package:flutter2/widgets/navigation_bar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen(
      {super.key,
      required this.nav,
      required this.page,
      required this.scaffoldKey});
  final Function nav;
  final int page;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _messageController;
  String message = "";

  final MESSAGE1 = "Sending...";
  // final MESSAGE2 = "Sent! Taking you back home!";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Want something? Tell us!",
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    maxLength: 80,
                    decoration: const InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.black38),
                        icon: Icon(
                          Icons.person,
                        ),
                        hintText: "Your full name please",
                        hintStyle: TextStyle(
                          color: Colors.black45,
                        )),
                    textInputAction: TextInputAction.next,
                    controller: _nameController,
                    validator: (String? value) {
                      return (value != null && value.trim().isNotEmpty)
                          ? null
                          : "Please enter your name";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 80,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black38),
                        icon: Icon(
                          Icons.email,
                        ),
                        hintText: "Your personal email address",
                        hintStyle: TextStyle(
                          color: Colors.black45,
                        )),
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    validator: (String? value) {
                      return (value != null &&
                              value.trim().isNotEmpty &&
                              value.contains("@") &&
                              value.contains("."))
                          ? null
                          : "Please enter your email address";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    autocorrect: true,
                    maxLength: 500,
                    minLines: 4,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        labelText: "Your Message",
                        labelStyle: TextStyle(color: Colors.black38),
                        icon: Icon(
                          Icons.message,
                        ),
                        hintText: "Your personal email address",
                        hintStyle: TextStyle(
                          color: Colors.black45,
                        )),
                    textInputAction: TextInputAction.next,
                    controller: _messageController,
                    validator: (String? value) {
                      return (value != null && value.trim().isNotEmpty)
                          ? null
                          : "Please enter a message";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text("Send"),
                    onPressed: () {
                      FormState? fs = _formKey.currentState;
                      // ScaffoldMessengerState sx = _scaffoldKey.currentState;

                      if (fs!.validate()) {
                        fs.save();
                        // print(_scaffoldKey.currentState == null);
                        setState(() {
                          message = MESSAGE1;
                        });
                        widget.scaffoldKey.currentState!.showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: Text(
                              message,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );

                        // Future.delayed(Duration(seconds: 2), () {
                        //   setState(() {
                        //     message = MESSAGE2;
                        //   });
                        // });

                        Future.delayed(const Duration(seconds: 3), () {
                          widget.nav(0);
                        });
                      } else {
                        // stay on the form
                      }
                    },
                  ),
                )
              ],
            )),
      ),
      bottomNavigationBar: NavBar(nav: widget.nav, page: widget.page),
    );
  }
}
