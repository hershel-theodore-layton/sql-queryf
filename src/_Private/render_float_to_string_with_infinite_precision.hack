/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf\_Private;

use namespace HH\Lib\Str;

/**
 * Given a float, render a fixed precision number. If the value is not
 * round-trippable, give up and return the messy value.
 * Else, keep only the number of digits required. Then, if the number ends
 * with digits that must be there, but their value is irrelevant,
 * replace them with zeroes.
 *
 * This function is **slow**, since it does a lot of string to float conversions.
 * This operation could be implemented efficiently in cpp. I would love to call
 * `std::to_chars(buffer_start, buffer_end, $float, std::chars_format::fixed)`,
 * which is not available. `Str\format_number` goes through `snprintf` with a
 * large precision value.
 */
function render_float_to_string_with_infinite_precision(
  float $float,
)[]: string {
  $verbose = Str\format_number($float, 320, '.', '');

  // Unable to use comparisions in the loops below,
  // return the messy value.
  if ($float !== (float)$verbose) {
    return $verbose;
  }

  // Only keep the characters that are needed to get a round-trippable float.
  $trimmed = $verbose[0];
  for ($i = 1; $float !== (float)$trimmed; ++$i) {
    $trimmed .= $verbose[$i];
  }

  // Now we have a number which is as short as it can be.
  // Chances are that many of the least significant digits are noise.
  // Replace them with zeroes.
  $out = $trimmed;
  $i = Str\length($trimmed) - 1;
  do {
    $out = $trimmed;
    $trimmed[$i] = '0';
    --$i;
  } while ($float === (float)$trimmed);

  return $out;
}
