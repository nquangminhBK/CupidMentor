import 'package:collection/collection.dart';

enum RelationshipType {
  crush("Crush"),
  friends("Friends"),
  lover("Lover");

  final String value;

  const RelationshipType(this.value);

  static RelationshipType? tryParse(String value) {
    return RelationshipType.values.firstWhereOrNull(
      (element) => element.value.toLowerCase() == value.toLowerCase(),
    );
  }

  static List<RelationshipType> relationshipTypes() =>
      [RelationshipType.crush, RelationshipType.friends, RelationshipType.lover];
}
