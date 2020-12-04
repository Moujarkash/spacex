import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final Function onRetry;
  final String message;

  const ErrorView({this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red,),
          const SizedBox(height: 8,),
          Text(message != null ? message : 'OOPS! Something went wrong. please try again', textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle2,),
          const SizedBox(height: 16,),
          RaisedButton(
              child: Text('Retry'),
            onPressed: () {
                if (onRetry != null)
                  onRetry();
            },
          )
        ],
      ),
    );
  }
}