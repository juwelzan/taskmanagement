import '../../../core/path/path.dart';

class TextFieldWidget extends StatelessWidget {
  final FormFieldValidator? validator;
  final ValueChanged? onChanged;
  final String? hintText, errorText;
  final TextEditingController? controller;
  TextFieldWidget({
    super.key,
    this.validator,
    this.hintText,
    this.errorText,
    this.controller,
    this.onChanged,
  });
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText, errorText: errorText),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
