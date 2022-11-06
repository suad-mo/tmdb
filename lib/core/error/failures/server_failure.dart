import 'failure.dart';

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}
