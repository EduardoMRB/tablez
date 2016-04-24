# Tablez

This was inspired by the [Terminal-Table](https://github.com/tj/terminal-table) project. I'm trying to keep a similar API, but there isn't complete feature parity yet.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tablez'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tablez

## Usage

A table instance takes a 2 dimensional array for the rows.

```ruby
table = Tablez::Table.new
table << [[1, 2, 3], [4, 5, 6]]
puts table.render

+---+---+---+
| 1 | 2 | 3 |
+---+---+---+
| 4 | 5 | 6 |
+---+---+---+
```
Tablez handles jagged arrays by padding smaller rows with empty values. Left hand 
alignment will be followed for columns that have different length values.

```ruby
table = Tablez::Table.new
table << [[1, 2, 3, 444, 5], [66, 7, 888]]
puts table.render

+----+---+-----+-----+---+
| 1  | 2 | 3   | 444 | 5 |
+----+---+-----+-----+---+
| 66 | 7 | 888 |     |   |
+----+---+-----+-----+---+
```

You can add a blank with `''`

```ruby
table = Tablez::Table.new
table << [['foo', 'bar baz what'], ['', 'yep a blank']]

+-----+--------------+
| foo | bar baz what |
+-----+--------------+
|     | yep a blank  |
+-----+--------------+
```

### Padding

A table instance can take a padding option which will pad the whole table on the x-axis.

```ruby
table = Tablez::Table.new(padding: 2)
table << [[1, 2, 3], [4, 5, 6]]
puts table.render

+-----+-----+-----+
|  1  |  2  |  3  |
+-----+-----+-----+
|  4  |  5  |  6  |
+-----+-----+-----+
```

## Development

`$ rake` to run the tests

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nikkypx/tablez.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

