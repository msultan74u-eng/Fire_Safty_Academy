import 'package:bloc/bloc.dart';
import '../../models/section_model.dart';
import 'section_state.dart';
import '../../services/api_fire_service.dart';

class SectionCubit extends Cubit<SectionState> {
  final ApiService apiService;

  SectionCubit(this.apiService) : super(SectionInitial());

  Future<void> fetchSections() async {
    try {
      emit(SectionLoading());

      final data = await apiService.getSections();

      final rawSections = data['sections'] as List?;

      if (rawSections == null) {
        emit(const SectionError('No sections found'));
        return;
      }

      final sections = rawSections
          .map((e) => Section.fromJson(
        e,
        isFireAlarm: e['sectionId'] == 'fire_alarm',
      ))
          .toList();

      emit(SectionLoaded(sections));
    } catch (e) {
      emit(SectionError(e.toString()));
    }
  }
}