import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    this.onSaved,
  }) : super(key: key);

  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 49,
        right: 48,
      ),
      child: TextFormField(
        style: AppStyles.s16w400.copyWith(
          color: AppColors.mainText,
        ),
        obscureText: true,
        obscuringCharacter: '・',
        decoration: InputDecoration(
          hintText: 'Пароль',
          hintStyle: AppStyles.s16w400.copyWith(
            color: AppColors.neutral2,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 8,
          ),
        ),
        validator: (value) {
          if (value == null) return 'Проверить логин или пароль';

          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
