import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';



class MecabLoadingIndicator extends StatelessWidget {
  const MecabLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            SizedBox(
              height: 64,
              width: 64,
              child: LoadingIndicator(
                indicatorType: Indicator.audioEqualizer,
                colors: [Colors.red, Colors.deepOrange, Colors.yellow, Colors.green],
                strokeWidth: 1,
              ),
            ),
            Text("Loading MeCab libraries...")
          ],
        )
      ),
    );
  }
}