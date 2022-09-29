import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_like_a_math/presentation/bloc/home_page_digit_cubit.dart';
import 'package:i_like_a_math/presentation/bloc/home_page_digit_state.dart';
import 'package:i_like_a_math/presentation/widgets/home_page/sect_number_one_digit_button.dart';


class OneDigitNumber extends StatelessWidget {
  final Color color;
  final int digitOrder;

  const OneDigitNumber({Key? key, required this.digitOrder, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          OneDigitNumberButton(digitOrder: digitOrder, isUp: true,),
          Align(
            alignment: Alignment.center,
            child: BlocBuilder<DigitAndNumberCubit, DigitAndNumberState>(
              builder: (context, state) {
                return Text(
                    state.getNumberDigit(digitOrder).toString(),
                    style: const TextStyle(fontFamily: 'Roboto', fontSize: 110)
                ); //, backgroundColor: Colors.green)
              }
            ),
          ),
          OneDigitNumberButton(digitOrder: digitOrder, isUp: false,)
        ],
      ),
    );
  }
}
