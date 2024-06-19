import 'package:flutter/material.dart';
import 'package:movie_app_kag/provider/grub/add_member_grub_provider.dart';
import 'package:provider/provider.dart';

class AddMemberGrubPage extends StatelessWidget {
  const AddMemberGrubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddMemberGrubProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Add Contact'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EMAIL",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              _buildTextField(
                controller: value.ctrlEmail,
                hintText: "Enter first name",
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    value.addMemberGrub(context);
                  },
                  child: Text("Add Contact"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
