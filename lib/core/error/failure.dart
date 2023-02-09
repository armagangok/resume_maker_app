abstract class Failure {}

class ServerFailure extends Failure {}

class LocalDeletingFailure extends Failure {}

class HiveSavingFailure extends Failure {}

class LocalFetchFailure extends Failure {}

class HiveNullData extends Failure {}

class HiveUpdatingFailure extends Failure {}
