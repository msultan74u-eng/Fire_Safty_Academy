import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/section_cubit/section_cubit.dart';
import '../../cubits/section_cubit/section_state.dart';
import '../../views/fire_page.dart';
import '../../models/section_model.dart';
import 'fire_card_home.dart';

class FireGridHome extends StatelessWidget {
  final ValueNotifier<bool> isDarkNotifier;
  final VoidCallback toggleTheme;

  const FireGridHome({
    super.key,
    required this.isDarkNotifier,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionCubit, SectionState>(
      builder: (context, state) {
        if (state is SectionLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SectionError) {
          return Center(child: Text(state.message));
        }

        if (state is SectionLoaded) {
          final List<Section> sections = state.sections;

          return LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 720;
              return GridView.builder(
                scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 320,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final section = sections[index];
                  return FireCardHome(
                    title: section.sectionTitle,
                    backgroundImage:
                        'assets/images/main_design/fire_bg_001.jpg',
                    iconImage: 'assets/images/main_design/facp_0002.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirePage(
                            isDarkNotifier: isDarkNotifier,
                            toggleTheme: toggleTheme,
                            sectionId: section.sectionId,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
