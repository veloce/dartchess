import 'package:dartchess/dartchess.dart';
import 'package:test/test.dart';

void main() {
  group('Square', () {
    test('Square.values', () {
      expect(Square.values.length, 64);
    });

    test('fromAlgebraic', () {
      expect(Square.fromAlgebraic('a1'), Square.a1);
      expect(Square.fromAlgebraic('h8'), Square.h8);
      expect(Square.fromAlgebraic('e4'), Square.e4);
    });

    test('offset', () {
      expect(Square.a1.offset(8), Square.a2);
      expect(Square.h8.offset(-8), Square.h7);
    });

    test('offset throws exception if out of range', () {
      expect(() => Square.h8.offset(1), throwsRangeError);
    });
  });

  group('Move', () {
    test('fromUci', () {
      expect(Move.fromUci('a1a2'),
          const NormalMove(from: Square.a1, to: Square.a2));
      expect(
          Move.fromUci('h7h8q'),
          const NormalMove(
              from: Square.h7, to: Square.h8, promotion: Role.queen));
      expect(
          Move.fromUci('P@h1'), const DropMove(role: Role.pawn, to: Square.h1));
    });

    test('uci', () {
      expect(const DropMove(role: Role.queen, to: Square.b1).uci, 'Q@b1');
      expect(const NormalMove(from: Square.c1, to: Square.d1).uci, 'c1d1');
      expect(
          const NormalMove(
                  from: Square.a1, to: Square.a1, promotion: Role.knight)
              .uci,
          'a1a1n');
    });
  });
}
