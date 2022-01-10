part of 'pages.dart';

class AddDataPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddDataPage(this.user, this.password, this.pictureFile);

  @override
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  TextEditingController nikController = TextEditingController();
  bool isLoading = false;

  List<String> teams;
  String selectedTeam;

  List<String> areas;
  String selectedArea;

  @override
  void initState() {
    super.initState();
    teams = ['Tim BUL', 'Tim WWD', 'Tim IM', 'Tim PDM', 'Tim Utility'];
    selectedTeam = teams[0];

    areas = ['Meja 1', 'Meja 2', 'Meja 3', 'Meja 4', 'Meja 5'];
    selectedArea = areas[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Additional Data',
      subtitle: 'Register and eat!',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "NIK",
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
              controller: nikController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your nik"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Team",
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
              value: selectedTeam,
              isExpanded: true,
              underline: SizedBox(),
              items: teams
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: blackFontStyle3),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedTeam = item;
                });
              },
            ),
          ),
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
              value: selectedArea,
              isExpanded: true,
              underline: SizedBox(),
              items: areas
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: blackFontStyle3),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedArea = item;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(
                    child: loadingIndicator,
                  )
                : RaisedButton(
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          nik: nikController.text,
                          team: selectedTeam,
                          area: selectedArea);

                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().signUp(
                          user, widget.password,
                          pictureFile: widget.pictureFile);

                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoaded) {
                        // ignore: deprecated_member_use
                        context.bloc<DataCubit>().getDatas();
                        // ignore: deprecated_member_use
                        context.bloc<TransactionCubit>().getTransaction();
                        // Get.to(MainPage());
                        // Get.offAll(MainPage());
                        Get.offAll(SignInPage());

                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(MdiIcons.closeCircleOutline,
                                color: Colors.white),
                            titleText: Text(
                              'Sign Up Failed',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              (state as UserLoadingFailed).message,
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
                      "Sign Up Now",
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
