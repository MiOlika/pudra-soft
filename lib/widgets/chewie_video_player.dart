import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoPlayer extends StatefulWidget {
  final String videoPath;
  final Color accentColor;

  const ChewieVideoPlayer({
    super.key,
    required this.videoPath,
    required this.accentColor,
  });

  @override
  State<ChewieVideoPlayer> createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset(widget.videoPath);
      await _controller.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: false,
        looping: true,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: widget.accentColor,
          handleColor: widget.accentColor,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.grey[300]!,
        ),
        placeholder: Container(
          color: Colors.grey[900],
          child: Center(
            child: CircularProgressIndicator(
              color: widget.accentColor,
            ),
          ),
        ),
      );

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint('Ошибка инициализации видео: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (!_isInitialized) {
      return Container(
        height: isMobile ? 150 : 200,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
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
      );
    }

    return Container(
      height: isMobile ? 150 : 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
