import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoTutorialsScreen extends StatelessWidget {
  const VideoTutorialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Tutorials'),
      ),
      body: ListView(
        children: <Widget>[
          _buildTopicButton(context, 'Prenatal Exercises', 'https://www.youtube.com/watch?v=0mCvtuG_4Og'),
          _buildTopicButton(context, 'Feeding your newborn', 'https://www.youtube.com/watch?v=iKSSi5pi57I'),
          _buildTopicButton(context, 'Diaper Changing 101', 'https://www.youtube.com/watch?v=bQBOtB8ipWw'),
          _buildTopicButton(context, 'Bathing your Baby', 'https://www.youtube.com/watch?v=_9rg-DEkBQQ'),
          _buildTopicButton(context, 'Nursing Positions', 'https://www.youtube.com/watch?v=or4OnMxihUg'),
          _buildTopicButton(context, 'Baby Sleep Training', 'https://www.youtube.com/watch?v=FM918Rpgjgo'),
        ],
      ),
    );
  }

  Widget _buildTopicButton(BuildContext context, String topic, String url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          final Uri uri = Uri.parse(url);
          try {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch $url: $e')),
            );
          }
        },
        child: Text(topic),
      ),
    );
  }
}
