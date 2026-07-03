import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VkVideoPlayer extends StatelessWidget {
  final String videoOwnerId;
  final String videoId;
  final String coverPath;
  final Color accentColor;

  const VkVideoPlayer({
    super.key,
    required this.videoOwnerId,
    required this.videoId,
    required this.accentColor,
    required this.coverPath,
  });

  String get _videoUrl {
    final ownerId =
        videoOwnerId.startsWith('-') ? videoOwnerId : '-$videoOwnerId';
    return 'https://vkvideo.ru/video_ext.php?oid=$ownerId&id=$videoId&hd=2';
  }

  Future<void> _openVideo() async {
    final Uri url = Uri.parse(_videoUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Не удалось открыть ссылку: $_videoUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width > 1000
        ? 1000.0
        : MediaQuery.of(context).size.width;

    return Center(
      child: GestureDetector(
        onTap: _openVideo,
        child: Container(
          width: width,
          height: width * 9 / 16,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(coverPath),
            ),
          ),
          child: Stack(
            children: [
              // затемнение
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              // Кнопка проигрывания
              Center(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
