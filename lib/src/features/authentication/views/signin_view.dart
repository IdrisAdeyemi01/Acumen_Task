import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:acumen_task/src/content/utilities/base_change_notifiers.dart';
import 'package:acumen_task/src/content/utilities/screen_util.dart';
import 'package:acumen_task/src/content/utilities/validation_mixin.dart';
import 'package:acumen_task/src/features/authentication/notifiers/signin_notifier.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/shared/widgets/agreement_statement.dart';
import 'package:acumen_task/src/shared/widgets/app_elevated_button.dart';
import 'package:acumen_task/src/shared/widgets/app_text_form_field.dart';
import 'package:acumen_task/src/shared/widgets/spacing.dart';
import 'package:acumen_task/src/shared/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';

class SigninView extends HookWidget with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signinProvider = context.read(signinNotifier);
    final textTheme = Theme.of(context).textTheme;
    final obscureText = useState(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return StatusBar(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => context.read(navigationService).back(),
            child: Icon(
              IconlyLight.arrow_left,
              color: AppColors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: ScreenUtil.screenHeight(context)),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signinHeading,
                      style: textTheme.headline1,
                    ),
                    Spacing.smallHeight(),
                    Text(
                      AppStrings.signinSubheading,
                      style: textTheme.headline4,
                    ),
                    Spacing.bigHeight(),
                    AppTextFormField(
                      label: AppStrings.email,
                      validator: validateEmail,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Spacing.bigHeight(),
                    AppTextFormField(
                      label: AppStrings.password,
                      validator: validatePassword,
                      textInputAction: TextInputAction.done,
                      controller: passwordController,
                      keyboardType: TextInputType.number,
                      obscureText: obscureText.value,
                      suffix: InkWell(
                        onTap: () {
                          obscureText.value = !obscureText.value;
                        },
                        child: Icon(
                          obscureText.value == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Spacing.height(100),
                    Consumer(
                      builder: (_, watch, __) {
                        final model = watch(signinNotifier);
                        return AppElevatedButton(
                          isLoading: model.state.isLoading,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signinProvider.signin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          label: AppStrings.signin,
                        );
                      },
                    ),
                    Spacing.height(100),
                    AgreementStatement(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
