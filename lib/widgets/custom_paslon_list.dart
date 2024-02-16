import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jangangolputyukkapp/cubit/coblos_cubit.dart';
import 'package:jangangolputyukkapp/themes/theme.dart';

class CustomPaslonList extends StatefulWidget {
  final String image;
  final String number;
  final String name;
  final String id;

  const CustomPaslonList({
    Key? key,
    required this.image,
    required this.number,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  _CustomPaslonListState createState() => _CustomPaslonListState();
}

class _CustomPaslonListState extends State<CustomPaslonList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 1.03).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Mendengarkan perubahan paslon terpilih
    context.read<CoblosCubit>().stream.listen((selectedPaslonId) {
      // Jika paslon berubah, kembalikan animasi ke skala semula
      if (selectedPaslonId != widget.id && _animationController.value > 0) {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<CoblosCubit>().isSelected(widget.id);

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          // Jika sudah dipilih, kembalikan ke skala semula
          _animationController.reverse();
        } else {
          // Jika belum dipilih, animasikan ke skala yang lebih besar
          _animationController.forward();
        }

        // Toggle pemilihan paslon
        context.read<CoblosCubit>().selectPaslon(widget.id);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: double.infinity,
              height: 104,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: isSelected ? primary : transparent,
                border: Border.all(
                  color: isSelected ? transparent : grey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 138,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    widget.number,
                    style: isSelected
                        ? primaryText.copyWith(
                            fontSize: 58,
                            fontWeight: extrabold,
                            fontStyle: FontStyle.italic,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = white,
                          )
                        : primaryText.copyWith(
                            fontSize: 58,
                            fontWeight: extrabold,
                            fontStyle: FontStyle.italic,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = primary,
                          ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    widget.name,
                    style: isSelected
                        ? primaryText.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = white,
                          )
                        : primaryText.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = primary,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
