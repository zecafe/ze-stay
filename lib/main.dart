import 'package:flutter/material.dart';

void main() => runApp(const ZeStayApp());

class ZeStayApp extends StatelessWidget {
  const ZeStayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zé Stay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF173F35)),
        scaffoldBackgroundColor: const Color(0xFFF7F1E3),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                width: 76,
                height: 76,
                decoration: const BoxDecoration(color: Color(0xFF173F35), shape: BoxShape.circle),
                child: const Icon(Icons.landscape_rounded, color: Color(0xFFF2C66D), size: 40),
              ),
              const SizedBox(height: 28),
              Text('Bem-vindo à\nPousada do Capão', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700, color: const Color(0xFF173F35))),
              const SizedBox(height: 14),
              const Text('Sua experiência no Vale começa aqui.', style: TextStyle(fontSize: 18, height: 1.4)),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StayHomePage())),
                  child: const Text('Entrar na minha estadia'),
                ),
              ),
              const SizedBox(height: 12),
              const Center(child: Text('Zé Stay • Hospitalidade inteligente', style: TextStyle(fontSize: 12))),
            ],
          ),
        ),
      ),
    );
  }
}

class StayHomePage extends StatelessWidget {
  const StayHomePage({super.key});

  static const items = <(IconData, String, String)>[
    (Icons.wifi_rounded, 'Wi-Fi', 'Conecte-se'),
    (Icons.key_rounded, 'Meu acesso', 'Quarto e entrada'),
    (Icons.coffee_rounded, 'Café da manhã', '07:30 às 10:00'),
    (Icons.spa_rounded, 'SPA', 'Massagens e terapias'),
    (Icons.hot_tub_rounded, 'Saunas', 'Seca e úmida'),
    (Icons.pool_rounded, 'Piscina', 'Piscina e hidro'),
    (Icons.water_rounded, 'Rio Batista', 'Banho de natureza'),
    (Icons.theaters_rounded, 'Cinema & cultura', 'Programação da pousada'),
    (Icons.restaurant_rounded, 'Gastronomia', 'Restaurantes e experiências'),
    (Icons.support_agent_rounded, 'Preciso de algo', 'Fale com a recepção'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha Estadia'), backgroundColor: Colors.transparent),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFF173F35), borderRadius: BorderRadius.circular(24)),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Pousada do Capão', style: TextStyle(color: Color(0xFFF2C66D), fontSize: 22, fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              Text('Vale do Capão • Chapada Diamantina', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 18),
              Text('Check-in a partir das 14:00  •  Check-out até 12:00', style: TextStyle(color: Colors.white)),
            ]),
          ),
          const SizedBox(height: 24),
          const Text('Tudo para sua estadia', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF173F35))),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.12),
            itemBuilder: (_, i) {
              final item = items[i];
              return Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(item.$1, color: const Color(0xFF173F35), size: 30),
                    const Spacer(),
                    Text(item.$2, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(item.$3, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  ]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
