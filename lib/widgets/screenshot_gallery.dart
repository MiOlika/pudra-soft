import 'package:flutter/material.dart';

class ScreenshotGallery extends StatefulWidget {
  final List<String> screenshots;
  final Color accentColor;

  const ScreenshotGallery({
    super.key,
    required this.screenshots,
    required this.accentColor,
  });

  @override
  State<ScreenshotGallery> createState() => _ScreenshotGalleryState();
}

class _ScreenshotGalleryState extends State<ScreenshotGallery> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    final isDesktop = screenWidth >= 1200;

    double getHeight() {
      if (isMobile) return 200;
      if (isTablet) return 350;
      return 450;
    }

    double getThumbnailSize() {
      if (isMobile) return 50;
      if (isTablet) return 70;
      return 80;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок
        Row(
          children: [
            Text(
              'Скриншоты',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: widget.accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_currentIndex + 1} / ${widget.screenshots.length}',
                style: TextStyle(
                  color: widget.accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Основная карусель
        SizedBox(
          height: getHeight(),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: widget.screenshots.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: _buildScreenshotImage(
                        widget.screenshots[index],
                        widget.accentColor,
                      ),
                    ),
                  );
                },
              ),

              // Навигационные кнопки
              if (!isMobile)
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentIndex > 0)
                        _buildNavButton(Icons.chevron_left, () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }),
                      const Spacer(),
                      if (_currentIndex < widget.screenshots.length - 1)
                        _buildNavButton(Icons.chevron_right, () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }),
                    ],
                  ),
                ),

              // Индикаторы
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.screenshots.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentIndex == index
                              ? widget.accentColor
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Миниатюры
        if (isDesktop || isTablet) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: getThumbnailSize(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.screenshots.length,
              itemBuilder: (context, index) {
                final isActive = _currentIndex == index;
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: getThumbnailSize() * 1.3,
                    height: getThumbnailSize(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            isActive ? widget.accentColor : Colors.grey[300]!,
                        width: isActive ? 3 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: _buildScreenshotImage(
                        widget.screenshots[index],
                        widget.accentColor,
                        isThumbnail: true,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  // Метод для создания изображения с загрузкой
  Widget _buildScreenshotImage(String path, Color accentColor,
      {bool isThumbnail = false}) {
    return FutureBuilder(
      future: _loadImage(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                color: accentColor,
                strokeWidth: 2,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: Icon(
                Icons.broken_image,
                size: 40,
                color: Colors.grey,
              ),
            ),
          );
        } else {
          return Image.asset(
            path,
            fit: isThumbnail ? BoxFit.cover : BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey[200],
              child: const Center(
                child: Icon(
                  Icons.broken_image,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  // Имитация загрузки (можно заменить на реальную загрузку)
  Future<void> _loadImage(String path) async {
    // Имитация задержки загрузки
    await Future.delayed(const Duration(milliseconds: 300));
    return;
  }

  Widget _buildNavButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
