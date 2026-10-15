import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final HintText hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
  });

  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<MyTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final bool isPassword = widget.hintText == HintText.password;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isPassword ? _isObscured : false,

        validator: widget.validator ??
            (String? value) {
              if (value == null || value.isEmpty) {
                return "${widget.hintText.name} is required";
              }
              return null;
            },

        decoration: InputDecoration(
          hintText: widget.hintText.name,
          hintStyle: TextStyle(color: Colors.grey[500]),

          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),

          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}

enum HintText {
  username("Username"),
  password("Password");

  final String name;

  HintText(this.name);
}
