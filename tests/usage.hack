/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf\Tests;

use namespace HH\Lib\{Math, SQL, Str};
use namespace HTL\{SqlQueryf, TestChain};
use namespace HTL\SqlQueryf\ToString;
use function HTL\Expect\{expect, expect_invoked};

<<TestChain\Discover>>
function usage(TestChain\Chain $chain)[]: TestChain\Chain {
  return $chain->group(__FUNCTION__)
    ->test('Integer rendering', () ==> {
      expect(queryf_to_string('SELECT %d', null))->toEqual('SELECT NULL');
      expect(queryf_to_string('SELECT %d', 0))->toEqual('SELECT 0');
      expect(queryf_to_string('SELECT %d < %d', -1, 1))
        ->toEqual('SELECT -1 < 1');
      expect(queryf_to_string('SELECT %d + %d', Math\INT64_MIN, Math\INT64_MAX))
        ->toEqual('SELECT -9223372036854775808 + 9223372036854775807');
    })
    ->test('Float rendering', () ==> {
      expect(queryf_to_string('SELECT %f', null))->toEqual('SELECT NULL');
      expect(queryf_to_string('SELECT %f', 0.0))->toEqual('SELECT 0');
      expect(queryf_to_string('SELECT %f < %f', -1.23, 1.23))
        ->toEqual('SELECT -1.23 < 1.23');

      invariant(
        (float)-9223372036854775800 === (float)Math\INT64_MIN,
        'double precision floats cannot represent this value losslessly',
      );

      invariant(
        (float)9223372036854775800 === (float)Math\INT64_MAX,
        'double precision floats cannot represent this value losslessly',
      );
      expect(queryf_to_string(
        'SELECT %f + %f',
        (float)Math\INT64_MIN,
        (float)Math\INT64_MAX,
      ))->toEqual('SELECT -9223372036854775800 + 9223372036854775800');
    })
    ->test('Float rendering edge cases', () ==> {
      // These special float values won't work in SQL, but they should show
      // up in your logging and debugging sessions. Otherwise you'd have no
      // idea what was going on.
      expect(queryf_to_string('SELECT %f, %f, %f', Math\NAN, \INF, -\INF))
        ->toEqual('SELECT NAN, INF, -INF');

      invariant(
        1.23456789012345678901234567890 === 1.2345678901234566,
        'The minimum number of digits to represent this number',
      );
      invariant(
        1.23456789012345678901234567890 !== 1.234567890123456,
        'See, dropping the last 6 creates a different number',
      );
      expect(queryf_to_string('SELECT %f', 1.23456789012345678901234567890))
        ->toEqual('SELECT 1.2345678901234566');

      // Luckily, there is often a sensible short number, if the exponent is
      // close to 0, since double precision floating point does not go on forever.
      expect(queryf_to_string('SELECT %f', 1000. / 3.))
        ->toEqual('SELECT 333.3333333333333');

      // But when there isn't, oh dear, you logged queries will contain monsters.
      expect(queryf_to_string('SELECT %f', 1.23456e300))
        ->toEqual('SELECT 123456'.Str\repeat('0', 295));

      expect(queryf_to_string('SELECT %f', 1.23456e-300))
        ->toEqual('SELECT 0.'.Str\repeat('0', 299).'123456');
    })
    ->test('String rendering', () ==> {
      expect(queryf_to_string('SELECT %s', null))->toEqual('SELECT NULL');
      expect(queryf_to_string('SELECT %s', 'hi'))->toEqual('SELECT "hi"');

      // This depends on `fake_mysql_escape_UNSAFE`, which is not meant to
      // escape string for real databases. It just needs to keep the string
      // looking right for logging and debugging.
      expect(queryf_to_string('SELECT %s', 'I have a " for you'))
        ->toEqual('SELECT "I have a \" for you"');

      expect(queryf_to_string('SELECT %s', 'Escape end of string? \\'))
        ->toEqual('SELECT "Escape end of string? \\\\"');
    })
    ->test('Equality rendering', () ==> {
      expect(queryf_to_string('SELECT columnname %=d', null))
        ->toEqual('SELECT columnname IS NULL');

      expect(queryf_to_string('SELECT columnname %=f', null))
        ->toEqual('SELECT columnname IS NULL');

      expect(queryf_to_string('SELECT columnname %=s', null))
        ->toEqual('SELECT columnname IS NULL');

      expect(queryf_to_string('SELECT columnname %=d', 42))
        ->toEqual('SELECT columnname = 42');

      expect(queryf_to_string('SELECT columnname %=f', 123.456))
        ->toEqual('SELECT columnname = 123.456');

      expect(queryf_to_string('SELECT columnname %=s', '"'))
        ->toEqual('SELECT columnname = "\\""');
    })
    ->test('Table and Column rendering', () ==> {
      expect(queryf_to_string('SELECT %C FROM %T', 'columnname', 'tablename'))
        ->toEqual('SELECT `columnname` FROM `tablename`');

      expect(queryf_to_string('SELECT %C FROM %T', 'back`tick', 'tick`back'))
        ->toEqual('SELECT `back``tick` FROM `tick``back`');
    })
    ->test('List rendering', () ==> {
      expect(queryf_to_string(
        'SELECT * FROM tablename WHERE columnname IN(%Ld)',
        vec[],
      ))
        ->toEqual('SELECT * FROM tablename WHERE columnname IN()');

      expect(queryf_to_string(
        'SELECT * FROM tablename WHERE columnname IN(%Lf)',
        vec[],
      ))
        ->toEqual('SELECT * FROM tablename WHERE columnname IN()');

      expect(queryf_to_string(
        'SELECT * FROM tablename WHERE columnname IN(%Ls)',
        vec[],
      ))
        ->toEqual('SELECT * FROM tablename WHERE columnname IN()');

      expect(queryf_to_string('SELECT %LC', vec[]))
        ->toEqual('SELECT ');

      expect(queryf_to_string(
        'SELECT * FROM tablename WHERE columnname IN(%Ld)',
        vec[1, 2, 3],
      ))
        ->toEqual('SELECT * FROM tablename WHERE columnname IN(1, 2, 3)');

      expect(queryf_to_string(
        'SELECT * FROM tablename WHERE columnname IN(%Lf)',
        vec[1.2, 3.4],
      ))
        ->toEqual('SELECT * FROM tablename WHERE columnname IN(1.2, 3.4)');

      expect(queryf_to_string(
        'SELECT * FROM tablename WHERE columnname IN(%Ls)',
        vec['one', 'two'],
      ))
        ->toEqual('SELECT * FROM tablename WHERE columnname IN("one", "two")');

      expect(queryf_to_string('SELECT %LC', vec['a', 'b', 'c']))
        ->toEqual('SELECT `a`, `b`, `c`');
    })
    ->test('Comment rendering', () ==> {
      expect(queryf_to_string('%K SELECT 1', 'request_id=715628491'))
        ->toEqual('/*request_id=715628491*/ SELECT 1');

      expect(queryf_to_string('%K SELECT 1', 'end of comment? */'))
        ->toEqual('/*end of comment? * /*/ SELECT 1');
    })
    ->test('Nested Query rendering', () ==> {
      expect(queryf_to_string(
        'SELECT * FROM %T WHERE %Q',
        'mytable',
        queryf(
          '%Q AND %Q',
          queryf('%C %=d', 'col1', 1),
          queryf('%C %=d', 'col2', 2),
        ),
      ))->toEqual('SELECT * FROM `mytable` WHERE `col1` = 1 AND `col2` = 2');
    })
    ->test('No support for other queries', ()[defaults] ==> {
      expect_invoked(() ==> ToString\engine('%Q', vec[new SQL\Query('')]))
        ->toHaveThrown<InvariantException>(
          'Can not render HH\Lib\SQL\Query (as a Pack) in to-string mode.',
        );
      expect_invoked(
        () ==>
          ToString\engine('%Q', vec[SqlQueryf\QueryPack::create<nothing>('')]),
      )
        ->toHaveThrown<InvariantException>(
          'HTL\SqlQueryf\QueryPack contains more specifiers than the to-string mode can handle.',
        );
    });
}
