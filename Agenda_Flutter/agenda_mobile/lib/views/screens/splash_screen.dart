import 'package:flutter/material.dart';
import 'dart:async';
///import 'package:agenda_mobile/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<Offset> _fadeAnimation;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();

    // Animação de entrada (Fade-up) para o logo e nome
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    // Animação de pulso para os pontinhos de loading
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _fadeController.forward();
    Timer(const Duration(seconds: 3), () {
      if (mounted) { // Verifica se o widget ainda está na tela antes de navegar
        //Navigator.pushReplacement(
          //context,
          //MaterialPageRoute(builder: (context) => const LoginScreen()),
        //);
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Cores extraídas do seu HTML/Tailwind
    const Color brandColor = Color(0xFF137FEC);
    const Color backgroundColor = Color(0xFFF0F7FF);
    const Color textColor = Color(0xFF1E293B); // Slate-800
    const Color loadingTextColor = Color(0xFF94A3B8); // Slate-400

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              
              // BEGIN: BrandIdentity
              FadeTransition(
                opacity: _fadeController,
                child: SlideTransition(
                  position: _fadeAnimation,
                  child: Column(
                    children: [
                      // Calendar Icon (Recriado visualmente do SVG)
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        width: 128,
                        height: 128,
                        child: CustomPaint(
                          painter: CalendarIconPainter(color: brandColor),
                        ),
                      ),
                      // App Name
                      const Text(
                        'Agenda Inteligente',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          letterSpacing: -0.5,
                          fontFamily: 'Inter', // Certifique-se de adicionar no pubspec
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // BEGIN: LoadingIndicator
              Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            // Delay simulado para o efeito de onda dos pontos
                            double delay = index * 0.2;
                            double value = Curves.easeInOut.transform(
                              ((_pulseController.value + delay) % 1.0),
                            );
                            return Opacity(
                              opacity: 0.3 + (value * 0.7),
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: brandColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'CARREGANDO',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: loadingTextColor,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Desenha o ícone do calendário idêntico ao SVG do Stitch
class CalendarIconPainter extends CustomPainter {
  final Color color;
  CalendarIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final rect = Rect.fromLTWH(size.width * 0.1, size.height * 0.2, size.width * 0.8, size.height * 0.7);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)), paint);

    // Linhas do calendário
    canvas.drawLine(Offset(size.width * 0.7, size.height * 0.1), Offset(size.width * 0.7, size.height * 0.3), paint);
    canvas.drawLine(Offset(size.width * 0.3, size.height * 0.1), Offset(size.width * 0.3, size.height * 0.3), paint);
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.45), Offset(size.width * 0.9, size.height * 0.45), paint);

    // O ponto de "Inteligência"
    final dotPaint = Paint()..color = color..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.7), 8, dotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

