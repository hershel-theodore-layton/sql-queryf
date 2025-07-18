/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use type HTL\Pragma\Pragmas;

<<
  Pragmas(vec['PhaLinters', 'fixme:camel_cased_methods_underscored_functions']),
>>
interface EmbeddedString extends EmbeddedStringBase {
  // ...`%`
  public function format_0x25()[]: EmbeddedString;
  // ...`)`
  public function format_0x29()[]: EmbeddedStringWillEndIfPercent;
}
