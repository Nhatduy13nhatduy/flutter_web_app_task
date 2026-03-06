import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            ),
          )
          ..initialize().then((_) {
            if (mounted) {
              setState(() {});
            }
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!_controller.value.isInitialized) return;
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {});
  }

  String _formatDuration(Duration value) {
    final minutes = value.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isReady = _controller.value.isInitialized;
    final duration = isReady ? _controller.value.duration : Duration.zero;
    final position = isReady ? _controller.value.position : Duration.zero;
    final safeDuration = duration.inMilliseconds > 0
        ? duration
        : const Duration(milliseconds: 1);
    final sliderValue = position.inMilliseconds
        .clamp(0, safeDuration.inMilliseconds)
        .toDouble();

    return Scaffold(
      appBar: AppBar(title: const Text('Video'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isReady)
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                else
                  const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      onPressed: _togglePlayPause,
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                    Text(
                      '${_formatDuration(position)}/${_formatDuration(duration)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 6,
                          ),
                          trackHeight: 2,
                        ),
                        child: Slider(
                          min: 0,
                          max: safeDuration.inMilliseconds.toDouble(),
                          value: sliderValue,
                          activeColor: colorScheme.onSurface,
                          inactiveColor: colorScheme.onSurface.withValues(
                            alpha: 0.3,
                          ),
                          onChanged: (value) {
                            _controller.seekTo(
                              Duration(milliseconds: value.round()),
                            );
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
