class EventParameter {
  final String? value;

  EventParameter({
    this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }
}
