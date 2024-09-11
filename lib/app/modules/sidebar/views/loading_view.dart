import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(12), 
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Loading',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[300], 
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[500]!),
            ),
          ],
        ),
      ),
    );
  }
}
