import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const ZeStayApp());

const green = Color(0xFF164A3A);
const cream = Color(0xFFF7F1E3);
const gold = Color(0xFFE5A52B);
const whatsapp = '557591114035';
const bookingUrl = 'https://www.booking.com/hotel/br/pousada-do-capapso.pt-br.html';
const officialUrl = 'https://www.pousadadocapao.com.br/';
const propertyPhoto = 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/af/79/ad/pousada-do-capao.jpg?h=-1&s=1&w=1200';
const propertyPhoto2 = 'https://images.trvl-media.com/lodging/37000000/36050000/36045300/36045280/1c4afd92.jpg?impolicy=resizecrop&ra=fill&rh=575&rw=575';

class ZeStayApp extends StatelessWidget {
  const ZeStayApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pousada do Capão • Zé Stay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: green),
          scaffoldBackgroundColor: cream,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: green, foregroundColor: Colors.white, centerTitle: true),
          filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(backgroundColor: green, foregroundColor: Colors.white)),
        ),
        home: const WelcomePage(),
      );
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFFFE2A5), cream]),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(children: [
                const Spacer(),
                ClipOval(child: Image.asset('assets/pousada_logo.jpg', width: 190, height: 190, fit: BoxFit.cover)),
                const SizedBox(height: 28),
                const Text('Bem-vindo à Pousada do Capão', textAlign: TextAlign.center, style: TextStyle(fontSize: 34, height: 1.05, fontWeight: FontWeight.w700, color: green)),
                const SizedBox(height: 14),
                const Text('Natureza, conforto e alma em cada experiência.', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, height: 1.45)),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const StayHomePage())),
                    child: const Text('Entrar na minha estadia'),
                  ),
                ),
                const SizedBox(height: 14),
                const Text('Zé Stay • Hospitalidade inteligente', style: TextStyle(color: green, fontWeight: FontWeight.w600)),
              ]),
            ),
          ),
        ),
      );
}

class StayHomePage extends StatelessWidget {
  const StayHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = <_Item>[
      _Item(Icons.wifi, 'Wi-Fi', const WifiPage()),
      _Item(Icons.lock_outline, 'Meu acesso', const AccessPage()),
      _Item(Icons.coffee, 'Café da manhã', const BreakfastPage()),
      _Item(Icons.spa, 'SPA', const BookingPage(title: 'SPA', subtitle: 'Massagens e terapias', slots: ['09:00', '11:00', '14:00', '15:30', '17:00', '18:30'])),
      _Item(Icons.hot_tub, 'Saunas', const BookingPage(title: 'Saunas', subtitle: 'Sauna seca e úmida', slots: ['08:00', '10:00', '12:00', '16:00', '17:30', '19:00', '20:30'])),
      _Item(Icons.pool, 'Piscina', const PhotoPage(title: 'Piscina', text: 'Relaxe e aproveite a estrutura de bem-estar da Pousada do Capão.', image: propertyPhoto2)),
      _Item(Icons.water, 'Rio Batista', const PhotoPage(title: 'Rio Batista', text: 'Um convite para se conectar com a natureza e aproveitar o banho de rio da pousada.', image: propertyPhoto)),
      _Item(Icons.restaurant, 'Gastronomia', const GastronomyPage()),
      _Item(Icons.explore, 'Conheça o Vale', const ValePage(), highlight: true),
      _Item(Icons.theaters, 'Cinema e Cultura', const InfoPage(title: 'Cinema e Cultura', text: 'Programação cultural, cinema, encontros e experiências da pousada. Consulte a recepção para a agenda do dia.')),
      _Item(Icons.support_agent, 'Precisa de algo?', const HelpPage()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          ClipOval(child: Image.asset('assets/pousada_logo.jpg', width: 34, height: 34)),
          const SizedBox(width: 10),
          const Text('Minha Estadia'),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: gold,
        foregroundColor: green,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BotPage())),
        icon: const Icon(Icons.smart_toy_outlined),
        label: const Text('Bot Zé Stay', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 100),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(alignment: Alignment.bottomLeft, children: [
              Image.network(propertyPhoto, height: 190, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 190, color: green)),
              Container(height: 190, decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0xCC000000)]))),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Text('Pousada do Capão', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
                  SizedBox(height: 4),
                  Text('Vale do Capão • Chapada Diamantina', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 10),
                  Text('Check-in 14h • Check-out 12h', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                ]),
              ),
            ]),
          ),
          const SizedBox(height: 22),
          const Text('Tudo para sua estadia', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: green)),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.1),
            itemBuilder: (context, i) {
              final x = items[i];
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => x.page)),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: x.highlight ? gold : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: x.highlight ? gold : const Color(0xFFE7DDC9))),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(x.icon, color: green, size: 30),
                    const Spacer(),
                    Text(x.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: green)),
                    if (x.highlight) const Text('com Zé Capão', style: TextStyle(fontSize: 11, color: green)),
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

