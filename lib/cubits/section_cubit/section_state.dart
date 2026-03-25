import 'package:equatable/equatable.dart';

import '../../models/section_model.dart';

abstract class SectionState extends Equatable {
  const SectionState();

  @override
  List<Object?> get props => [];
}

class SectionInitial extends SectionState {}

class SectionLoading extends SectionState {}

class SectionLoaded extends SectionState {
  final List<Section> sections;
  const SectionLoaded(this.sections);

  @override
  List<Object?> get props => [sections];
}

class SectionError extends SectionState {
  final String message;
  const SectionError(this.message);

  @override
  List<Object?> get props => [message];
}
