import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'onboarding_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/landing'),
                child: Text('Go to Landing'),
              ),
            ),
          );
        },
      ),
    );
  }
}
