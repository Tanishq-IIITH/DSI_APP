import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PreviousSubmissionsScreen extends StatefulWidget {
  final String data;

  const PreviousSubmissionsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _PreviousSubmissionsScreenState createState() =>
      _PreviousSubmissionsScreenState();
}

class _PreviousSubmissionsScreenState extends State<PreviousSubmissionsScreen> {
  final List<Map<String, String>> submissions = [
    {'title': 'Submission 1', 'date': '23/10/2024'},
    {'title': 'Submission 2', 'date': '12/10/2024'},
    {'title': 'Submission 3', 'date': '01/11/2024'},
  ];

  Future<void> Myinit() async {
    // send a post request to fetch previous submissions

    // const url = 'http://localhost:3000/api/users/pastsubmissions';
    String backendUrl = dotenv.env['BACKEND_URL']!;

    final url = '${backendUrl}/api/users/pastsubmissions';

    final response = await http.post(Uri.parse(url), body: {
      'data': widget.data,
    });
    print(response.body);
  }

  @override
  void initState() {
    // send a post request to fetch previous submissions

    // const url = 'http://localhost:3000/api/users/pastsubmissions';
    // final response = await http.post(Uri.parse(url), body: {
    //   'data': widget.data,
    // });

    Myinit();
    // print(response.body);

    super.initState();
  }

// post request  kidhar likhu>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Submissions'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: submissions.length,
          itemBuilder: (context, index) {
            final submission = submissions[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        submission['title'] ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        submission['date'] ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
