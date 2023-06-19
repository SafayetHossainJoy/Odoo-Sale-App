enum State { POSTED, DRAFT, CANCEL }

final stateValues = EnumValues({
    "cancel": State.CANCEL,
    "draft": State.DRAFT,
    "posted": State.POSTED
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
