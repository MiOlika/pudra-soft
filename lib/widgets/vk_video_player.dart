import 'package:flutter/material.dart';
import 'package:vk_video/vk_video.dart';

class VkVideoPlayer extends StatefulWidget {
  final String videoOwnerId;
  final String videoId;
  final Color accentColor;

  const VkVideoPlayer({
    super.key,
    required this.videoOwnerId,
    required this.videoId,
    required this.accentColor,
  });

  @override
  State<VkVideoPlayer> createState() => _VkVideoPlayerState();
}

class _VkVideoPlayerState extends State<VkVideoPlayer> {
  late VKVideoController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VKVideoController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final double width = screenWidth > 1000 ? 1000 : screenWidth;
    return SizedBox(
      width: width,
      height: width / 16 * 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: VKVideo(
          controller: _controller,
          videoOId: widget.videoOwnerId,
          videoId: widget.videoId,
          isAutoPlay: false,
          isIframeAllowFullscreen: true,
          // полноэкранный режим
          videoResolutionEnum: VideoResolutionEnum.p480,
          backgroundColor: Colors.black,
          initialWidget: Container(
            color: Colors.grey[900],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: widget.accentColor,
                      strokeWidth: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Загрузка видео...',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
