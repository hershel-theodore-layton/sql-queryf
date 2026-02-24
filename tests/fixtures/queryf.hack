/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf\Tests;

use namespace HH;
use namespace HTL\{HH4Shim, SqlQueryf};
use namespace HTL\SqlQueryf\ToString;

function queryf(
  HH\FormatString<ToString\Sql> $format,
  mixed ...$args
)[]: SqlQueryf\HipHopLibSqlQueryPack {
  return SqlQueryf\HipHopLibSqlQueryPack::createWithoutTypechecking_UNSAFE(
    HH4Shim\to_mixed($format) as string,
    vec($args),
  );
}

function queryf_to_string(
  HH\FormatString<ToString\Sql> $format,
  mixed ...$args
)[]: string {
  return SqlQueryf\HipHopLibSqlQueryPack::createWithoutTypechecking_UNSAFE(
    HH4Shim\to_mixed($format) as string,
    vec($args),
  )
    |> ToString\engine($$->getFormat(), $$->getArguments())
    |> \vsprintf(...$$) as string;
}
