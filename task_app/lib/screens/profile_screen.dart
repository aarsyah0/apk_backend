import 'dart:io';

import 'package:flutter/foundation.dart'; // For checking if it's web
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// For web
import 'package:image_picker_web/image_picker_web.dart';

import '../models/user.dart';
import '../services/profile_service.dart';

class ProfileScreen extends StatefulWidget {
  final String token;

  ProfileScreen({required this.token});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User> _profileFuture;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  dynamic _imageFile;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _profileFuture = ProfileService(widget.token).getProfile();
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final pickedFile = await ImagePickerWeb.getImageAsFile();

      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
      }
    } else {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    }
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await ProfileService(widget.token).updateProfile(
          _nameController.text,
          _emailController.text,
          _imageFile?.path,
        );

        setState(() {
          _profileFuture = ProfileService(widget.token).getProfile();
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile updated successfully!')));
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: FutureBuilder<User>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: Text('No data'));
          }

          User user = snapshot.data!;

          _nameController.text = user.name;
          _emailController.text = user.email;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _imageFile != null
                            ? (kIsWeb
                                ? NetworkImage(_imageFile.toString())
                                : FileImage(_imageFile))
                            : NetworkImage(user.photoUrl ??
                                'https://via.placeholder.com/150'),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _updateProfile,
                            child: Text('Update Profile'),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
