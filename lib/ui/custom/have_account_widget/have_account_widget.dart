import '../../../core/path/path.dart';

class HaveAccountWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const HaveAccountWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Have account? ",
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: "Sign in",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Color(0xff21bf73)),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
