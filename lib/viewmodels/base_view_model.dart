import 'package:caracapp/models/character_model.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel {
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _character = BehaviorSubject<Character>();

  // Expose the isLoading stream to notify the view of loading state
  Stream<bool> get isLoading => _isLoading.stream;
  Stream<Character> get characterStream => _character.stream;
  // Helper method to update the isLoading state
  void setLoading(bool isLoading) {
    _isLoading.add(isLoading);
  }

  void setCharacter(Character character) {
    _character.add(character);
  }

  // Dispose method to clean up resources
  void dispose() {
    _isLoading.close();
  }
}
