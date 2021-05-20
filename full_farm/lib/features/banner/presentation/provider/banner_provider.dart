import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:full_farm/features/banner/domain/usecase/create_banner.dart';
import 'package:full_farm/features/banner/domain/usecase/delete_banner.dart';
import 'package:full_farm/features/banner/domain/usecase/read_banner_by_id.dart';
import 'package:full_farm/features/banner/domain/usecase/read_banners.dart';
import 'package:full_farm/features/banner/domain/usecase/update_activation_of_banner.dart';
import 'package:full_farm/features/banner/domain/usecase/update_banner.dart';

class BannerProvider with ChangeNotifier {
  final ReadBannersUseCase readBannersUseCase;
  final ReadBannerByIdUseCase readBannerByIdUseCase;
  final CreateBannerUseCase createBannerUseCase;
  final UpdateBannerUseCase updateBannerUseCase;
  final UpdateActivationOfBannerUseCase updateActivationOfBannerUseCase;
  final DeleteBannerUseCase deleteBannerUseCase;

  BannerProvider({
    @required this.readBannersUseCase,
    @required this.readBannerByIdUseCase,
    @required this.createBannerUseCase,
    @required this.updateBannerUseCase,
    @required this.updateActivationOfBannerUseCase,
    @required this.deleteBannerUseCase,
  });

  List<Banner> _banners;
  List<Banner> get banners => _banners;
  Banner _currentBanner;
  Banner get currentBannerId => _currentBanner;

  Future<void> readBanners({
    String orderBy,
    String start,
    String end,
    String sort,
  }) async {
    final response = await readBannersUseCase(
      ReadBannersParams(
        orderBy: orderBy,
        start: start,
        end: end,
        sort: sort,
      ),
    );
    response.fold(
      (failure) {
        _banners = null;
        print(failure);
      },
      (success) {
        _banners = success;
        print(success);
      },
    );
  }

  Future<void> readBannerById({
    @required int id,
  }) async {
    final response = await readBannerByIdUseCase(
        ReadBannerByIdParams(
          id: id,
        ),
    );
    response.fold(
      (failure) {
        _currentBanner = null;
        print(failure);
      },
      (success) {
        _currentBanner = success;
        print(success);
      },
    );
  }

  Future<void> createBanner({
    @required String title,
    @required String description,
    @required int type,
    @required List<String> image,
    @required String startDate,
    @required String endDate,
  }) async {
    final response = await createBannerUseCase(
      CreateBannerParams(
        title: title,
        description: description,
        type: type,
        image: image,
        startDate: startDate,
        endDate: endDate,
      ),
    );
    response.fold(
      (failure) {
        print(failure);
      },
      (success) {
        print(success);
      },
    );
  }

  Future<void> updateBanner({
    @required int id,
    @required String title,
    @required String description,
    @required int type,
    @required List<String> image,
    @required String startDate,
    @required String endDate,
  }) async {
    final response = await updateBannerUseCase(
      UpdateBannerParams(
        id: id,
        title: title,
        description: description,
        type: type,
        image: image,
        startDate: startDate,
        endDate: endDate,
      ),
    );
    response.fold(
      (failure) {
        print(failure);
      },
      (success) {
        print(success);
      },
    );
  }

  Future<void> updateActivationOfBanner({
    @required int id,
    @required bool activation,
  }) async {
    final response = await updateActivationOfBannerUseCase(
      UpdateActivationOfBannerParams(
        id: id,
        activation: activation,
      ),
    );
    response.fold(
      (failure) {
        print(failure);
      },
      (success) {
        print(success);
      },
    );
  }

  Future<void> deleteBanner({
    @required int id,
  }) async {
    final response = await deleteBannerUseCase(
        DeleteBannerParams(
          id: id,
        ),
    );
    response.fold(
      (failure) {
        print(failure);
      },
      (success) {
        print("success");
      },
    );
  }
}