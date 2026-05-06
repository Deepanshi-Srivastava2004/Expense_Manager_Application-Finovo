import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInput({super.key, required this.controller, required this.onSend});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () {
      setState(() {}); // 🔥 rebuild when text changes
    };
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = widget.controller.text.trim().isEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF171A21),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              style: const TextStyle(color: Colors.white),
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "e.g. 500 pizza",
                hintStyle: TextStyle(color: Color(0xFF6B7280)),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: isEmpty ? null : widget.onSend,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                  );
                },
                child: Container(
                  key: ValueKey(isEmpty), // 🔥 THIS LINE IS THE MAGIC
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isEmpty ? Colors.grey : const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                  ),

                  child: Transform.scale(
                    scale: isEmpty ? 0.9 : 1,
                    child: SvgPicture.asset(
                      'assets/icons/sendicon.svg',
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
