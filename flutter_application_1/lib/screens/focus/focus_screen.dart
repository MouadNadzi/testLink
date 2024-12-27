/*import 'package:flutter/material.dart';
import 'dart:async';
import '../../config/theme.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  bool _isFocusing = false;
  int _seconds = 0;
  Timer? _timer;

  final List<AppUsage> _appUsage = [
    AppUsage(
      appName: 'Instagram',
      icon: 'assets/icons/instagram.png',
      duration: const Duration(hours: 4),
    ),
    AppUsage(
      appName: 'Twitter',
      icon: 'assets/icons/twitter.png',
      duration: const Duration(hours: 3),
    ),
    AppUsage(
      appName: 'Facebook',
      icon: 'assets/icons/facebook.png',
      duration: const Duration(hours: 1),
    ),
    AppUsage(
      appName: 'Telegram',
      icon: 'assets/icons/telegram.png',
      duration: const Duration(minutes: 30),
    ),
    AppUsage(
      appName: 'Gmail',
      icon: 'assets/icons/gmail.png',
      duration: const Duration(minutes: 45),
    ),
  ];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startFocus() {
    setState(() {
      _isFocusing = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopFocus() {
    setState(() {
      _isFocusing = false;
      _seconds = 0;
    });
    _timer?.cancel();
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Focus Mode'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.primaryColor,
                        width: 4,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _formatDuration(_seconds),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'While your focus mode is on, all of your notifications will be off',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isFocusing ? _stopFocus : _startFocus,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                    ),
                    child: Text(_isFocusing ? 'Stop Focusing' : 'Start Focusing'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Applications',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('This Week'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _appUsage.length,
                      itemBuilder: (context, index) {
                        final app = _appUsage[index];
                        return ListTile(
                          leading: Image.asset(
                            app.icon,
                            width: 32,
                            height: 32,
                          ),
                          title: Text(app.appName),
                          subtitle: Text(
                            'You spent ${app.duration.inHours}h ${app.duration.inMinutes % 60}m on ${app.appName} today',
                          ),
                          trailing: const Icon(Icons.info_outline),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppUsage {
  final String appName;
  final String icon;
  final Duration duration;

  AppUsage({
    required this.appName,
    required this.icon,
    required this.duration,
  });
}*/
import 'package:flutter/material.dart';
import 'dart:async';
import '../../config/theme.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  bool _isFocusing = false;
  int _seconds = 0;
  Timer? _timer;

  final List<AppUsage> _appUsage = [
    AppUsage(
      appName: 'Instagram',
      icon: 'assets/icons/instagram.png',
      duration: const Duration(hours: 4),
    ),
    AppUsage(
      appName: 'Twitter',
      icon: 'assets/icons/twitter.png',
      duration: const Duration(hours: 3),
    ),
    AppUsage(
      appName: 'Facebook',
      icon: 'assets/icons/facebook.png',
      duration: const Duration(hours: 1),
    ),
    AppUsage(
      appName: 'Telegram',
      icon: 'assets/icons/telegram.png',
      duration: const Duration(minutes: 30),
    ),
    AppUsage(
      appName: 'Gmail',
      icon: 'assets/icons/gmail.png',
      duration: const Duration(minutes: 45),
    ),
  ];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startFocus() {
    setState(() {
      _isFocusing = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopFocus() {
    setState(() {
      _isFocusing = false;
      _seconds = 0;
    });
    _timer?.cancel();
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final availableHeight = screenHeight - appBarHeight - MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Focus Mode'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: availableHeight,
          child: Column(
            children: [
              SizedBox(
                height: availableHeight * 0.5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.primaryColor,
                            width: 4,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _formatDuration(_seconds),
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'While your focus mode is on, all of your notifications will be off',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _isFocusing ? _stopFocus : _startFocus,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 16,
                          ),
                        ),
                        child: Text(_isFocusing ? 'Stop Focusing' : 'Start Focusing'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Applications',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('This Week'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: _appUsage.length,
                          itemBuilder: (context, index) {
                            final app = _appUsage[index];
                            return ListTile(
                              leading: Image.asset(
                                app.icon,
                                width: 32,
                                height: 32,
                              ),
                              title: Text(app.appName),
                              subtitle: Text(
                                'You spent ${app.duration.inHours}h ${app.duration.inMinutes % 60}m on ${app.appName} today',
                              ),
                              trailing: const Icon(Icons.info_outline),
                            );
                          },
                        ),
                      ),
                    ],
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

class AppUsage {
  final String appName;
  final String icon;
  final Duration duration;

  AppUsage({
    required this.appName,
    required this.icon,
    required this.duration,
  });
}