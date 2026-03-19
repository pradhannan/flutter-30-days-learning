import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/widgets/App/AppBar/custom_appbar.dart';
import 'package:my_trial_first_app/widgets/Buttons/custom_primarybutton.dart';
import 'package:my_trial_first_app/widgets/Textfield/custom_textfield.dart';

class SendFeedbackPage extends StatefulWidget {
  const SendFeedbackPage({super.key});

  @override
  State<SendFeedbackPage> createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  final TextEditingController textctrl = TextEditingController();

  @override
  void dispose() {
    textctrl.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: "SEND FEEDBACK"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We’d love your feedback!",
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Let us know what you think about the app.",
              style: GoogleFonts.openSans(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            CustomTextfield(
              labelText: "",
              controller: textctrl,
              maxlines: 5,
              hintText: "Write your feedback here...",
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: CustomPrimarybutton(
                text: "Submit feedback",
                onPressed: () {
                Get.snackbar(
    "Thanky ou for your valuable feedback",
    "The feedback was sent successfully however it is just a demo",
    backgroundColor: Colors.blueAccent,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white
  );
                 Navigator.pop(context);
                  

     
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}