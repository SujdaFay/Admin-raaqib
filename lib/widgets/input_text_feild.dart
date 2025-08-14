import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextFeildCos extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPass;
  final TextInputType type;
  final bool fill;
  const InputTextFeildCos({
    super.key,
    required this.controller,
    required this.hint,
    required this.type,
    this.isPass = false,
    this.fill = false,
  });

  @override
  State<InputTextFeildCos> createState() => _InputTextFeildCosState();
}

class _InputTextFeildCosState extends State<InputTextFeildCos> {
  late bool seePasswor;

  @override
  void initState() {
    super.initState();
    seePasswor = widget.isPass;
  }

  // main========================
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        // final stringPattern = RegExp(r'^[a-zA-Z\s]+$');
        if (value == null || value.isEmpty) {
          return " please fill ${widget.hint}";
        }
        if (widget.type == TextInputType.number &&
            double.tryParse(value) == null) {
          return "Please enter a valid ${widget.hint}";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: theme.colorScheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
        filled: widget.fill,
        fillColor: Colors.blueGrey.withValues(alpha: (0.5 * 255)),
        suffixIcon:
            widget.isPass
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      seePasswor = !seePasswor;
                    });
                  },
                  icon: Icon(
                    seePasswor ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  ),
                )
                : null,
      ),
      obscureText: seePasswor,
    );
  }
}
