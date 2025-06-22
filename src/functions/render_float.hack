/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\Str;

function render_float(?float $float)[]: string {
  if ($float is null) {
    return 'NULL';
  }

  $simple = (string)$float;
  if (
    $float === (float)$simple && !Str\contains($simple, 'E') ||
    $simple === 'INF' ||
    $simple === '-INF' ||
    $simple === 'NAN'
  ) {
    return $simple;
  }

  return _Private\render_float_to_string_with_infinite_precision($float);
}
