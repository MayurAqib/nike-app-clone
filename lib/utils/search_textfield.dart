import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield(
      {super.key, required this.onChanged, required this.focusNode});
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(color: Colors.grey),
      cursorColor: Colors.grey.shade600,
      decoration: const InputDecoration(
        hintText: 'Search Product',
        border: UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
