part of 'pages.dart';

class FotoKomentarPage extends StatefulWidget {
  final Data data;

  FotoKomentarPage(this.data);

  @override
  _FotoKomentarPageState createState() => _FotoKomentarPageState();
}

class _FotoKomentarPageState extends State<FotoKomentarPage> {
  Data data;
  bool isLoading = false;
  File pictureAudit;

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Foto & Komentar Area',
      subtitle: 'Lengkapi audit anda',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              PickedFile pickedFile =
                  await ImagePicker().getImage(source: ImageSource.camera);
              if (pickedFile != null) {
                pictureAudit = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              width: 320,
              height: 320,
              margin: EdgeInsets.only(top: 26),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/photo_border.png'))),
              child: (pictureAudit != null)
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(pictureAudit), fit: BoxFit.cover),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/photo.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Komentar",
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
              controller: commentController,
              maxLines: 5,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Tuliskan komentar anda tentang area ini"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(child: loadingIndicator)
                : RaisedButton(
                    onPressed: () async {
                      Data data = widget.data.copyWith(
                        comment: commentController.text,
                      );

                      setState(() {
                        isLoading = true;
                      });
                      await context
                          .bloc<DataCubit>()
                          .saveData(data, pictureAudit: pictureAudit);

                      // DataState state = context.bloc<DataCubit>().state;

                      // Get.offAll(
                      Get.to(
                        AuditFinishConfirmationPage(
                            // Data(comment: commentController.text), pictureAudit
                            ),
                      );
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Text(
                      "Selangkah lagi",
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
