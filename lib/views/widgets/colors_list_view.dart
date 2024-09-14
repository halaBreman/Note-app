import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiiii/cubits/add_note_cubit/add_note_cubit.dart';

class colorIteam extends StatelessWidget {
  const colorIteam({Key? key, required this.isActive, required this.color})
      : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 36,
            backgroundColor: color,
          );
  }
}

class colorListView extends StatefulWidget {
  const colorListView({Key? key}) : super(key: key);

  @override
  State<colorListView> createState() => _colorListViewState();
}

class _colorListViewState extends State<colorListView> {
  int currentIndex = 0;

  List<Color> colors = const [
    Color(0xffEF2D56),
    Color(0xffED7D3A),
    Color(0xffCC978E),
    Color(0xffA6F4DC),
    Color(0xff2FBF71),
    Color(0xff883955),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                currentIndex = i;
                BlocProvider.of<AddNoteCubit>(context).color = colors[i];
                setState(() {});
              },
              child: colorIteam(
                color: colors[i],
                isActive: currentIndex == i,
              ),
            ),
          );
        },
      ),
    );
  }
}
