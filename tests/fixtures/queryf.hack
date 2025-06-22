/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf\Tests;

use namespace HH;
use namespace HTL\SqlQueryf;
use namespace HTL\SqlQueryf\ToString;

function queryf(
  HH\FormatString<ToString\Sql> $format,
  mixed ...$args
)[]: SqlQueryf\HipHopLibSqlQueryPack {
  return SqlQueryf\HipHopLibSqlQueryPack::createWithoutTypechecking_UNSAFE(
    $format as string,
    $args,
  );
}

function queryf_to_string(
  HH\FormatString<ToString\Sql> $format,
  mixed ...$args
)[]: string {
  return SqlQueryf\HipHopLibSqlQueryPack::createWithoutTypechecking_UNSAFE(
    $format as string,
    $args,
  )
    |> ToString\engine($$->getFormat(), $$->getArguments())
    |> \vsprintf(...$$);
}
