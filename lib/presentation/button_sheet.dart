import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/core/constants/app_icon.dart';
import 'package:travel_app/presentation/widgets/counter_button.dart';
import 'package:travel_app/presentation/widgets/custom_elevated_button.dart';

class ContentSheetBottom extends StatefulWidget {
  const ContentSheetBottom({super.key});

  @override
  State<ContentSheetBottom> createState() => _ContentSheetBottomState();
}

class _ContentSheetBottomState extends State<ContentSheetBottom> {
  String selectedValue = AppIcon.flagKg;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  int _counter = 1;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _commentController.dispose();

    super.dispose();
  }

  bool get _isDone {
    if (_phoneController.text.isEmpty || _commentController.text.isEmpty) {
      return false;
    }
    return true;
  }

  TextFormField _buildCommentField() {
    return TextFormField(
      validator: (value) => _fieldValidate(value!),
      controller: _commentController,
      keyboardType: TextInputType.text,
      style: AppFonts.s16Reg,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        hintText: 'Write your wishes to trip...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
      ),
    );
  }

  TextFormField _buildPhoneTextField() {
    return TextFormField(
      validator: (value) => _fieldValidate(value!),
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: '_ _ _ _ _ _  _ _ _',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
        prefixIcon: _createIcon(),
      ),
    );
  }

  Row _createIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          width: 75,
          child: _createDropButton(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('+ 996  ', style: AppFonts.s16Reg),
        ),
      ],
    );
  }

  DropdownButtonFormField<String> _createDropButton() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(enabled: false),
      elevation: 0,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.black,
      ),
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items:
          [AppIcon.flagKg, AppIcon.flagKz, AppIcon.flagRu].map((String value) {
        return DropdownMenuItem(
          value: value,
          child: SvgPicture.asset(value),
        );
      }).toList(),
    );
  }

  Row _createCloseField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text('Info', style: AppFonts.s24Bold),
        ),
        IconButton(
          padding: const EdgeInsets.only(top: 20),
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(36)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createCloseField(context),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Text(
                'To submit an application for a tour reservation, you need to fill in your information and select the number of people for the reservation',
                style: AppFonts.s14Reg,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Phone number',
              style: AppFonts.s14Reg.copyWith(color: AppColors.gray),
            ),
            const SizedBox(height: 4),
            _buildPhoneTextField(),
            const SizedBox(height: 20),
            Text(
              'Commentaries to trip',
              style: AppFonts.s14Reg.copyWith(color: AppColors.gray),
            ),
            const SizedBox(height: 4),
            _buildCommentField(),
            const SizedBox(height: 20),
            Text(
              'Number of people',
              style: AppFonts.s14Reg.copyWith(color: AppColors.gray),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CounterButton(
                  count: _counter,
                  setNewValue: (countVal) {
                    setState(() {
                      _counter = countVal;
                    });
                  },
                ),
                Flexible(
                  child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 20),
                      leading: const Icon(Icons.person_outline_rounded),
                      title: Text('$_counter People', style: AppFonts.s16Reg)),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CustomElevatedButton(
                  color: _isDone ? AppColors.primary : AppColors.unActDotColor,
                  content: _createContent,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }

                    //_isDone;
                  }),
            )
          ],
        ),
      ),
    );
  }

  String? _fieldValidate(String value) {
    if (value.isEmpty) {
      return 'Заполните поле';
    }
    return null;
  }

  Text _createContent() {
    return Text(
      'Submit',
      style: AppFonts.s18Med.copyWith(color: AppColors.white),
    );
  }
}
