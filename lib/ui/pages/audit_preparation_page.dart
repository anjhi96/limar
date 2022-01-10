part of 'pages.dart';

class AuditPreparationPage extends StatefulWidget {
  @override
  _AuditPreparationPageState createState() => _AuditPreparationPageState();
}

class _AuditPreparationPageState extends State<AuditPreparationPage> {
  User user;
  Data data;

  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  List<String> auditArea;
  String selectedAuditArea;

  @override
  void initState() {
    super.initState();
    auditArea = [
      'Meja 1',
      'Meja 2',
      'Meja 3',
      'Meja 4',
      'Meja 5',
      'Meja 6',
      'Meja 7'
    ];
    selectedAuditArea = auditArea[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Memulai Audit',
      subtitle: 'Selamat memulai audit!',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Area",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton(
              value: selectedAuditArea,
              isExpanded: true,
              underline: SizedBox(),
              items: auditArea
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: blackFontStyle3),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedAuditArea = item;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type audit password"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      if ((passwordController.text) == "123") {
                        Get.off(AuditRingkasPage(Data(area: selectedAuditArea)));
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(MdiIcons.closeCircleOutline,
                                color: Colors.white),
                            titleText: Text(
                              'Gagal Masuk',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              ("Password Salah"),
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Text(
                      "Mulai Audit Sekarang",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
