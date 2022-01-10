part of 'pages.dart';

class AuditRajinPage extends StatefulWidget {
  final Data data;

  AuditRajinPage (this.data);

  @override
  _AuditRajinPageState createState() => _AuditRajinPageState();
}

class _AuditRajinPageState extends State<AuditRajinPage> {
  int _groupRajin1 = 1;
  int _groupRajin2 = 1;
  int _groupRajin3 = 1;
  int _groupRajin4 = 1;
  int _groupRajin5 = 1;

  List<int> _value = [1, 2, 3, 4, 5]; 

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Rajin',
      subtitle: 'Segala hal tentang Rajin',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'PIC MEJA KERJA TELAH MEMAKAI SERAGAM DAN ATRIBUT KERJA YANG SESUAI DENGAN KETENTUAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRajin1,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRajin1 = value),
                  
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'MEJA KERJA TELAH MENJADI PANUTAN UNTUK MEJA KERJA YANG LAIN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRajin2,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRajin2 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'PIC MEJA KERJA SANGGUP DALAM MENJALANKAN 5R',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRajin3,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRajin3 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'ADA PERBAIKAN YANG BERKELANJUTAN PADA PIC DAN MEJA KERJA',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRajin4,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRajin4 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'MENJALANKAN AUDIT 5R INTERNAL SECARA BERKALA',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRajin5,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRajin5 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                Get.to(FotoKomentarPage(
                  Data(
                       r5:_groupRajin1
                      // (_groupRajin1 +
                      //     _groupRajin2 +
                      //     _groupRajin3 +
                      //     _groupRajin4 +
                      //     _groupRajin5)
                          )
                ));
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                "Selanjutnya",
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