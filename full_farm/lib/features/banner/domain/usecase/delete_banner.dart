import 'package:dartz/dartz.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class DeleteBannerUseCase extends UseCase<void, DeleteBannerParams> {
  final BannerRepository repository;

  DeleteBannerUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteBannerParams params) async {
    return await repository.deleteBanner(
      id: params.id,
    );
  }
}

class DeleteBannerParams extends Equatable {
  final int id;

  DeleteBannerParams({
    @required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
