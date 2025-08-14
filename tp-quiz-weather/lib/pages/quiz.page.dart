import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int current = 0;
  int score = 0;

  final quiz = const [
    {
      'title': 'Quelle est la capitale du Japon ?',
      'answers': [
        {'answer': 'Kyoto', 'correct': false},
        {'answer': 'Tokyo', 'correct': true},
        {'answer': 'Osaka', 'correct': false},
      ]
    },
    {
      'title': 'Combien font 12 × 8 ?',
      'answers': [
        {'answer': '96', 'correct': true},
        {'answer': '84', 'correct': false},
        {'answer': '108', 'correct': false},
      ]
    },
    {
      'title': 'Quel est l’élément chimique dont le symbole est "O" ?',
      'answers': [
        {'answer': 'Or', 'correct': false},
        {'answer': 'Oxygène', 'correct': true},
        {'answer': 'Osmium', 'correct': false},
      ]
    },
    {
      'title': 'Quel est l’océan le plus vaste ?',
      'answers': [
        {'answer': 'Atlantique', 'correct': false},
        {'answer': 'Pacifique', 'correct': true},
        {'answer': 'Indien', 'correct': false},
      ]
    },
    {
      'title': 'Qui a peint la Joconde ?',
      'answers': [
        {'answer': 'Léonard de Vinci', 'correct': true},
        {'answer': 'Michel-Ange', 'correct': false},
        {'answer': 'Raphaël', 'correct': false},
      ]
    },
  ];



  void _tap(Map<String, Object> a) {
    setState(() {
      if (a['correct'] == true) score++;
      current++;
    });
  }

  void _restart() => setState(() { current = 0; score = 0; });

  @override
  Widget build(BuildContext context) {
    final finished = current >= quiz.length;
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: finished
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score : ${(score / quiz.length * 100).round()} %',
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _restart, child: const Text('Restart ...')),
          ],
        ),
      )
          : ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ListTile(
            title: Center(
              child: Text(
                'Question : ${current + 1}/${quiz.length}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            title: Text(
              '${quiz[current]['title']} ?',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ...(quiz[current]['answers'] as List<Map<String, Object>>).map((ans) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _tap(ans),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${ans['answer']}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
