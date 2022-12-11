part of 'reference_cubit.dart';

abstract class ReferenceState {}

class ReferenceInitial extends ReferenceState {}

class ReferenceDataReceived extends ReferenceState {
  ReferenceDataReceived({required this.referenceData});

  late final List<ReferenceModel> referenceData;
}

class ReferenceFetched extends ReferenceDataReceived {
  ReferenceFetched({required super.referenceData});
}

class ReferenceSavingError extends ReferenceState {
  static const message = "Error occured while saving data.";
}

class ReferenceDeletingError extends ReferenceState {
  static const message = "Error occured while deleting data.";
}

class ReferenceFetcingError extends ReferenceState {
  static const message = "Error occured while fetching data.";
}

class ReferenceDeleted extends ReferenceState {
  // ReferenceDeleted({required super.referenceData});

  static const message = "Reference deleted succesfully.";
}


class ReferenceSaved extends ReferenceState {
  // ReferenceDeleted({required super.referenceData});

  static const message = "Reference saved succesfully.";
}

