/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

function render_hh_lib_sql_style_pack(HipHopLibSqlQueryPack $pack)[]: string {
  return ToString\engine($pack->getFormat(), $pack->getArguments())
    |> \vsprintf(...$$);
}
