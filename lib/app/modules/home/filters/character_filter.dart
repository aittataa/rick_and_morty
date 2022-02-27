import 'package:rick_and_morty/app/config/app_enum.dart';

class CharacterFilter {
  final String name;
  final CharacterStatus status;
  final CharacterSpecies species;
  final String type;
  final CharacterGender gender;

  CharacterFilter({
    this.name = "",
    this.status = CharacterStatus.empty,
    this.species = CharacterSpecies.empty,
    this.type = "",
    this.gender = CharacterGender.empty,
  });
}
