/** sql-queryf is MIT licensed, see /LICENSE. */
namespace HTL\SqlQueryf;

use namespace HH\Lib\SQL;

function unsupported_query_object(mixed $query)[]: nothing {
  invariant(
    !$query is PackedQuery,
    '%s contains more specifiers than the to-string mode can handle. '.
    'Expected a %s instead. You can repack the query using your `engine()` function.',
    PackedQuery::class,
    HipHopLibSqlQueryPack::class,
  );

  invariant_violation(
    'Can not render %s (as a Pack) in to-string mode. '.
    'The format and the arguments are not accessible (private). '.
    '%s is only supported when using a pack to query %s, but not for debug introspection. ',
    \is_object($query) ? \get_class($query) : \gettype($query) as string,
    SQL\Query::class,
    \AsyncMysqlConnection::class,
  );
}
