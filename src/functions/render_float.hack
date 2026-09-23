/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\Str;

function render_float(?float $float)[]: string {
  if ($float is null) {
    return 'NULL';
  }

  if ($float === -0.0) {
    return Str\format_number($float, 0);
  }

  $simple = (string)$float;
  if (
    $simple === 'INF' || $simple === '-INF' || $simple === 'NAN' ||
    (float)$simple === $float
  ) {
    return $simple;
  }

  return Str\format('%.16E', $float) |> Str\strip_suffix($$, 'E+0');
}
