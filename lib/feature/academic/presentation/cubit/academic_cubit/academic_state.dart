part of 'academic_cubit.dart';

abstract class AcademicState {}

class AcademicInitial extends AcademicState {}

class AddAcademicData extends AcademicState {}

class RemoveAcademicData extends AcademicState {}

class ErrorOnCaching extends AcademicState {}

class CachedSuccesfully extends AcademicState {}
