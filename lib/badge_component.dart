import 'package:angular2/core.dart';
import 'name_service.dart';

@Component(
    selector: 'pirate-badge',
    templateUrl: 'badge_component.html',
    styleUrls: const ['badge_component.css'],
    providers: const ['NameService'])
class BadgeComponent {
  final NameService _nameService;
  String badgeName = 'Callum';
  String buttonText = 'Aye! Gimme a name!';
  bool isButtonEnabled = true;
  BadgeComponent(this._nameService);
  void generateBadge() {
    setBadgeName();
  }

  void updateBadge(String inputName) {
    setBadgeName(inputName);
    if (inputName.trim().isEmpty) {
      buttonText = "Aye! Gimme a name!";
      isButtonEnabled = true;
    } else {
      buttonText = 'Arrr! Write yer name!';
      isButtonEnabled = false;
    }
  }

  void setBadgeName([String newName = '']) {
    if(newName == null) return;
    badgeName = _nameService.getPirateName(newName);
  }
}
