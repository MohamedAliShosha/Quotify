import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String? q;
  final String? a;
  final String? c;
  final String? h;

  const Quote({this.q, this.a, this.c, this.h});

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        q: json['q'] as String?,
        a: json['a'] as String?,
        c: json['c'] as String?,
        h: json['h'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'q': q,
        'a': a,
        'c': c,
        'h': h,
      };

  @override
  List<Object?> get props => [q, a, c, h];
}
