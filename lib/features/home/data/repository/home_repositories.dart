import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/features/home/data/data_sources/home_datasource.dart';
import 'package:cupid_mentor/features/home/domain/repository/home_repositories.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final HomeDatasource homeDatasource;

  const HomeRepositoriesImpl({
    required this.homeDatasource,
  });

  @override
  Either<Failure, bool> needShowIntroduction() {
    final needShowIntroduction = homeDatasource.needShowIntroduction();
    if (needShowIntroduction) {
      homeDatasource.updateNeedShowIntroduction();
      return const Right(true);
    } else {
      return const Right(false);
    }
  }
}
