import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/domain/usecases/fetch_cities_usecase.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/domain/usecases/fetch_families_usecase.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/presentation/cubit/view_families_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ViewFamiliesCubit extends Cubit<ViewFamiliesState> {
  final FetchCitiesUsecase _fetchCitiesUsecase;
  final FetchFamiliesUsecase _fetchFamiliesUsecase;

  ViewFamiliesCubit(this._fetchFamiliesUsecase, this._fetchCitiesUsecase)
      : super(ViewFamiliesState()) {
    fetchCities();
    fetchFamilies();
  }
  bool get displayAllFamilies => state.selectedCityId == 0 && state.searchQuery.isEmpty;

  Future<void> fetchCities() async {
    emit(state.copyWith(fetchCitiesStatus: CallStatus.inProgress));
    final response = await _fetchCitiesUsecase(NoParams());
    response.fold(
        (failure) => emit(state.copyWith(
            fetchCitiesStatus: CallStatus.failed,
            message: failure.message.toString())),
        (cities) => emit(state.copyWith(
            citiesList: cities, fetchCitiesStatus: CallStatus.success)));
  }

  Future<void> fetchFamilies() async {
    emit(state.copyWith(fetchFamilyStatus: CallStatus.inProgress));
    final response = await _fetchFamiliesUsecase(NoParams());
    response.fold(
        (failure) => emit(state.copyWith(
            fetchFamilyStatus: CallStatus.failed,
            message: failure.message.toString())),
        (families) => emit(state.copyWith(
            familiesList: families, fetchFamilyStatus: CallStatus.success)));
  }

  void onCitySelected(int? cityId) {
    if(cityId == null) return;
    emit(state.copyWith(selectedCityId: cityId));
    search();
  }
  void onSearchQueryChanged(String query) {
    emit(state.copyWith(searchQuery: query));
    search();
  }
  Future<void> search() async {
    // If both cityId is 0 and searchQuery is empty, return all families
    if (state.selectedCityId == 0 && state.searchQuery.isEmpty) {
      emit(state.copyWith(queryResult: state.familiesList));
      return;
    }

    // Helper variables for query normalization
    final searchQuery = state.searchQuery.toLowerCase();
    final cityId = state.selectedCityId;

    // Filter families based on selected city and search query
    final filteredFamilies = state.familiesList.where((family) {
      // If searchQuery is empty, we only filter by cityId
      if (searchQuery.isEmpty) {
        return cityId == 0 || family.cityContentModel?.cityId == cityId;
      } else {
        // Otherwise, filter by both cityId and searchQuery
        final matchesCity = cityId == 0 || family.cityContentModel?.cityId == cityId;
        final matchesQuery = family.familyName.toLowerCase().contains(searchQuery);
        return matchesCity && matchesQuery;
      }
    }).toList();

    // Update the state with the filtered families list
    emit(state.copyWith(queryResult: filteredFamilies));
  }}
