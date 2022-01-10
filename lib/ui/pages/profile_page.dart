part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
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
                          // ignore: deprecated_member_use
                          (context.bloc<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath),
                      fit: BoxFit.cover)),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: Text(
                // ignore: deprecated_member_use
                (context.bloc<UserCubit>().state as UserLoaded).user.name,
                style: blackFontStyle1,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 6, defaultMargin, 6),
              child: Text(
                // ignore: deprecated_member_use
                (context.bloc<UserCubit>().state as UserLoaded).user.email,
                style: greyFontStyle,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 14),
              height: 1,
              color: "F2F2F2".toColor()),
          SizedBox(height: 14),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(HistoryClosingPage());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'History Closing',
                          style: blackFontStyle2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          '>',
                          style: greyFontStyle.copyWith(fontSize: 18),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Edit Profile',
                          style: blackFontStyle2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          '>',
                          style: greyFontStyle.copyWith(fontSize: 18),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Ubah Password',
                          style: blackFontStyle2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          '>',
                          style: greyFontStyle.copyWith(fontSize: 18),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () async {
                    context.read<UserCubit>().signOut();
                    Get.offAll(SignInPage());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Log Out',
                          style: blackFontStyle2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          '>',
                          style: greyFontStyle.copyWith(fontSize: 18),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
