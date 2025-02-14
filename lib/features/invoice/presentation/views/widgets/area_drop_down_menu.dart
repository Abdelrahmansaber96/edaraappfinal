import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/styles/styles.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/Customers_cubit/customers_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/all_areas_cubit/all_areas_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAreasDropDownMenu extends StatelessWidget {
  AllAreasDropDownMenu({super.key});
  final TextEditingController textEditingController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllAreasCubit, AllAreasState>(
      listener: (context, state) {
        if (state is AllAreasFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return state is AllAreasLoading
            ? const Center(child: CircularProgressIndicator())
            : state is AllAreasSuccess
                ? DropdownButtonFormField2(
                    decoration: InputDecoration(
                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text(
                      'المنطقة',
                      style: Sytles.buttonTitle.copyWith(color: kButtonColor),
                    ),
                    items: state.areas
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text(
                                item.areaName.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //  GoRouter.of(context).push();
                      context
                          .read<CustomersCubit>()
                          .fetchAllCustomers(value.toString());
                    },
                    onSaved: (value) {},
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 20,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 400,
                      scrollbarTheme: const ScrollbarThemeData(),
                      openInterval:
                          const Interval(0.05, 0.1, curve: Curves.easeInOut),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController1,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                          height: 50,
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: textEditingController1,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'ابحث عن المنطقة...',
                              hintStyle: const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )),
                      searchMatchFn: (item, searchValue) {
                        return item.child.toString().contains(searchValue);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController1.clear();
                      }
                    },
                  )
                : Container();
      },
    );
  }
}
