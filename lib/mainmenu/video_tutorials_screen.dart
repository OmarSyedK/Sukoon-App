import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoTutorialsScreen extends StatelessWidget {
  const VideoTutorialsScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> videoData = const [
    {'title': 'Prenatal Exercises', 'url': 'https://www.youtube.com/watch?v=0mCvtuG_4Og'},
    {'title': 'Feeding your newborn', 'url': 'https://www.youtube.com/watch?v=iKSSi5pi57I'},
    {'title': 'Diaper Changing 101', 'url': 'https://www.youtube.com/watch?v=bQBOtB8ipWw'},
    {'title': 'Bathing your Baby', 'url': 'https://www.youtube.com/watch?v=_9rg-DEkBQQ'},
    {'title': 'Nursing Positions', 'url': 'https://www.youtube.com/watch?v=or4OnMxihUg'},
    {'title': 'Baby Sleep Training', 'url': 'https://www.youtube.com/watch?v=FM918Rpgjgo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Video Tutorials'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: videoData.length,
        itemBuilder: (context, index) {
          final video = videoData[index];
          return _buildVideoCard(context, video['title']!, video['url']!);
        },
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, String title, String url) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          try {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch $url: $e')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.play_circle_fill,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
