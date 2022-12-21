part of '../widgets/widgets.dart';

class RencanaTile extends StatelessWidget {
  final String menuName;
  final String numberOfPeople;
  final String menuPrice;
  final String menuPreparationTime;
  const RencanaTile(
      {super.key,
      required this.menuName,
      required this.numberOfPeople,
      required this.menuPrice,
      required this.menuPreparationTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: GFListTile(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(0),
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network('https://picsum.photos/250?image=9',
                width: 79, height: 79),
          ),
          title: Row(
            children: [
              Row(
                children: [
                  const SizedBox(width: 5.0),
                  Text(menuName,
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
                  const SizedBox(width: 5.0),
                  Row(
                    children: [
                      const Icon(Icons.verified_user, size: 22),
                      Text("$numberOfPeople orang",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  fontFamily: "Quicksand")),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.soup_kitchen_outlined, size: 22),
                      Text("$menuPreparationTime min",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  fontFamily: "Quicksand")),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  const SizedBox(width: 5.0),
                  Text("Rp.$menuPrice",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: "Quicksand",
                          color: const Color(0xFF1C9FE2))),
                ],
              ),
            ],
          ),
          icon: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.delete_outline_rounded, color: Colors.white))),
    );
  }
}

class RencanaTileNoTrailing extends StatelessWidget {
  final String menuName;
  final String numberOfPeople;
  final String menuPrice;
  final String menuPreparationTime;
  const RencanaTileNoTrailing(
      {super.key,
      required this.menuName,
      required this.numberOfPeople,
      required this.menuPrice,
      required this.menuPreparationTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: GFListTile(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        avatar: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network('https://picsum.photos/250?image=9',
              width: 79, height: 79),
        ),
        title: Row(
          children: [
            Row(
              children: [
                const SizedBox(width: 5.0),
                Text(menuName,
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
                const SizedBox(width: 5.0),
                Row(
                  children: [
                    const Icon(Icons.verified_user, size: 22),
                    Text("$numberOfPeople orang",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            fontFamily: "Quicksand")),
                  ],
                ),
                const SizedBox(width: 16.0),
                Row(
                  children: [
                    const Icon(Icons.soup_kitchen_outlined, size: 22),
                    Text("$menuPreparationTime min",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            fontFamily: "Quicksand")),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                const SizedBox(width: 5.0),
                Text("Rp.$menuPrice",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: "Quicksand",
                        color: const Color(0xFF1C9FE2))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
