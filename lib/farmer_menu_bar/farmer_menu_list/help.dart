import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('Mail us for any query',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text('Use our following mail id:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              const SizedBox(height: 16),
              const Text(
                  '2018pietcsanshuman18@poornima.org\n 2018pietcsattreya26@poornima.org\n 2018pietcsakshat12@poornima.org',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent)),
              const SizedBox(height: 19),
              buildTextField(title: 'To', controller: controllerTo),
              const SizedBox(height: 19),
              buildTextField(title: 'Subject', controller: controllerSubject),
              const SizedBox(height: 19),
              buildTextField(
                  title: 'Message', controller: controllerMessage, maxLines: 8),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('SEND'),
                onPressed: () => launchEmail(
                  toEmail:
                      "2018pietcsanshuman18@poornima.org,2018pietcsattreya26@poornima.org,2018pietcsakshat12@poornima.org",
                  subject: controllerSubject.text,
                  message: controllerMessage.text,
                ),
              ),
            ],
          ),
        ),
      );

  Future launchEmail({
    required String toEmail,
    required String subject,
    required String message,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );
}
