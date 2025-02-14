import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/styles/styles.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/category_cubit/cubit/category_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/product_data_cubit/cubit/product_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDropDowmMenu extends StatelessWidget {
  CategoryDropDowmMenu({super.key});
  final TextEditingController textEditingController3 = TextEditingController();
  final List<String> genderItems = [
    'يرجى اختيار المنطقة',
    'يرجى اختيار العميل',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return state is CategorySuccess
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButtonFormField2(
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
                    'التصنيفات',
                    style: Sytles.buttonTitle.copyWith(color: kButtonColor),
                  ),
                  items: state.categories
                      .map((item) => DropdownMenuItem(
                            value: item.categoryCode,
                            child: Text(
                              item.categoryName.toString(),
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
                    context
                        .read<ProductDataCubit>()
                        .fetchAllProducts(value.toString());
                    // GoRouter.of(context).push(
                    //     AppRouter
                    //         .kProductPage);
                  },
                  onSaved: (value) {
                    ;
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 13,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 400,
                    scrollbarTheme: const ScrollbarThemeData(),
                    openInterval:
                        const Interval(0.4, 0.6, curve: Curves.easeInOut),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController3,
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
                          controller: textEditingController3,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'ابحث عن التصنيف...',
                            hintStyle: const TextStyle(fontSize: 12),
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
                      textEditingController3.clear();
                    }
                  },
                ),
              )
            : state is CategoryLoading
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButtonFormField2(
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
                        'التصنيفات',
                        style: Sytles.buttonTitle.copyWith(color: kButtonColor),
                      ),
                      items: genderItems
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  genderItems[1],
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
                        iconSize: 13,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                      ),
                    ),
                  );
      },
    );
  }
}
