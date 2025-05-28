import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:flutter/material.dart';

class BodyTextView extends StatelessWidget {
  const BodyTextView({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
          Text(
          'Building AI-driven Organizations',
          style: TextStyle(
              fontSize:38, color: Colors.black, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Solving business problems with Generative AI and Machine Learning solutions',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.blue,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Explore More',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
