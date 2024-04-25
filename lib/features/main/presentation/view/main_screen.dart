import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/config/route/app_router.gr.dart';
import 'package:travel_app/core/app/dependencies/di.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/features/main/domain/entity/tour_entity.dart';
import 'package:travel_app/features/main/domain/use_case/categories_use_case.dart';
import 'package:travel_app/features/main/domain/use_case/tours_use_case.dart';
import 'package:travel_app/features/main/presentation/bloc/app/app_bloc.dart';
import 'package:travel_app/features/place/presentation/view/place_screen.dart';
import 'package:travel_app/features/widgets/category_dot.dart';
import 'package:travel_app/features/widgets/dots_indicator.dart';
import 'package:travel_app/features/widgets/tour_card.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pageController =
      PageController(initialPage: 0, viewportFraction: 0.99, keepPage: false);

  final AppBloc _blocTour = AppBloc(
    getIt<CategoryUseCase>(),
    getIt<TourUseCase>(),
  );
  final AppBloc _blocCateg = AppBloc(
    getIt<CategoryUseCase>(),
    getIt<TourUseCase>(),
  );

  final AppBloc _blocRecommend = AppBloc(
    getIt<CategoryUseCase>(),
    getIt<TourUseCase>(),
  );
  @override
  void initState() {
    _blocCateg.add(FetchCategories());
    _blocTour.add(FetchCategoriesTours(id: 1));
    _blocRecommend.add(FetchCategoriesTours(id: 1));
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  var _selectedCategory = 0;
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text('Discover', style: AppFonts.s32Black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: _createTabCategory(),
            ),
            const SizedBox(height: 14),
            Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 8),
              child: _createCarousel(),
            ),
            const SizedBox(height: 16),
            _createDotsIndicator(),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('Recommended',
                  style: AppFonts.s20Black.copyWith(color: AppColors.black)),
            ),
            const SizedBox(height: 18),
            _createRecommendGrid(),
          ],
        ),
      ),
    );
  }

  Widget _createRecommendGrid() {
    return BlocBuilder<AppBloc, AppState>(
      bloc: _blocRecommend,
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (ToursLoaded):
            final successState = state as ToursLoaded;
            final tours = successState.tours;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 13, mainAxisSpacing: 13),
              itemCount: tours.length,
              itemBuilder: (context, index) => _buildGrid(tours[index]),
            );

          case const (Loading):
            return const Center(child: CircularProgressIndicator());

          case const (Error):
            final badState = state as Error;
            return Center(
              child: Text(badState.message, style: AppFonts.s36Black),
            );

          default:
            return Center(
              child: Text('OOooops....', style: AppFonts.s24Bold),
            );
        }
      },
    );
  }

  Widget _createCarousel() {
    return BlocBuilder<AppBloc, AppState>(
      bloc: _blocTour,
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (ToursLoaded):
            final successState = state as ToursLoaded;
            final tours = successState.tours;
            return PageView.builder(
              padEnds: false,
              itemCount: tours.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: TourCard(
                  onTap: () => _onTap(tours[index]),
                  radius: 19.0,
                  font: AppFonts.s20Sem,
                  tour: tours[index],
                ),
              ),
              pageSnapping: true,
              controller: pageController,
              onPageChanged: (index) {
                setState(
                  () => _currentPage = index,
                );
              },
            );

          case const (Loading):
            return const Center(child: CircularProgressIndicator());

          case const (Error):
            final badState = state as Error;
            return Center(
              child: Text(badState.message, style: AppFonts.s36Black),
            );

          default:
            return Center(
              child: Text('OOooops....', style: AppFonts.s24Bold),
            );
        }
      },
    );
  }

  Widget _createTabCategory() {
    return BlocBuilder<AppBloc, AppState>(
      bloc: _blocCateg,
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (CategoriesLoaded):
            final successState = state as CategoriesLoaded;
            final categories = successState.categories;
            return ListView.builder(
              padding: const EdgeInsets.only(left: 11, right: 11),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryDot(
                  title: categories[index].name,
                  isActive: _selectedCategory == index,
                  onTap: () {
                    setState(() {
                      _selectedCategory = index;
                      _currentPage = 0;
                    });
                    _blocTour
                        .add(FetchCategoriesTours(id: _selectedCategory + 1));
                  },
                );
              },
            );
          case const (Loading):
            return const Center(child: CircularProgressIndicator());

          case const (Error):
            final badState = state as Error;
            return Center(
              child: Text(badState.message, style: AppFonts.s36Black),
            );

          default:
            return Center(
              child: Text('OOooops....', style: AppFonts.s24Bold),
            );
        }
      },
    );
  }

  Widget _createDotsIndicator() {
    return BlocBuilder<AppBloc, AppState>(
      bloc: _blocTour,
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (ToursLoaded):
            final successData = state as ToursLoaded;

            final currentLenght = successData.dotsLenght;
            return DotsIndicator(
              length: currentLenght,
              currentTour: _currentPage,
              activeColor: AppColors.dotColor,
              unActiveColor: AppColors.unActDotColor,
            );
          case const (Loading):
            return const Center(child: CircularProgressIndicator());

          case const (Error):
            final badState = state as Error;
            return Center(
              child: Text(badState.message, style: AppFonts.s36Black),
            );

          default:
            return Center(
              child: Text('OOooops....', style: AppFonts.s24Bold),
            );
        }
      },
    );
  }

  Widget _buildGrid(TourEntity tour) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlaceScreen(tour: tour),
        ),
      ),
      child: TourCard(
        onTap: () => _onTap(tour),
        tour: tour,
        font: AppFonts.s14Sem,
        radius: 10,
      ),
    );
  }

  _onTap(TourEntity tour) {
    AutoRouter.of(context).push(PlaceRoute(tour: tour));
  }
}