class _Item {
  final IconData icon;
  final String title;
  final Widget page;
  final bool highlight;
  const _Item(this.icon, this.title, this.page, {this.highlight = false});
}

class BrandedPage extends StatelessWidget {
  final String title;
  final Widget child;
  const BrandedPage({super.key, required this.title, required this.child});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: SafeArea(child: child));
}

class WifiPage extends StatelessWidget {
  const WifiPage({super.key});
  @override
  Widget build(BuildContext context) => BrandedPage(
        title: 'Wi-Fi',
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              const Text('Conecte-se à nossa rede', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: green)),
              const SizedBox(height: 8),
              const Text('Aponte a câmera do celular para o QR Code abaixo.', textAlign: TextAlign.center),
              const SizedBox(height: 22),
              Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Image.asset('assets/wifi_qr.png', width: 280, height: 280)),
              const SizedBox(height: 18),
              const Text('Rede: Pousada Capao 03', style: TextStyle(fontWeight: FontWeight.w700)),
              const Text('Senha: pousada0121'),
            ]),
          ),
        ),
      );
}

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});
  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  late int code;
  @override
  void initState() {
    super.initState();
    code = 1000 + Random().nextInt(9000);
  }

  @override
  Widget build(BuildContext context) => BrandedPage(
        title: 'Meu acesso',
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.lock_outline, size: 54, color: green),
              const SizedBox(height: 18),
              const Text('Sua senha de acesso ao quarto', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: green), textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Container(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: Text('$code', style: const TextStyle(fontSize: 46, letterSpacing: 10, fontWeight: FontWeight.w700, color: green))),
              const SizedBox(height: 16),
              const Text('Código demonstrativo válido para esta sessão.'),
              const SizedBox(height: 22),
              FilledButton.icon(onPressed: () => setState(() => code = 1000 + Random().nextInt(9000)), icon: const Icon(Icons.refresh), label: const Text('Gerar nova senha')),
            ]),
          ),
        ),
      );
}

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});
  @override
  Widget build(BuildContext context) => BrandedPage(
        title: 'Café da manhã',
        child: ListView(padding: const EdgeInsets.all(20), children: [
          ClipRRect(borderRadius: BorderRadius.circular(22), child: Image.network(propertyPhoto, height: 230, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 230, color: green))),
          const SizedBox(height: 18),
          const Text('Comece o dia com energia', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: green)),
          const SizedBox(height: 8),
          const Text('Buffet com frutas frescas, pães, frios e bebidas.'),
          const SizedBox(height: 18),
          const Card(child: ListTile(leading: Icon(Icons.schedule, color: green), title: Text('Horário'), subtitle: Text('07h30 às 10h00'))),
          const SizedBox(height: 12),
          OutlinedButton.icon(onPressed: () => launchUrl(Uri.parse(bookingUrl), mode: LaunchMode.externalApplication), icon: const Icon(Icons.photo_library_outlined), label: const Text('Ver fotos oficiais no Booking')),
        ]),
      );
}

class BookingPage extends StatefulWidget {
  final String title, subtitle;
  final List<String> slots;
  const BookingPage({super.key, required this.title, required this.subtitle, required this.slots});
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? selected;
  @override
  Widget build(BuildContext context) => BrandedPage(
        title: widget.title,
        child: ListView(padding: const EdgeInsets.all(20), children: [
          const Icon(Icons.spa, size: 58, color: green),
          const SizedBox(height: 12),
          const Text('Agende seu horário', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: green), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          Text(widget.subtitle, textAlign: TextAlign.center),
          const SizedBox(height: 22),
          ...widget.slots.map((s) => Card(child: ListTile(title: Text(s), trailing: Icon(selected == s ? Icons.check_circle : Icons.chevron_right, color: green), onTap: () => setState(() => selected = s)))),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: selected == null ? null : () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.title} reservado para $selected • demonstração'))),
            child: const Text('Confirmar agendamento'),
          ),
        ]),
      );
}

class PhotoPage extends StatelessWidget {
  final String title, text, image;
  const PhotoPage({super.key, required this.title, required this.text, required this.image});
  @override
  Widget build(BuildContext context) => BrandedPage(
        title: title,
        child: ListView(padding: const EdgeInsets.all(20), children: [
          ClipRRect(borderRadius: BorderRadius.circular(22), child: Image.network(image, height: 300, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 300, color: green))),
          const SizedBox(height: 18),
          Text(title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: green)),
          const SizedBox(height: 10),
          Text(text, style: const TextStyle(fontSize: 17, height: 1.4)),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: () => launchUrl(Uri.parse(officialUrl), mode: LaunchMode.externalApplication), child: const Text('Ver mais no site da Pousada')),
        ]),
      );
}

