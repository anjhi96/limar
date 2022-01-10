part of 'widget.dart';

class ClosingListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  ClosingListItem({@required this.transaction, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(transaction.data.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, //60 + 12 + 110
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.data.area,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(transaction.data.comment,
                  style: greyFontStyle.copyWith(fontSize: 13)),
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDateTime(transaction.dateTime),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
              (transaction.status == TransactionStatus.open)
                  ? Text(
                      'Open',
                      style: GoogleFonts.poppins(
                          color: Colors.green, fontSize: 10),
                    )
                  : (transaction.status == TransactionStatus.closed)
                      ? Text(
                          'Closed',
                          style: GoogleFonts.poppins(
                              color: Colors.red, fontSize: 10),
                        )
                      : SizedBox()
            ],
          ),
        )
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Agu';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Okt';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
    }
    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
