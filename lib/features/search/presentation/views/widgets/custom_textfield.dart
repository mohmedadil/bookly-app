import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged});
final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(onChanged:onChanged ,
      decoration: InputDecoration(
          enabledBorder: buildOutlineborder(),
          focusedBorder: buildOutlineborder(),
          hintText: 'search',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Opacity(
              opacity: 0.8,
              child: Icon(
                Icons.search,
              ),
            ),
          )),
    );
  }

  OutlineInputBorder buildOutlineborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white));
  }
}
