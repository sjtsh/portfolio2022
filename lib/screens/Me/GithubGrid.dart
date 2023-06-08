import 'package:flutter/material.dart';

class GithubGrid extends StatelessWidget {
  final BoxConstraints constraints;

  const GithubGrid(this.constraints, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff0D1117),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0).copyWith(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/me/github.jpeg"))),
                  ),
                  Positioned(
                    bottom: 33,
                    right: 0,
                    child: Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff272115),
                          border: Border.all(color: const Color(0xff855B05))),
                      child: const Icon(Icons.cloud,
                          color: Colors.white, size: 12),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sajat Shrestha",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffE6EDF6),
                fontSize: 24,
              ),
            ),
            const Text(
              "sjtsh",
              style: TextStyle(
                color: Color(0XFF7d8590),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Full Stack Developer at Techwol",
              style: TextStyle(
                color: Color(0xffE6EDF6),
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white.withOpacity(0.5),
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                const Text(
                  "Nepal",
                  style: TextStyle(
                    color: Color(0XFF7d8590),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "21 Public repositories",
              style: TextStyle(
                color: Color(0XFF7d8590),
                fontSize: 16,
              ),
            ),
            const Text(
              "935 contributions made in the last year",
              style: TextStyle(
                color: Color(0XFF7d8590),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
