import 'package:flutter/material.dart';
import 'package:nourish_app/widgets/app_text_field.dart';

// --- Example usage ---

class ProfileInfoScreen extends StatefulWidget {
  @override
  _ProfileInfoScreenState createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();

  String? _notEmptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save logic here
      setState(() {
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully')),
      );
    }
  }
  


  @override
  Widget build(BuildContext context) {
     final colorScheme = Theme.of(context).colorScheme;
   
    return Scaffold(
      backgroundColor:colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Header with edit icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Your info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color:colorScheme.onSurface,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                    child: const Icon(Icons.edit, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Form Starts Here
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  // Always show scrollbar (optional)
                  thickness: 4,
                  radius: const Radius.circular(10),
                  trackVisibility: true,
                  interactive: true,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            controller: _nameController,
                            label: "Name:",
                            hintText: "your name",
                            keyboardType: TextInputType.text,
                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _genderController,
                            label: "Gender:",
                            hintText: "your gender",
                            keyboardType: TextInputType.text,
                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _dobController,
                            label: "DOB:",
                            hintText: "DD/MM/YYYY",
                            keyboardType: TextInputType.datetime,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _heightController,
                            label: "Height:",
                            hintText: "Enter height in cm",
                            keyboardType: TextInputType.number,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _weightController,
                            label: "Weight:",
                            hintText: "Enter weight in kg",
                            keyboardType: TextInputType.number,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          AppTextField(
                            controller: _activityController,
                            label: "Activity Level:",
                            hintText: "e.g., Sedentary, Active, Very Active",
                            keyboardType: TextInputType.text,

                            enabled: _isEditing,
                            validator: _notEmptyValidator,
                          ),
                          const SizedBox(height: 20),

                          if (_isEditing)
                            ElevatedButton(
                              onPressed: _saveProfile,
                              child: const Text("Save"),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _dobController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _activityController.dispose();
    super.dispose();
  }
}
