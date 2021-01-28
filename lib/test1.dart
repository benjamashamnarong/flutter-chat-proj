import 'package:flutter/material.dart';

class Test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // FittedBox(
          //   child: Image.asset('assets/images/test2.jpg'),
          //   fit: BoxFit.fill,
          // ),
          Container(
            height: 350.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/test2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     // height: 54.0,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(54.0),
          //         topRight: Radius.circular(54.0),
          //       ),
          //     ),
          //     child: Text('test'),
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(54.0),
                    topRight: Radius.circular(54.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 48.0,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'welcome welcome welcome',
                    ),
                    const SizedBox(
                      height: 36.0,
                    ),
                    ElevatedButton(
                      child: Text('Welcome'),
                      onPressed: () {
                        print('onPressed');
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Container(
                        width: 268.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Welcome again?'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
