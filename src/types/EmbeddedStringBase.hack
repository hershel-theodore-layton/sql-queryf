/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use type HTL\Pragma\Pragmas;

<<
  Pragmas(vec['PhaLinters', 'fixme:camel_cased_methods_underscored_functions']),
>>
interface EmbeddedStringBase {
  public function format_0x00()[]: EmbeddedString;
  public function format_0x01()[]: EmbeddedString;
  public function format_0x02()[]: EmbeddedString;
  public function format_0x03()[]: EmbeddedString;
  public function format_0x04()[]: EmbeddedString;
  public function format_0x05()[]: EmbeddedString;
  public function format_0x06()[]: EmbeddedString;
  public function format_0x07()[]: EmbeddedString;
  public function format_0x08()[]: EmbeddedString;
  public function format_0x09()[]: EmbeddedString;
  public function format_0x0a()[]: EmbeddedString;
  public function format_0x0b()[]: EmbeddedString;
  public function format_0x0c()[]: EmbeddedString;
  public function format_0x0d()[]: EmbeddedString;
  public function format_0x0e()[]: EmbeddedString;
  public function format_0x0f()[]: EmbeddedString;
  public function format_0x10()[]: EmbeddedString;
  public function format_0x11()[]: EmbeddedString;
  public function format_0x12()[]: EmbeddedString;
  public function format_0x13()[]: EmbeddedString;
  public function format_0x14()[]: EmbeddedString;
  public function format_0x15()[]: EmbeddedString;
  public function format_0x16()[]: EmbeddedString;
  public function format_0x17()[]: EmbeddedString;
  public function format_0x18()[]: EmbeddedString;
  public function format_0x19()[]: EmbeddedString;
  public function format_0x1a()[]: EmbeddedString;
  public function format_0x1b()[]: EmbeddedString;
  public function format_0x1c()[]: EmbeddedString;
  public function format_0x1d()[]: EmbeddedString;
  public function format_0x1e()[]: EmbeddedString;
  public function format_0x1f()[]: EmbeddedString;
  public function format_0x20()[]: EmbeddedString;
  public function format_0x21()[]: EmbeddedString;
  public function format_0x22()[]: EmbeddedString;
  public function format_0x23()[]: EmbeddedString;
  public function format_0x24()[]: EmbeddedString;
  // notice, 0x25 "%" is missing
  public function format_0x26()[]: EmbeddedString;
  public function format_0x27()[]: EmbeddedString;
  public function format_0x28()[]: EmbeddedString;
  // notice, 0x29 ")" is missing
  public function format_0x2a()[]: EmbeddedString;
  public function format_0x2b()[]: EmbeddedString;
  public function format_0x2c()[]: EmbeddedString;
  public function format_0x2d()[]: EmbeddedString;
  public function format_0x2e()[]: EmbeddedString;
  public function format_0x2f()[]: EmbeddedString;
  public function format_0x30()[]: EmbeddedString;
  public function format_0x31()[]: EmbeddedString;
  public function format_0x32()[]: EmbeddedString;
  public function format_0x33()[]: EmbeddedString;
  public function format_0x34()[]: EmbeddedString;
  public function format_0x35()[]: EmbeddedString;
  public function format_0x36()[]: EmbeddedString;
  public function format_0x37()[]: EmbeddedString;
  public function format_0x38()[]: EmbeddedString;
  public function format_0x39()[]: EmbeddedString;
  public function format_0x3a()[]: EmbeddedString;
  public function format_0x3b()[]: EmbeddedString;
  public function format_0x3c()[]: EmbeddedString;
  public function format_0x3d()[]: EmbeddedString;
  public function format_0x3e()[]: EmbeddedString;
  public function format_0x3f()[]: EmbeddedString;
  public function format_0x40()[]: EmbeddedString;
  public function format_upcase_a()[]: EmbeddedString;
  public function format_upcase_b()[]: EmbeddedString;
  public function format_upcase_c()[]: EmbeddedString;
  public function format_upcase_d()[]: EmbeddedString;
  public function format_upcase_e()[]: EmbeddedString;
  public function format_upcase_f()[]: EmbeddedString;
  public function format_upcase_g()[]: EmbeddedString;
  public function format_upcase_h()[]: EmbeddedString;
  public function format_upcase_i()[]: EmbeddedString;
  public function format_upcase_j()[]: EmbeddedString;
  public function format_upcase_k()[]: EmbeddedString;
  public function format_upcase_l()[]: EmbeddedString;
  public function format_upcase_m()[]: EmbeddedString;
  public function format_upcase_n()[]: EmbeddedString;
  public function format_upcase_o()[]: EmbeddedString;
  public function format_upcase_p()[]: EmbeddedString;
  public function format_upcase_q()[]: EmbeddedString;
  public function format_upcase_r()[]: EmbeddedString;
  public function format_upcase_s()[]: EmbeddedString;
  public function format_upcase_t()[]: EmbeddedString;
  public function format_upcase_u()[]: EmbeddedString;
  public function format_upcase_v()[]: EmbeddedString;
  public function format_upcase_w()[]: EmbeddedString;
  public function format_upcase_x()[]: EmbeddedString;
  public function format_upcase_y()[]: EmbeddedString;
  public function format_upcase_z()[]: EmbeddedString;
  public function format_0x5b()[]: EmbeddedString;
  public function format_0x5c()[]: EmbeddedString;
  public function format_0x5d()[]: EmbeddedString;
  public function format_0x5e()[]: EmbeddedString;
  public function format_0x5f()[]: EmbeddedString;
  public function format_0x60()[]: EmbeddedString;
  public function format_a()[]: EmbeddedString;
  public function format_b()[]: EmbeddedString;
  public function format_c()[]: EmbeddedString;
  public function format_d()[]: EmbeddedString;
  public function format_e()[]: EmbeddedString;
  public function format_f()[]: EmbeddedString;
  public function format_g()[]: EmbeddedString;
  public function format_h()[]: EmbeddedString;
  public function format_i()[]: EmbeddedString;
  public function format_j()[]: EmbeddedString;
  public function format_k()[]: EmbeddedString;
  public function format_l()[]: EmbeddedString;
  public function format_m()[]: EmbeddedString;
  public function format_n()[]: EmbeddedString;
  public function format_o()[]: EmbeddedString;
  public function format_p()[]: EmbeddedString;
  public function format_q()[]: EmbeddedString;
  public function format_r()[]: EmbeddedString;
  public function format_s()[]: EmbeddedString;
  public function format_t()[]: EmbeddedString;
  public function format_u()[]: EmbeddedString;
  public function format_v()[]: EmbeddedString;
  public function format_w()[]: EmbeddedString;
  public function format_x()[]: EmbeddedString;
  public function format_y()[]: EmbeddedString;
  public function format_z()[]: EmbeddedString;
  public function format_0x7b()[]: EmbeddedString;
  public function format_0x7c()[]: EmbeddedString;
  public function format_0x7d()[]: EmbeddedString;
  public function format_0x7e()[]: EmbeddedString;
  public function format_0x7f()[]: EmbeddedString;
  public function format_0x80()[]: EmbeddedString;
  public function format_0x81()[]: EmbeddedString;
  public function format_0x82()[]: EmbeddedString;
  public function format_0x83()[]: EmbeddedString;
  public function format_0x84()[]: EmbeddedString;
  public function format_0x85()[]: EmbeddedString;
  public function format_0x86()[]: EmbeddedString;
  public function format_0x87()[]: EmbeddedString;
  public function format_0x88()[]: EmbeddedString;
  public function format_0x89()[]: EmbeddedString;
  public function format_0x8a()[]: EmbeddedString;
  public function format_0x8b()[]: EmbeddedString;
  public function format_0x8c()[]: EmbeddedString;
  public function format_0x8d()[]: EmbeddedString;
  public function format_0x8e()[]: EmbeddedString;
  public function format_0x8f()[]: EmbeddedString;
  public function format_0x90()[]: EmbeddedString;
  public function format_0x91()[]: EmbeddedString;
  public function format_0x92()[]: EmbeddedString;
  public function format_0x93()[]: EmbeddedString;
  public function format_0x94()[]: EmbeddedString;
  public function format_0x95()[]: EmbeddedString;
  public function format_0x96()[]: EmbeddedString;
  public function format_0x97()[]: EmbeddedString;
  public function format_0x98()[]: EmbeddedString;
  public function format_0x99()[]: EmbeddedString;
  public function format_0x9a()[]: EmbeddedString;
  public function format_0x9b()[]: EmbeddedString;
  public function format_0x9c()[]: EmbeddedString;
  public function format_0x9d()[]: EmbeddedString;
  public function format_0x9e()[]: EmbeddedString;
  public function format_0x9f()[]: EmbeddedString;
  public function format_0xa0()[]: EmbeddedString;
  public function format_0xa1()[]: EmbeddedString;
  public function format_0xa2()[]: EmbeddedString;
  public function format_0xa3()[]: EmbeddedString;
  public function format_0xa4()[]: EmbeddedString;
  public function format_0xa5()[]: EmbeddedString;
  public function format_0xa6()[]: EmbeddedString;
  public function format_0xa7()[]: EmbeddedString;
  public function format_0xa8()[]: EmbeddedString;
  public function format_0xa9()[]: EmbeddedString;
  public function format_0xaa()[]: EmbeddedString;
  public function format_0xab()[]: EmbeddedString;
  public function format_0xac()[]: EmbeddedString;
  public function format_0xad()[]: EmbeddedString;
  public function format_0xae()[]: EmbeddedString;
  public function format_0xaf()[]: EmbeddedString;
  public function format_0xb0()[]: EmbeddedString;
  public function format_0xb1()[]: EmbeddedString;
  public function format_0xb2()[]: EmbeddedString;
  public function format_0xb3()[]: EmbeddedString;
  public function format_0xb4()[]: EmbeddedString;
  public function format_0xb5()[]: EmbeddedString;
  public function format_0xb6()[]: EmbeddedString;
  public function format_0xb7()[]: EmbeddedString;
  public function format_0xb8()[]: EmbeddedString;
  public function format_0xb9()[]: EmbeddedString;
  public function format_0xba()[]: EmbeddedString;
  public function format_0xbb()[]: EmbeddedString;
  public function format_0xbc()[]: EmbeddedString;
  public function format_0xbd()[]: EmbeddedString;
  public function format_0xbe()[]: EmbeddedString;
  public function format_0xbf()[]: EmbeddedString;
  public function format_0xc0()[]: EmbeddedString;
  public function format_0xc1()[]: EmbeddedString;
  public function format_0xc2()[]: EmbeddedString;
  public function format_0xc3()[]: EmbeddedString;
  public function format_0xc4()[]: EmbeddedString;
  public function format_0xc5()[]: EmbeddedString;
  public function format_0xc6()[]: EmbeddedString;
  public function format_0xc7()[]: EmbeddedString;
  public function format_0xc8()[]: EmbeddedString;
  public function format_0xc9()[]: EmbeddedString;
  public function format_0xca()[]: EmbeddedString;
  public function format_0xcb()[]: EmbeddedString;
  public function format_0xcc()[]: EmbeddedString;
  public function format_0xcd()[]: EmbeddedString;
  public function format_0xce()[]: EmbeddedString;
  public function format_0xcf()[]: EmbeddedString;
  public function format_0xd0()[]: EmbeddedString;
  public function format_0xd1()[]: EmbeddedString;
  public function format_0xd2()[]: EmbeddedString;
  public function format_0xd3()[]: EmbeddedString;
  public function format_0xd4()[]: EmbeddedString;
  public function format_0xd5()[]: EmbeddedString;
  public function format_0xd6()[]: EmbeddedString;
  public function format_0xd7()[]: EmbeddedString;
  public function format_0xd8()[]: EmbeddedString;
  public function format_0xd9()[]: EmbeddedString;
  public function format_0xda()[]: EmbeddedString;
  public function format_0xdb()[]: EmbeddedString;
  public function format_0xdc()[]: EmbeddedString;
  public function format_0xdd()[]: EmbeddedString;
  public function format_0xde()[]: EmbeddedString;
  public function format_0xdf()[]: EmbeddedString;
  public function format_0xe0()[]: EmbeddedString;
  public function format_0xe1()[]: EmbeddedString;
  public function format_0xe2()[]: EmbeddedString;
  public function format_0xe3()[]: EmbeddedString;
  public function format_0xe4()[]: EmbeddedString;
  public function format_0xe5()[]: EmbeddedString;
  public function format_0xe6()[]: EmbeddedString;
  public function format_0xe7()[]: EmbeddedString;
  public function format_0xe8()[]: EmbeddedString;
  public function format_0xe9()[]: EmbeddedString;
  public function format_0xea()[]: EmbeddedString;
  public function format_0xeb()[]: EmbeddedString;
  public function format_0xec()[]: EmbeddedString;
  public function format_0xed()[]: EmbeddedString;
  public function format_0xee()[]: EmbeddedString;
  public function format_0xef()[]: EmbeddedString;
  public function format_0xf0()[]: EmbeddedString;
  public function format_0xf1()[]: EmbeddedString;
  public function format_0xf2()[]: EmbeddedString;
  public function format_0xf3()[]: EmbeddedString;
  public function format_0xf4()[]: EmbeddedString;
  public function format_0xf5()[]: EmbeddedString;
  public function format_0xf6()[]: EmbeddedString;
  public function format_0xf7()[]: EmbeddedString;
  public function format_0xf8()[]: EmbeddedString;
  public function format_0xf9()[]: EmbeddedString;
  public function format_0xfa()[]: EmbeddedString;
  public function format_0xfb()[]: EmbeddedString;
  public function format_0xfc()[]: EmbeddedString;
  public function format_0xfd()[]: EmbeddedString;
  public function format_0xfe()[]: EmbeddedString;
  public function format_0xff()[]: EmbeddedString;
}
