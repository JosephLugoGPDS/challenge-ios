import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
                        final TextEditingController controller;
                        final Function(String) onChanged;
                        final String hint;
                        final TextInputAction? textInputAction;
                        final bool obscureText;

                        const CustomTextFormField({super.key, 
                          required this.controller,
                          required this.onChanged,
                          required this.hint,
                          this.textInputAction,
                          this.obscureText = false,
                        });

                        @override
                        Widget build(BuildContext context) {
                          return TextFormField(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppTheme.blackColor,
                            ),
                            textInputAction: textInputAction,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: hint,
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: AppTheme.grayDarkColor,
                              ),
                              
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                            controller: controller,
                            onChanged: onChanged,
                          );
                        }
}