part of 'cv_templates_cubit.dart';

abstract class TemplateState {}

class TemplateInitial extends TemplateState {}

class PdfIsBeingCreatedState extends TemplateState {}

class PdfCreatedState extends TemplateState {}

class PdfErrorState extends TemplateState {
  PdfErrorState({required this.errorMessage});

  final String errorMessage;
}

class PdfSavedState extends TemplateState {}
