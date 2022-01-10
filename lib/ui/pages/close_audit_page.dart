part of 'pages.dart';

class CloseAuditPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Data data;

  CloseAuditPage({this.onBackButtonPressed, this.data});
  @override
  _CloseAuditPageState createState() => _CloseAuditPageState();
}

class _CloseAuditPageState extends State<CloseAuditPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Ubah Status Audit',
      subtitle: 'Ambil foto area dan selesaikan hasil audit ini!',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            child: Stack(children: <Widget>[
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  margin: EdgeInsets.only(top: 26),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/photo_border.png'))),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1597814570899-fff30d91a453?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    // if (widget.transaction.data.picturePath == null) {
                    //   await getPicture();
                    // } else {
                    //   widget.transaction.data.picturePath = null;
                    // }
                    // setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            // (widget.data.picturePath != null)
                            //     ? "assets/btn_del_photo.png"
                            // :
                            "assets/btn_add_photo.png"),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () async {
                await getPicture();
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                "Update Photo",
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                Get.to(MainPage());
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: greyColor,
              child: Text(
                "Menuju Menu Utama",
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
