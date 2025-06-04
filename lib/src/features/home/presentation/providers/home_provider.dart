import 'package:flutter/cupertino.dart';

import '../../../../core/res/media_res.dart';
import '../../../../core/shared/entities/animal.dart';
import '../../../../core/shared/models/animal_model.dart';

class HomeProvider extends ChangeNotifier {
  List<CoreAnimalModel>? _animalHistories;

  List<CoreAnimalModel>? get animalHistories => _animalHistories;

  void initHistories(List<CoreAnimal> histories) {
    _animalHistories = histories.map((animal) => CoreAnimalModel.fromEntity(animal)).toList();
    notifyListeners();
  }

  int _currentHistory = 0;

  int get currentHistory => _currentHistory;

  void updateHistory(int history) {
    _currentHistory = history;
    notifyListeners();
  }

  void initHome(){
    _currentHeader = 0;
    _headerTitle = _headerTitles[0];
    _headerIcon = _headerIcons[0];
  }

  int _currentHeader = 0;

  int get currentHeader => _currentHeader;

  final List<String> _headerTitles = [
    'Peta',
    'Kalsifikasi Hewan',
    'Klasifikasi Ikan',
    'Pengenalan Suara',
  ];

  String _headerTitle = '';

  String get headerTitle => _headerTitle;

  final List<String> _headerIcons = [
    MediaRes.mapsIcon,
    MediaRes.imageClassificationIcon,
    MediaRes.fishClassificationIcon,
    MediaRes.voiceRecognitionIcon,
  ];

  String _headerIcon = '';

  String get headerIcon => _headerIcon;

  void next() {
    if (_currentHeader < 3){
      _currentHeader++;
    } else {
      _currentHeader = 0;
    }
    _headerIcon = _headerIcons[currentHeader];
    _headerTitle = _headerTitles[currentHeader];
    notifyListeners();
  }

  void back() {
    if (_currentHeader == 0){
      _currentHeader = 3;
    } else {
      _currentHeader--;
    }
    _headerIcon = _headerIcons[currentHeader];
    _headerTitle = _headerTitles[currentHeader];
    notifyListeners();
  }
}
