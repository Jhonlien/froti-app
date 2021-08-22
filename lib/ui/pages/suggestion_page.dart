part of 'pages.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _suggestController = TextEditingController();

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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: mainColor,
                            blurRadius: 2.0,
                            spreadRadius: 0.8)
                      ]),
                  child: TextField(
                    onChanged: (text) {},
                    controller: _nameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: mainColor),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 15, top: 15, right: 15),
                        hintText: "Nama"),
                    style: mainTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: mainColor,
                            blurRadius: 2.0,
                            spreadRadius: 0.8)
                      ]),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (text) {},
                    controller: _suggestController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.question_answer_outlined, color: mainColor),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 15, top: 15, right: 15),
                        hintText: "Kritik dan Saran"),
                    style: mainTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(padding: EdgeInsets.symmetric(horizontal: 20),
            child : SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(mainColor),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  onPressed: () async {
                    if(_nameController.text.trim() == "" || _suggestController.text.trim() == "") {
                      Flushbar(
                        duration: Duration(seconds: 3),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message: "Nama & Kritik Saran harus diisi!",
                      )..show(context);
                    }   else  {
                      SuggestionServices.postSuggestion(
                          _nameController.text, _suggestController.text
                      ).then((value) {
                        SuggestionResult result = value;
                        _nameController.text = "";
                        _suggestController.text = "";
                        if(
                        result.code == 200
                        ){
                          Flushbar(
                            duration: Duration(seconds: 3),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: mainColor,
                            message: result.message,
                          )..show(context);
                          setState(( ) { });
                        } else {
                          Flushbar(
                            duration: Duration(seconds: 3),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: result.message,
                          )..show(context);
                          setState(( ) { });
                        }
                      });
                    }
                  },
                  child: Text("Kirim", style: whiteTextFont.copyWith(fontSize: 20,fontWeight: FontWeight.bold))),
            )
          )
        ],
      ),
    );
  }
}
