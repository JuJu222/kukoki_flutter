part of '../widgets/widgets.dart';

class CheckoutTile extends StatelessWidget {
  final Pesan pesan;
  const CheckoutTile({super.key, required this.pesan});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: GFListTile(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0.0),
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('${pesan.images}', width: 79, height: 79, fit: BoxFit.fill,),
          ),
          title: Row(
            children: [
              Row(
                children: [
                  // const SizedBox(width: 5.0),
                  Text(pesan.menuName!,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Quicksand")),
                ],
              ),
            ],
          ),
          subTitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SizedBox(width: 5.0),
                  Row(
                    children: [
                      const Icon(Icons.group,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text("${pesan.numberOfPeople} orang",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: const Color(0xFF6A6A6A),
                                  fontFamily: "Quicksand")),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text("${pesan.date}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: const Color(0xFF6A6A6A),
                                  fontFamily: "Quicksand")),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  // const SizedBox(width: 5.0),
                  Text("Rp.${pesan.menuPrice}",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: "Quicksand",
                          color: const Color(0xFF1C9FE2))),
                ],
              ),
            ],
          ),
          icon: GestureDetector(
            onTap: () {
              
            },
            child: Icon(Icons.keyboard_arrow_right_rounded),
          )),
    );
  }
}

class CheckoutTileWithIcon extends StatefulWidget {
  Pesan pesan;
  Function onDelete;
  CheckoutTileWithIcon(
      {super.key, required this.pesan, required this.onDelete});

  @override
  State<CheckoutTileWithIcon> createState() => _CheckoutTileWithIconState();
}

class _CheckoutTileWithIconState extends State<CheckoutTileWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: GFListTile(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0.0),
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('${widget.pesan.images}', width: 79, height: 79, fit: BoxFit.fill),
          ),
          title: Row(
            children: [
              Row(
                children: [
                  // const SizedBox(width: 5.0),
                  Text(widget.pesan.menuName!,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Quicksand")),
                ],
              ),
            ],
          ),
          subTitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SizedBox(width: 5.0),
                  Row(
                    children: [
                      const Icon(Icons.group,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text("${widget.pesan.numberOfPeople} orang",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: const Color(0xFF6A6A6A),
                                  fontFamily: "Quicksand")),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined,
                          size: 22, color: Color(0xFF6A6A6A)),
                      Text("${widget.pesan.date}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: const Color(0xFF6A6A6A),
                                  fontFamily: "Quicksand")),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  // const SizedBox(width: 5.0),
                  Text("Rp.${widget.pesan.menuPrice}",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: "Quicksand",
                          color: const Color(0xFF1C9FE2))),
                ],
              ),
            ],
          ),
          icon: GestureDetector(
            onTap: () {
              setState(() {
                widget.onDelete();
              });
            },
            child: const CircleAvatar(
                backgroundColor: Color(0xFF703900),
                child: Icon(Icons.delete_outline_rounded, color: Colors.white)),
          )),
    );
  }
}
