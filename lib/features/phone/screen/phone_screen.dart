import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  String _code = '';

  void _onKeyTap(String key) {
    setState(() {
      if (key == 'del') {
        if (_code.isNotEmpty) {
          _code = _code.substring(0, _code.length - 1);
        }
        return;
      }

      if (key.isNotEmpty && _code.length < 40) {
        _code += key;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0', 'del'];

    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),
            Text(
              'Enter keycode',
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    _code.isEmpty ? '' : _code,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 220,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: keys.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.3,
                  ),
                  itemBuilder: (context, index) {
                    final key = keys[index];
                    if (key.isEmpty) return const SizedBox.shrink();

                    return ElevatedButton(
                      onPressed: () => _onKeyTap(key),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onSurface,
                        shape: const StadiumBorder(),
                      ),
                      child: key == 'del'
                          ? const Icon(Icons.backspace_outlined)
                          : Text(key, style: const TextStyle(fontSize: 24)),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.surface,
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
