import 'package:flutter/material.dart';

class CVScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curriculum Vitae'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildSectionTitle('Expériences Professionnelles'),
            _buildExperienceItem(
              context,
              title: 'Développeur Full Stack',
              company: 'SoftToDo',
              duration: 'Depuis 05 janvier 2022',
              description:
                  'J\'ai occupé le poste de développeur full stack avec Laravel, Vue.js et Angular au sein d\'une entreprise partenaire allemande, en développant des solutions innovantes.',
            ),
            _buildExperienceItem(
              context,
              title: 'Développeur Full Stack',
              company: 'Navicom',
              duration: '01 septembre 2021 - 03 janvier 2022',
              description:
                  'J\'ai travaillé sur un système ERP avec React et PHP.',
            ),
            _buildExperienceItem(
              context,
              title: 'Stagiaire PFE',
              company: 'Lycée Technique Djerba',
              duration: '8 mars 2021 – 5 juin 2021',
              description:
                  'Développement du site de media social au Milieux scolaire',
            ),
            _buildSectionTitle('Diplômes et Formations'),
            _buildEducationItem(
              context,
              degree: 'Diplôme | Licence DSI',
              institution: '2021',
              description: 'Moyenne générale 13,12 et Moyenne PFE 15.35',
            ),
            _buildEducationItem(
              context,
              degree: 'Formation | Symfony | Back End',
              institution: 'WeCodeLand Tunisie',
              description: 'Formation durée 40 heures',
            ),
            _buildSectionTitle('Connaissances'),
            _buildSkillList([
              'Analyse de données et statistique',
              'SEO (Optimisation pour les moteurs de recherche)',
              'Structure de base de données',
              'Figma',
              'Marketing digital',
            ]),
            _buildSectionTitle('Compétences'),
            _buildSkillList([
              'Laravel',
              'PHP',
              'Vue.js',
              'Angular',
              'CSS',
              'JavaScript',
              'Ionic',
              'Node.js',
              'Symfony',
              'React.js',
              'React Native',
              'Python',
              'Nuxt.js',
              'TypeScript',
              'Git',
            ]),
            _buildSectionTitle('Objectif'),
            _buildText(
                'Je m\'efforce de constamment perfectionner et renforcer mes compétences.'),
            _buildSectionTitle('Contact'),
            _buildContactItem('Email', 'mboughdiri4@gmail.com'),
            _buildContactItem('Téléphone', '25458799'),
            _buildContactItem('Adresse', 'ROUTE AIREPORT KM 8, 3078'),
            _buildContactItem('Date de naissance', '15/06/1994'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MAHER BOUGHDIRI',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'DÉVELOPPEUR FULL STACK',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildExperienceItem(BuildContext context,
      {required String title,
      required String company,
      required String duration,
      required String description}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          '$title | $company',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.0),
            Text(duration, style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 8.0),
            Text(description, textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationItem(BuildContext context,
      {required String degree,
      required String institution,
      required String description}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          degree,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.0),
            Text(institution, style: TextStyle(color: Colors.blueAccent)),
            SizedBox(height: 8.0),
            Text(description, textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillList(List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills.map((skill) => _buildSkillItem(skill)).toList(),
    );
  }

  Widget _buildSkillItem(String skill) {
    return ListTile(
      title: Text(skill),
      leading: Icon(Icons.star, color: Colors.blueAccent),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildContactItem(String label, String value) {
    return ListTile(
      title: Text(value),
      leading: Icon(Icons.contact_mail, color: Colors.blueAccent),
      subtitle: Text(label),
    );
  }
}
