abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class HiveDeletingFailure extends Failure {}

class HiveSavingFailure extends Failure {}

class HiveFetchFailure extends Failure {}

class HiveNullData extends Failure {}
