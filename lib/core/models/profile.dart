class Profile {
  final bool phoneConfirmed;
  final String? name;

  Profile({
    required this.phoneConfirmed,
    this.name,
  });

  Profile copyWith({bool? phoneConfirmed, String? name}) => Profile(
      phoneConfirmed: phoneConfirmed ?? this.phoneConfirmed,
      name: name ?? this.name);
}
