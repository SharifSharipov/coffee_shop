import 'package:coffee_shop/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<AuthCubit, User?>(
        builder: (context, user) {
          if (user == null) {
            // User is not authenticated, show a "Sign In" button
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().signInAnonymously();
                },
                child: const Text('Sign In'),
              ),
            );
          } else {
            // User is authenticated, show user data and edit option
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome, ${user.displayName ?? "Anonymous"}'),
                  Text('Email: ${user.email ?? "N/A"}'),
                  // Add more user data fields as needed

                  ElevatedButton(
                    onPressed: () {
                      // Navigate to an edit profile screen or show an edit form
                      // This is where you can allow the user to edit their profile data
                    },
                    child: const Text('Edit Profile'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
