# SQL Queryf

_Render queryf-style SQL queries to strings for logging and debugging._

`SqlQueryf\ToString\engine()` will render queries for logging and
debugging purposes. For example, if you have a syntax error in the query you
just ran, you might want to add the query to the exception message to aid the
developer in fixing it.

## Security Notice

`SqlQueryf\ToString\engine()` is meant for logging and debugging. **Do NOT**
pass the returned query to a database. This is a bad idea, since SQL escaping
has been mocked out with `fake_mysql_escape_UNSAFE`. **Please for all that**
**is good, don't!**

## Why don't I use HH\Lib\SQL\Query’s built-in methods?

If your application uses `HH\Lib\SQL\Query`, and want to use
`toString__FOR_DEBUGGING_ONLY` for this purpose, you might tear down your
entire hhvm instance with a segmentation fault. This method is broken and
should not be used. The method `toUnescapedString__FOR_DEBUGGING_ONLY__UNSAFE`
does work, but the result is very difficult to read. Strings with quotes or
slashes break the SQL syntax and the renderer tries to save bytes by
inserting as little whitespace as possible.

## Migration

If you use `HH\Lib\SQL\Query`, create these functions in your namespace:

```HACK
type QueryType = SQL\Query;

function queryf(
  HH\FormatString<SQL\QueryFormat> $format,
  mixed ...$args
)[defaults]: QueryType {
  return \HH\FIXME\UNSAFE_CAST<dynamic, dynamic>(SQL\Query::class)
    |> new $$($format, $args);
}

function query_to_native(QueryType $query)[]: SQL\Query {
  return $query;
}
```

Replace usages of `new SQL\Query()` with `queryf()` and `$db->queryAsync($q)`
with `$db->queryAsync(query_to_native($q))`. Then replace references to the
`SQL\Query` type with the `QueryType` type. This will change nothing about
your application.

You are now ready to make the switch to:

```HACK
type QueryType = SqlQueryf\HipHopLibSqlQueryPack;

function queryf(
  HH\FormatString<ToString\Sql> $format,
  mixed ...$args
)[]: SqlQueryf\HipHopLibSqlQueryPack {
  return SqlQueryf\HipHopLibSqlQueryPack::createWithoutTypechecking_UNSAFE(
    $format as string,
    vec($args),
  );
}

function query_to_native(
  SqlQueryf\HipHopLibSqlQueryPack $query,
)[defaults]: SQL\Query {
  $args = vec[];

  foreach ($pack->getArguments() as $a) {
    if ($a is SqlQueryf\HipHopLibSqlQueryPack) {
      $args[] = query_to_native($a);
    } else {
      $args[] = $a;
    }
  }

  return \HH\FIXME\UNSAFE_CAST<dynamic, dynamic>(SQL\Query::class)
    |> new $$($pack->getFormat(), $args);
}
```

Use of the `__FOR_DEBUGGING_ONLY` methods will now be a type error.
Replace them with a call to:

```HACK
function queryf_to_string(
  SqlQueryf\HipHopLibSqlQueryPack $query
)[]: string {
  return ToString\engine($query->getFormat(), $query->getArguments())
    |> \vsprintf(...$$);
}
```

Congratulations on a successful migration.

## Expanding the possibilities

Now that you own the `HH\FormatString<T>` type for your queries, you may want
to add specifiers that are not part of the set provided by `SQL\Query`.
You can create any `engine()` and transform from `QueryPack` to `SQL\Query`.
