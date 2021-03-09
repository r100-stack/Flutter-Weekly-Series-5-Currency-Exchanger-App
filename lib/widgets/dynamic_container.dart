// TODO (1): Create a stateless widget called DynamicContainer
// TODO (2): Fields: Widget child, double maxWidth=800

// TODO (3): return Container(alignment = Alignment.center)
// TODO (4): Within this Container, add another Container with a maxWidth constraint and child

// class DynamicContainer extends StatelessWidget {
//   final Widget child;
//   final double maxWidth;

//   const DynamicContainer({this.child, this.maxWidth = 800});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Container(
//         constraints: BoxConstraints(
//           maxWidth: maxWidth,
//         ),
//         child: child,
//       ),
//     );
//   }
// }