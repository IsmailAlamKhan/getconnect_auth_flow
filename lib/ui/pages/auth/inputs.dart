import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:getconnect_auth_flow/statemanagement/statemanagement.dart';

class Inputs extends StatelessWidget {
  Inputs({Key key, @required this.authState, @required this.controller})
      : super(key: key);
  final AuthState authState;
  final AuthController controller;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  List<Widget> _build(BuildContext context) {
    if (authState == AuthState.LOGIN)
      return [
        DefaultTextField(
          focusNode: emailFocusNode,
          label: 'Email',
          validator: (value) {
            if (value.isEmail) return 'Please enter a valid Email';
            return null;
          },
          controller: controller.emailTEC,
        ),
        20.0.sizedHeight,
        Obx(
          () => DefaultTextField.password(
            hideShowPas: () => controller.obscure = !controller.obscure,
            focusNode: passFocusNode,
            obscure: controller.obscure,
            controller: controller.passTEC,
          ),
        ),
      ];
    return [
      DefaultTextField(
        controller: controller.firstNameTEC,
        label: 'First Name',
        focusNode: firstNameFocusNode,
      ),
      20.0.sizedHeight,
      DefaultTextField(
        controller: controller.lastNameTEC,
        label: 'Last Name',
        focusNode: lastNameFocusNode,
      ),
      20.0.sizedHeight,
      DefaultTextField(
        validator: (value) {
          if (!value.isEmail) {
            return 'This filed requires a valid Email';
          }
          return null;
        },
        controller: controller.emailTEC,
        focusNode: emailFocusNode,
        label: 'Email',
      ),
      20.0.sizedHeight,
      DefaultTextField(
        controller: controller.phoneNumberTEC,
        focusNode: phoneNumberFocusNode,
        keyboardType: TextInputType.phone,
        label: 'Phone Number',
      ),
      5.0.sizedHeight,
      Obx(
        () => DropdownButtonFormField<Role>(
          decoration: InputDecoration(
            hintText: 'Role',
          ),
          validator: (value) {
            if (value == null) return 'Role is Required';
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 42,
          value: controller.role.value == null ? null : controller.role,
          onChanged: (Role newValue) {
            controller.role = newValue;
          },
          items: dropDownClass
              .map(
                (element) => DropdownMenuItem<Role>(
                  value: element,
                  child: Text(element.text),
                ),
              )
              .toList(),
        ),
      ),
      Obx(
        () => DefaultTextField.password(
          hideShowPas: () => controller.obscure = !controller.obscure,
          controller: controller.passTEC,
          obscure: controller.obscure,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _build(context),
    );
  }
}

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key key,
    @required this.focusNode,
    @required this.controller,
    @required this.label,
    this.mandatory = true,
    this.obscure = false,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.onFieldSubmitted,
    this.textInputAction,
  }) : super(key: key);

  DefaultTextField.password({
    this.focusNode,
    this.controller,
    this.validator,
    this.obscure,
    this.keyboardType,
    @required VoidCallback hideShowPas,
    this.onFieldSubmitted,
    this.textInputAction,
  })  : label = 'Email',
        mandatory = true,
        suffixIcon = IconButton(
          icon: Icon(
            obscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: hideShowPas,
        );

  final FocusNode focusNode;
  final TextEditingController controller;
  final String label;
  final bool mandatory;
  final bool obscure;
  final FormFieldValidator<String> validator;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final ValueChanged<String> onFieldSubmitted;
  final TextInputAction textInputAction;
  String get _label => mandatory
      ? label.substring(0, 1).toUpperCase() + label.substring(1) + '*'
      : label.substring(0, 1).toUpperCase() + label.substring(1);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value.isEmpty) {
          return '$label is required';
        }
        validator?.call(value);
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: _label,
        suffixIcon: suffixIcon,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

extension ExtendedDouble on double {
  Widget get sizedHeight => SizedBox(
        height: this,
      );
  Widget get sizedWidget => SizedBox(
        width: this,
      );
}
