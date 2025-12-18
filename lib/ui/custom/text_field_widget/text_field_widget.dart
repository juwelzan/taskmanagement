import '../../../core/path/path.dart';

class TextFieldWidget extends StatelessWidget {
  final FormFieldValidator? validator;
  final ValueChanged? onChanged;
  final String? hintText, errorText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final int maxLines;

  const TextFieldWidget({
    super.key,
    this.validator,
    this.hintText,
    this.errorText,
    this.controller,
    this.onChanged,
    this.textInputType,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(hintText: hintText, errorText: errorText),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
