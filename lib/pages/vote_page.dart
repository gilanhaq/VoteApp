import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jangangolputyukkapp/cubit/coblos_cubit.dart';
import 'package:jangangolputyukkapp/themes/theme.dart';
import 'package:jangangolputyukkapp/widgets/custom_button.dart';
import 'package:jangangolputyukkapp/widgets/custom_paslon_list.dart';
import 'package:quickalert/quickalert.dart';

class VotePage extends StatefulWidget {
  const VotePage({super.key});

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 72),
        child: Column(
          children: [
            Text(
              'TENTUKAN PILIHANMU',
              style: blackText.copyWith(
                fontSize: 24,
                fontWeight: extrabold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = primary,
              ),
            ),
            Text(
              'SIMULASI PEMILU 2024',
              style: blackText.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget paslonList() {
      return const Column(
        children: [
          SizedBox(height: 48),
          CustomPaslonList(
            id: 'Anies-Muhaimin',
            image: 'assets/paslon_1.png',
            number: '01',
            name: 'ANIES\nMUHAIMIN',
          ),
          SizedBox(height: 24),
          CustomPaslonList(
            id: 'Prabowo-Gibran',
            image: 'assets/paslon_2.png',
            number: '02',
            name: 'PRABOWO\nGIBRAN',
          ),
          SizedBox(height: 24),
          CustomPaslonList(
            id: 'Ganjar-Mahfud',
            image: 'assets/paslon_3.png',
            number: '03',
            name: 'GANJAR\nMAHFUD',
          ),
        ],
      );
    }

    Widget submitButton() {
      return BlocBuilder<CoblosCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 72),
            child: CustomButton(
              title: 'Pilih',
              onTap: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: 'Pilih ${state.join('')} ?',
                  confirmBtnText: 'Iya',
                  cancelBtnText: 'Batal',
                  confirmBtnColor: primary,
                  onConfirmBtnTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                );
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            header(),
            paslonList(),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