class GastronomyPage extends StatelessWidget {
  const GastronomyPage({super.key});
  @override
  Widget build(BuildContext context) {
    const places = [
      ['Restaurante Candeia', 'Cozinha regional e experiências da casa'],
      ['Pizzaria Candeia', 'Pizzas artesanais'],
      ['Bistrô Gastô', 'Culinária criativa'],
      ['Zecafé', 'Cafés, bebidas e encontros'],
    ];
    return BrandedPage(
      title: 'Gastronomia',
      child: ListView(padding: const EdgeInsets.all(20), children: [
        const Text('Sabores que fazem parte da estadia', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: green)),
        const SizedBox(height: 16),
        ...places.map((p) => Card(child: ListTile(leading: const Icon(Icons.restaurant_menu, color: green), title: Text(p[0], style: const TextStyle(fontWeight: FontWeight.w700)), subtitle: Text(p[1]), trailing: const Icon(Icons.chevron_right)))),
      ]),
    );
  }
}

class ValePage extends StatelessWidget {
  const ValePage({super.key});
  @override
  Widget build(BuildContext context) => BrandedPage(
        title: 'Conheça o Vale',
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(26),
            child: Column(children: [
              ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.asset('assets/zecapao_icon.jpg', width: 180, height: 180, fit: BoxFit.cover)),
              const SizedBox(height: 22),
              const Text('Explore o Vale com o Zé Capão', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: green), textAlign: TextAlign.center),
              const SizedBox(height: 10),
              const Text('Gastronomia, atrações, eventos, serviços e experiências locais.', textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => launchUrl(Uri.parse('https://www.zecapaodelivery.com.br/'), mode: LaunchMode.externalApplication),
                icon: const Icon(Icons.explore),
                label: const Text('Conhecer o Vale'),
              ),
            ]),
          ),
        ),
      );
}

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});
  @override
  Widget build(BuildContext context) => BrandedPage(
        title: 'Precisa de algo?',
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.chat, color: Color(0xFF25D366), size: 72),
              const SizedBox(height: 16),
              const Text('Fale com nossa equipe pelo WhatsApp', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: green), textAlign: TextAlign.center),
              const SizedBox(height: 10),
              const Text('(75) 91114-035', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => launchUrl(
                  Uri.parse('https://wa.me/$whatsapp?text=Olá! Preciso de ajuda durante minha estadia na Pousada do Capão.'),
                  mode: LaunchMode.externalApplication,
                ),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Abrir WhatsApp'),
              ),
            ]),
          ),
        ),
      );
}

class InfoPage extends StatelessWidget {
  final String title, text;
  const InfoPage({super.key, required this.title, required this.text});
  @override
  Widget build(BuildContext context) => BrandedPage(
        title: title,
        child: Center(child: Padding(padding: const EdgeInsets.all(28), child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 19, height: 1.5, color: green)))),
      );
}

class BotPage extends StatefulWidget {
  const BotPage({super.key});
  @override
  State<BotPage> createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  final messages = <String>['Olá! Sou o Bot Zé Stay. Posso ajudar com horários, Wi-Fi, SPA, gastronomia e experiências no Vale.'];
  final controller = TextEditingController();

  void send(String value) {
    if (value.trim().isEmpty) return;
    final q = value.trim();
    setState(() {
      messages.add('Você: $q');
      final l = q.toLowerCase();
      String a;
      if (l.contains('wifi') || l.contains('wi-fi')) {
        a = 'Abra o botão Wi-Fi na tela principal para ver o QR Code da rede Pousada Capao 03.';
      } else if (l.contains('café') || l.contains('cafe')) {
        a = 'O café da manhã é servido das 07h30 às 10h00.';
      } else if (l.contains('spa') || l.contains('sauna')) {
        a = 'Abra SPA ou Saunas na tela principal e escolha um dos horários disponíveis.';
      } else if (l.contains('vale')) {
        a = 'Toque em Conheça o Vale para explorar com o Zé Capão.';
      } else if (l.contains('ajuda') || l.contains('recepção') || l.contains('recepcao')) {
        a = 'Posso abrir o WhatsApp da recepção pelo botão Precisa de algo?.';
      } else {
        a = 'Posso te orientar sobre Wi-Fi, acesso, café da manhã, SPA, saunas, gastronomia, Rio Batista e o Vale.';
      }
      messages.add('Zé Stay: $a');
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) => BrandedPage(
        title: 'Bot Zé Stay',
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (_, i) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: i == 0 || messages[i].startsWith('Zé Stay') ? Colors.white : const Color(0xFFFFE3A3), borderRadius: BorderRadius.circular(16)),
                child: Text(messages[i]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Expanded(child: TextField(controller: controller, onSubmitted: send, decoration: const InputDecoration(hintText: 'Pergunte algo...', border: OutlineInputBorder()))),
              const SizedBox(width: 8),
              IconButton.filled(onPressed: () => send(controller.text), icon: const Icon(Icons.send)),
            ]),
          ),
        ]),
      );
}
