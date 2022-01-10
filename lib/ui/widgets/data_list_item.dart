part of 'widget.dart';

class DataListItem extends StatelessWidget {
  final Data data;
  final double itemWidth;

  DataListItem({@required this.data, @required this.itemWidth});

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
                  image: NetworkImage(data.picturePath), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, //60 + 12 + 110
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.area,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(data.comment, style: greyFontStyle.copyWith(fontSize: 13)),
            ],
          ),
        ),
        RatingStar(data.rate)
      ],
    );
  }
}
