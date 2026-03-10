import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/widgets/App/app_color.dart';
import 'package:my_trial_first_app/widgets/App/custom_appbar.dart';
import 'package:my_trial_first_app/widgets/Buttons/custom_primarybutton.dart';
import 'package:my_trial_first_app/widgets/Buttons/custom_secondarybutton.dart';
import 'package:my_trial_first_app/widgets/Textfield/custom_textfield.dart';

class EditprofilePage extends StatefulWidget {
  const EditprofilePage({super.key});

  @override
  State<EditprofilePage> createState() => _EditprofilePageState();
}

class _EditprofilePageState extends State<EditprofilePage> {
  final TextEditingController namectrl = .new();
  final TextEditingController phonectrl = .new();
  final TextEditingController genderctrl = .new();
  final TextEditingController datectrl = .new();
  final TextEditingController paymentctrl = .new();

  @override
  void dispose() {
    namectrl.dispose();
    phonectrl.dispose();
    genderctrl.dispose();
    datectrl.dispose();
    paymentctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: "Edit Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100, // small circle
                      backgroundColor: AppColors.backgoundlightblue,
                      child: ClipOval(
                        child: FractionallySizedBox(
                          widthFactor:
                              1.6, // scales the image bigger than circle
                          heightFactor: 1.6,
                          child: Icon(Icons.person_2),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      child: Text(
                        "Change your profile",
                        style: GoogleFonts.openSans(
                          color: AppColors.darktextblue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ProfileLabel(text: "Full Name:"),
              CustomTextfield(
                labelText: "",
                hintText: "Enter your full name",
                controller: namectrl,
                maxlines: 1,
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              ProfileLabel(text: "Email:"),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgoundlightblue,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.textfield, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.email, color: AppColors.greyblue),
                    SizedBox(width: 10),
                    Text(
                      "user@gmail.com",
                      style: TextStyle(
                        color: AppColors.darktextblue,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileLabel(text: "Gender:"),
                        InkWell(
                          onTap: () =>
                              showGenderPicker(context, genderctrl, () {
                                setState(() {});
                              }),
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.backgoundlightblue,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.textfield,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  genderctrl.text.isEmpty
                                      ? "Select Gender"
                                      : genderctrl.text,
                                  style: TextStyle(
                                    color: genderctrl.text.isEmpty
                                        ? AppColors.greyblue
                                        : Colors.black,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down_circle_outlined),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileLabel(text: "Date of birth:"),

                        InkWell(
                          onTap: () => showDatepicker(context, datectrl, () {
                            setState(() {});
                          }),
                          child: Container(
                            width: double.infinity,

                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.backgoundlightblue,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.textfield,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  datectrl.text.isEmpty
                                      ? "Select DOB"
                                      : datectrl.text,
                                  style: TextStyle(
                                    color: datectrl.text.isEmpty
                                        ? AppColors.greyblue
                                        : Colors.black,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down_circle_outlined),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProfileLabel(text: "Phone Number:"),
              CustomTextfield(
                labelText: "",
                hintText: "Enter your phone number",
                controller: phonectrl,
                maxlines: 1,
                prefixIcon: Icon(Icons.phone),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ProfileLabel(text: "Payment:"),
              DropdownButtonFormField(
                dropdownColor: AppColors.backgoundlightblue,
                isExpanded: true,
                initialValue: paymentctrl.text.isEmpty
                    ? null
                    : paymentctrl.text,
                hint: Text("Select Payment Method"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.backgoundlightblue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.textfield,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.textfield,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.textfield,
                      width: 2,
                    ),
                  ),
                ),
                items:
                    [
                      "Credit Card",
                      "Debit Card",
                      "Visa/Mastercard",
                      "Cash on Delivery",
                      "Net Banking",
                      "eSewa Wallet",
                      "Khalti Wallet",
                    ].map((method) {
                      return DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    paymentctrl.text = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              CustomPrimarybutton(
                text: "Save",
                onPressed: () {
                  Get.snackbar("Success", "Saved successfully");
                  Navigator.pop(context);
                },
                width: double.infinity,
              ),
              SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileLabel extends StatelessWidget {
  final String text;

  const ProfileLabel({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        color: AppColors.darktextblue,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

dynamic showGenderPicker(
  BuildContext context,
  TextEditingController genderctrl,
  VoidCallback onChanged,
) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(100, 1000, 200, 0),
    items: [
      PopupMenuItem(value: "MALE", child: Text("Male")),
      PopupMenuItem(value: "FEMALE", child: Text("Female")),
      PopupMenuItem(value: "OTHERS", child: Text("Others")),
    ],
  ).then((value) {
    if (value != null) {
      genderctrl.text = value;
      onChanged();
    }
  });
}

dynamic showDatepicker(
  BuildContext context,
  TextEditingController datectrl,
  VoidCallback onChanged,
) async {
  await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // The initially selected date
    firstDate: DateTime(2000), // The earliest allowable date
    lastDate: DateTime(2100),
  ).then((value) {
    if (value != null) {
      datectrl.text = "${value.day}/${value.month}/${value.year}";
      onChanged();
    }
  });
}
