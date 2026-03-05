import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
      ),
      child: Container(
        height: 70,
        width: 70,
        //  color: Colors.black,   //مينفعش تدي لون لل container مادام في decoration جواه فلازم تدي اللون لل  boxdecoration فقط والا هيحصل exception
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
    );
  }
}
