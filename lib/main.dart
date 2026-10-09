import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu du Restaurant Foodies',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Menu du Restaurant Foodies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Column : on empile verticalement la zone des catégories puis celle des plats
      body: Column(
        children: [
          // Hauteur fixe car cette zone accueillera une liste horizontale de catégories
          Container(
            height: 60,
            color: Colors.grey.shade200,
          ),
          // Expanded : la zone des plats prend toute la hauteur restante, nécessaire pour y placer une liste verticale
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class Plat {
  final String nom;
  final String categorie;
  final double prix;
  final String description;
  final String image;

  const Plat(this.nom, this.categorie, this.prix, this.description, this.image);
}

const List<String> categories = [
  'Formules',
  'Entrées',
  'Plats',
  'Desserts',
  'Boissons',
];

const List<Plat> plats = [
  Plat(
    'Formule Burger',
    'Formules',
    14.9,
    'Burger au choix accompagné de frites fraîches (supplément frites de patate douce +0,50 €).',
    'assets/images/formule_burger.jpg',
  ),
  Plat(
    'Menu Nuggets',
    'Formules',
    12.5,
    '6 nuggets de poulet maison, 1 sauce maison au choix et un accompagnement.',
    'assets/images/menu_nuggets.jpg',
  ),
  Plat(
    'Menu Kids (1-12 ans)',
    'Formules',
    6.5,
    'Burger Essentiel au choix ou 3 nuggets, sauce au choix, accompagné de frites.',
    'assets/images/menu_kids.jpg',
  ),
  Plat(
    'Nuggets de poulet maison x4',
    'Entrées',
    5.0,
    'Nuggets de poulet maison, servis avec une sauce maison au choix.',
    'assets/images/nuggets_poulet_maison.jpg',
  ),
  Plat(
    "Cromesquis d'Époisses Gaugry x4",
    'Entrées',
    4.0,
    "Bouchées panées au cœur fondant d'Époisses de la fromagerie Gaugry.",
    'assets/images/cromesquis_epoisses.jpg',
  ),
  Plat(
    'Big stick de Morbier AOP x2',
    'Entrées',
    3.5,
    'Sticks de Morbier AOP panés, cœur fondant et panure croustillante.',
    'assets/images/stick_morbier.jpg',
  ),
  Plat(
    'Petite salade',
    'Entrées',
    4.0,
    'Sucrine, pickles de légumes, croûtons, crème balsamique et vinaigrette.',
    'assets/images/petite_salade.jpg',
  ),
  Plat(
    'Frites fraîches',
    'Entrées',
    4.0,
    "Frites fraîches dorées ; gratinées à l'Époisses (+3 €) ou au cheddar maison (+2 €) en option.",
    'assets/images/frites_fraiches.jpg',
  ),
  Plat(
    'Frites de patate douce',
    'Entrées',
    4.5,
    'Frites de patate douce dorées, coupées en bâtonnets.',
    'assets/images/frites_patate_douce.jpg',
  ),
  Plat(
    'Burger Foodies',
    'Plats',
    10.9,
    "Bœuf de Bourgogne 140 g, bacon jam, double cheddar affiné, sauce BBQ au Jack Daniel's, pickles, beignet d'oignon.",
    'assets/images/burger_foodies.jpg',
  ),
  Plat(
    'Burger Burgundy',
    'Plats',
    10.9,
    "Bœuf de Bourgogne 140 g, bacon jam, sauce bourguignonne, cromesquis d'Époisses Gaugry, compotée d'oignons au vin rouge.",
    'assets/images/burger_burgundy.jpg',
  ),
  Plat(
    'Korean Burger',
    'Plats',
    10.9,
    'Poulet mariné croustillant, sauce spicy cacahuète, kimchi maison, cheddar affiné, feuille de shiso.',
    'assets/images/korean_burger.jpg',
  ),
  Plat(
    'Poutine Bourguignonne',
    'Plats',
    11.5,
    'Frites fraîches, effiloché de bœuf à la bourguignonne, oignons confits au vin rouge, Époisses Gaugry gratiné.',
    'assets/images/poutine_bourguignonne.jpg',
  ),
  Plat(
    'Poutine Gaston Gérard',
    'Plats',
    11.5,
    "Frites fraîches, poulet mariné à la moutarde à l'ancienne, sauce crémeuse façon Gaston Gérard, Comté AOP gratiné.",
    'assets/images/poutine_gaston_gerard.jpg',
  ),
  Plat(
    'Salade La Jondi',
    'Plats',
    10.5,
    'Cœur de sucrine, aiguillettes de poulet croustillantes, bacon jam, copeaux de Comté AOP, croûtons, crème balsamique.',
    'assets/images/salade_la_jondi.jpg',
  ),
  Plat(
    'Brookies',
    'Desserts',
    5.5,
    'Cookie au cœur de brownie fondant, praliné noisette, amandes et noisettes caramélisées.',
    'assets/images/brookies.jpg',
  ),
  Plat(
    'Verrine pâte à tartiner maison',
    'Desserts',
    5.5,
    'Pâte à tartiner maison, biscuit et mousse mascarpone vanille.',
    'assets/images/verrine_pate_a_tartiner.jpg',
  ),
  Plat(
    'Verrine façon Paris-Brest',
    'Desserts',
    5.5,
    'Pâte à tartiner maison, mousse praliné et choux Paris-Brest.',
    'assets/images/verrine_paris_brest.jpg',
  ),
  Plat(
    'Verrine chocolat caramel',
    'Desserts',
    5.5,
    'Mousse au chocolat, caramel au beurre salé et pépites de brownie.',
    'assets/images/verrine_chocolat_caramel.jpg',
  ),
  Plat(
    'Pepsi 50 cl',
    'Boissons',
    3.8,
    'Bouteille de 50 cl.',
    'assets/images/pepsi.jpg',
  ),
  Plat(
    'Ice Tea 50 cl',
    'Boissons',
    3.8,
    'Bouteille de 50 cl.',
    'assets/images/ice_tea.jpg',
  ),
  Plat(
    'Bière Foodies IPA',
    'Boissons',
    4.9,
    "Bière blonde aux notes d'agrumes et de fruits exotiques.",
    'assets/images/biere_foodies_ipa.jpg',
  ),
  Plat(
    'Badoit 50 cl',
    'Boissons',
    3.0,
    'Eau gazeuse, bouteille de 50 cl.',
    'assets/images/badoit.jpg',
  ),
  Plat(
    'Evian 50 cl',
    'Boissons',
    2.0,
    'Eau minérale, bouteille de 50 cl.',
    'assets/images/evian.jpg',
  ),
];
