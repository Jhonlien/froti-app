part of 'widgets.dart';

class HomeCard extends StatelessWidget {
  final Plant? plant;
  final double? width;
  final Function? onTap;
  HomeCard(this.plant, {this.width, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
          height: 130,
          width: 140,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 6,
                blurRadius: 9,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl + plant!.gambar!),
                  ),
                ),
              ),
              Text(
                plant!.judul!,
                style: blackTextFont.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ],
          )),
    );
  }
}
