import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'home_model.dart';
import 'package:nourish_app/widgets/app_dialogue.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _showNotePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ExerciseNoteDialog(
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          // Trigger popup after first frame render
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!model.dialogShown) {
              _showNotePopup(context);
              model.dialogShown = true;
            }
          });
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/profile'),
                child: Text('Go to Profile'),
              ),
            ),
          );
        },
      ),
    );
  }
}
