part of 'bloc.dart';

abstract class DetailCategoriesEvent {}

class DetailCategoriesStarted extends DetailCategoriesEvent {}

class DetailCategoriesCategoryChanged extends DetailCategoriesEvent {
  final String category;

  DetailCategoriesCategoryChanged(this.category);
}

class DetailCategoriesSheetToggled extends DetailCategoriesEvent {
  final bool isOpen;

  DetailCategoriesSheetToggled(this.isOpen);
}
