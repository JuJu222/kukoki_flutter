part of "widgets.dart";

//loading is like it's own page so it has to be stateless widget
class Loading  {
  static Container loading(){
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Color(0xFF1C9FE2),
      ),
    );
  }
}
