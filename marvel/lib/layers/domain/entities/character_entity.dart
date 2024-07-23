import '../../data/DTOs/character/character_thumbnail.dart';

class CharacterEntity {
    int? id;
    String? name;
    String? description;
    String? modified;
    Thumbnail? thumbnail;
    

    CharacterEntity(
      {
       this.id,
       this.name,
        this.description,
        this.modified,
        this.thumbnail,
      
    });


}


