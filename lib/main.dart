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
  String _categorieSelectionnee = 'Toute la carte';

  List<Widget> _boutonsCategories() {
    List<Widget> boutons = [];
    for (String categorie in categories) {
      boutons.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _categorieSelectionnee = categorie;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: categorie == _categorieSelectionnee
                ? Colors.deepPurple
                : Colors.white,
            child: Text(
              categorie,
              style: TextStyle(
                color: categorie == _categorieSelectionnee
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      );
    }
    return boutons;
  }

  List<Plat> _platsDeLaCategorie() {
    if (_categorieSelectionnee == 'Toute la carte') {
      return plats;
    }
    List<Plat> resultat = [];
    for (Plat plat in plats) {
      if (plat.categorie == _categorieSelectionnee) {
        resultat.add(plat);
      }
    }
    return resultat;
  }

  @override
  Widget build(BuildContext context) {
    List<Plat> platsAffiches = _platsDeLaCategorie();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Column : on empile verticalement la zone des catégories puis celle des plats
      body: Column(
        children: [
          // Hauteur fixe : la barre garde la même taille en portrait et en paysage, le reste de l'écran va aux plats
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            // SingleChildScrollView horizontal : les catégories peuvent dépasser la largeur de l'écran, surtout en portrait
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // Row : les catégories sont alignées sur une seule ligne, comme des onglets
              child: Row(
                children: _boutonsCategories(),
              ),
            ),
          ),
          // Expanded : la zone des plats prend toute la hauteur restante pour que la liste verticale défile dedans
          Expanded(
            // ListView.builder : les cartes sont créées seulement quand elles s'affichent, adapté à une liste de plats qui peut grandir
            child: ListView.builder(
              itemCount: platsAffiches.length,
              itemBuilder: (context, index) {
                return CartePlat(plat: platsAffiches[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartePlat extends StatelessWidget {
  const CartePlat({super.key, required this.plat});

  final Plat plat;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              plat.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            // Expanded : les textes prennent la largeur restante et passent à la ligne au lieu de déborder
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plat.nom,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(plat.description),
                  const SizedBox(height: 8),
                  Text(
                    plat.prix,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Plat {
  final String nom;
  final String categorie;
  final String prix;
  final String description;
  final String image;

  const Plat(this.nom, this.categorie, this.prix, this.description, this.image);
}

const List<String> categories = [
  'Toute la carte',
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
    '14,90 €',
    'Burger au choix et frites fraîches.',
    'assets/images/formule_burger.jpg',
  ),
  Plat(
    'Menu Nuggets',
    'Formules',
    '12,50 €',
    '6 nuggets maison, une sauce et un accompagnement.',
    'assets/images/menu_nuggets.jpg',
  ),
  Plat(
    'Menu Kids (1-12 ans)',
    'Formules',
    '6,50 €',
    'Petit burger ou 3 nuggets, avec des frites.',
    'assets/images/menu_kids.jpg',
  ),
  Plat(
    'Nuggets de poulet maison x4',
    'Entrées',
    '5,00 €',
    'Nuggets de poulet maison et sauce au choix.',
    'assets/images/nuggets_poulet_maison.jpg',
  ),
  Plat(
    "Cromesquis d'Époisses Gaugry x4",
    'Entrées',
    '4,00 €',
    "Bouchées panées au cœur fondant d'Époisses.",
    'assets/images/cromesquis_epoisses.jpg',
  ),
  Plat(
    'Big stick de Morbier AOP x2',
    'Entrées',
    '3,50 €',
    'Sticks de Morbier panés au cœur fondant.',
    'assets/images/stick_morbier.jpg',
  ),
  Plat(
    'Petite salade',
    'Entrées',
    '4,00 €',
    'Sucrine, pickles de légumes et croûtons.',
    'assets/images/petite_salade.jpg',
  ),
  Plat(
    'Frites fraîches',
    'Entrées',
    '4,00 €',
    'Frites fraîches maison, bien dorées.',
    'assets/images/frites_fraiches.jpg',
  ),
  Plat(
    'Frites de patate douce',
    'Entrées',
    '4,50 €',
    'Frites de patate douce dorées.',
    'assets/images/frites_patate_douce.jpg',
  ),
  Plat(
    'Burger Foodies',
    'Plats',
    '10,90 €',
    'Bœuf de Bourgogne, double cheddar, sauce BBQ.',
    'assets/images/burger_foodies.jpg',
  ),
  Plat(
    'Burger Burgundy',
    'Plats',
    '10,90 €',
    "Bœuf de Bourgogne, cromesquis d'Époisses, oignons au vin.",
    'assets/images/burger_burgundy.jpg',
  ),
  Plat(
    'Korean Burger',
    'Plats',
    '10,90 €',
    'Poulet croustillant, kimchi maison, sauce cacahuète.',
    'assets/images/korean_burger.jpg',
  ),
  Plat(
    'Poutine Bourguignonne',
    'Plats',
    '11,50 €',
    'Frites, bœuf bourguignon effiloché, Époisses gratiné.',
    'assets/images/poutine_bourguignonne.jpg',
  ),
  Plat(
    'Poutine Gaston Gérard',
    'Plats',
    '11,50 €',
    'Frites, poulet à la moutarde, Comté AOP gratiné.',
    'assets/images/poutine_gaston_gerard.jpg',
  ),
  Plat(
    'Salade La Jondi',
    'Plats',
    '10,50 €',
    'Sucrine, poulet croustillant, Comté AOP, croûtons.',
    'assets/images/salade_la_jondi.jpg',
  ),
  Plat(
    'Brookies',
    'Desserts',
    '5,50 €',
    'Cookie au cœur de brownie fondant.',
    'assets/images/brookies.jpg',
  ),
  Plat(
    'Verrine pâte à tartiner maison',
    'Desserts',
    '5,50 €',
    'Pâte à tartiner maison et mousse mascarpone.',
    'assets/images/verrine_pate_a_tartiner.jpg',
  ),
  Plat(
    'Verrine façon Paris-Brest',
    'Desserts',
    '5,50 €',
    'Mousse praliné et choux façon Paris-Brest.',
    'assets/images/verrine_paris_brest.jpg',
  ),
  Plat(
    'Verrine chocolat caramel',
    'Desserts',
    '5,50 €',
    'Mousse au chocolat et caramel beurre salé.',
    'assets/images/verrine_chocolat_caramel.jpg',
  ),
  Plat(
    'Pepsi 50 cl',
    'Boissons',
    '3,80 €',
    'Bouteille de 50 cl.',
    'assets/images/pepsi.jpg',
  ),
  Plat(
    'Ice Tea 50 cl',
    'Boissons',
    '3,80 €',
    'Bouteille de 50 cl.',
    'assets/images/ice_tea.jpg',
  ),
  Plat(
    'Bière Foodies IPA',
    'Boissons',
    '4,90 €',
    "Bière blonde aux notes d'agrumes.",
    'assets/images/biere_foodies_ipa.jpg',
  ),
  Plat(
    'Badoit 50 cl',
    'Boissons',
    '3,00 €',
    'Eau gazeuse, bouteille de 50 cl.',
    'assets/images/badoit.jpg',
  ),
  Plat(
    'Evian 50 cl',
    'Boissons',
    '2,00 €',
    'Eau minérale, bouteille de 50 cl.',
    'assets/images/evian.jpg',
  ),
];
