part of 'pages.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _suggestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white38,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              color: mainColor,
              onPressed: () {},
              icon: Icon(Icons.question_answer_outlined)),
          title: Text("Kritik Dan Saran",
              style: mainTextFont.copyWith(
                  fontSize: 15, fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Enter Title'),
          ),
          TextField(
            controller: _suggestController,
            decoration: const InputDecoration(hintText: 'Enter Suggestion'),
          ),
          ElevatedButton(
            onPressed: () {
              SuggestionServices.postSuggestion(_nameController.text, _suggestController.text).then((value) {
                      print(value);
              });
            },
            child: const Text('Create Data'),
          ),
        ],
      ),
    );
  }
}
