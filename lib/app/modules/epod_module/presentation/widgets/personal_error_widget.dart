import 'package:flutter/material.dart';
import '../../../../common/resources/app_colors.dart';

class PersonalError extends StatelessWidget {
  final VoidCallback onTryAgain;
  const PersonalError({Key? key, required this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 100,
              color: AppColors.grey,
            ),
            const SizedBox(height: 20),
            const Text(
              'Ops...',
            ),
            const SizedBox(height: 20),
            const Text(
              'Um erro aconteceu. Por favor, tente novamente ou contate o suporte',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onTryAgain,
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
