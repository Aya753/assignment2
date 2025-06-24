import 'package:assignment2/core/app_images.dart';
import 'package:flutter/material.dart';

class firstP extends StatelessWidget {
  const firstP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.fill,
              color: Colors.green.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownMenu(
              menuHeight: 300,
              requestFocusOnTap: true,
              enableFilter: true,
              enableSearch: true,
              hintText: "Select you favorite food",
              textAlign: TextAlign.center,
              selectedTrailingIcon: Icon(Icons.remove),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                ),
              ),

              width: 400,
              leadingIcon: Icon(Icons.food_bank),

              dropdownMenuEntries: [
                DropdownMenuEntry(value: "Burger", label: "Burger"),

                DropdownMenuEntry(value: "Sandwich", label: "Sandwich"),
                DropdownMenuEntry(value: "Pasta", label: "Pasta"),
                DropdownMenuEntry(value: "Salad", label: "Salad"),
                DropdownMenuEntry(value: "Soup", label: "Soup"),
                DropdownMenuEntry(value: "Steak", label: "Steak"),
                DropdownMenuEntry(value: "Sushi", label: "Sushi"),
                DropdownMenuEntry(value: "Chicken", label: "Chicken"),
                DropdownMenuEntry(value: "Fish", label: "Fish"),
                DropdownMenuEntry(value: "Rice", label: "Rice"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
