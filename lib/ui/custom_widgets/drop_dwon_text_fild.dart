import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';
import 'package:provider/provider.dart';

import '../../models/home_model.dart';
import '../../view_model/home_view_model.dart';
import '../theme/style/colors.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final _currencies = [
    "سورة البقره",
    "سورة ال عمران",
    "سورة المائده",
  ];
  HomeModel? _currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context).homeItems;

    return FormField<HomeModel>(
      builder: (FormFieldState<HomeModel> state) {
        return InputDecorator(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          // isEmpty: _currentSelectedValue == 'اختر السوره',
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<HomeModel>(
                hint: Text(
                  'اختر السوره',
                  style: TextStyle(
                      height: 1.6, color: AppColors.darkGray, fontSize: 15),
                ),
                icon:  SizedBox(
                  width: 15,
                  child: Image.asset(Constants.downArrowImage)),
                value: _currentSelectedValue,
                isDense: true,
                onChanged: (HomeModel? newValue) {
                  setState(() {
                    _currentSelectedValue = newValue;
                    state.didChange(newValue);
                  });
                },
                
                items: provider.map((HomeModel value) {
                  return DropdownMenuItem<HomeModel>(
                    value: value,
                    
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(value.name, 
                      textDirection: TextDirection.rtl,
                           style: TextStyle(
                        height: 1.6, color: AppColors.darkGray, fontSize: 15),),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
