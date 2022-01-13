enum CharacterSpecies { human, alien, empty }
enum CharacterStatus { alive, unknown, dead, empty }
enum CharacterGender { male, female, unknown, empty }

const characterSpeciesValues = {
  CharacterSpecies.alien: "Alien",
  CharacterSpecies.human: "Human",
  CharacterSpecies.empty: "",
};

const characterStatusValues = {
  CharacterStatus.alive: "Alive",
  CharacterStatus.dead: "Dead",
  CharacterStatus.empty: "",
};

const characterGenderValues = {
  CharacterGender.male: "Male",
  CharacterGender.female: "Female",
  CharacterGender.unknown: "unknown",
  CharacterGender.empty: "",
};
