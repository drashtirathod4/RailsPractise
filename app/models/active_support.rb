require "active_support/all"
require 'active_support/core_ext'
require 'pathname'
require 'active_support/core_ext/file/atomic.rb'
require 'active_support/core_ext/numeric/conversions.rb'


a = {a: 1}.with_indifferent_access["a"]
puts a
puts "foo".dup
puts "".dup
puts "foo".duplicable?

array     = ['string']
duplicate = array.dup
puts duplicate.push 'another-string'
puts duplicate.first.gsub!('string', 'foo')

# deep_dup
array     = ['string']
duplicate = array.deep_dup
puts duplicate.first.gsub!('string', 'foo')

# to_param
puts 7.to_param
puts "Tom".to_param
puts [0, true, String].to_param # => "0/true/String"

# to_query
puts [3.4, -45.6].to_query('sample')
a = {c: 3, b: 2, a: 1}.to_query # => "a=1&b=2&c=3"
puts a
b = {id: 89, name: "John Smith"}.to_query('user')

puts b
# => "user%5Bid%5D=89&user%5Bname%5D=John+Smith"

# in?
puts 1.in?([1,2])        # => true
puts "lo".in?("hello")
puts "loo".in?("hello")

# module_parent
module X
    module Y
        module Z
        end
    end
end
M = X::Y::Z
  
puts X::Y::Z.module_parent # => X::Y
puts M.module_parent       # => X::Y

res = X::Y::Z.module_parent_name # => "X::Y"
puts res.class

# module_parents
puts X::Y::Z.module_parents # => [X::Y, X, Object]
puts M.module_parents       # => [X::Y, X, Object]

# anonymous
module N
end
puts N.name # => "N"
puts N.anonymous? # => false
puts Module.new.anonymous? # => true

# subclasses
class C; 
end
puts C.subclasses  # => []
class B < C;
end
puts C.subclasses  # => [B]
class A < B;
end
puts C.subclasses  # => [B]

# descendants
puts C.descendants # => [B,A]

# safe strings
s = ""
puts s.html_safe?
s = "".html_safe
puts s.html_safe?
puts "".html_safe + "<".html_safe  # => "<"

# remove
puts "Hello World".remove(/Hello /) # => "World"

# squish
puts " \n  foo\n\r \t bar \n".squish # => "foo bar"

# truncate
puts "Oh dear! Oh dear! I shall be late!".truncate(20)
puts "Oh dear! Oh dear! I shall be late!".truncate(20, omission: '&hellip;')

# truncate_bytes
puts "👍👍👍👍".truncate_bytes(15)
# => "👍👍👍…"

puts "👍👍👍👍".truncate_bytes(15, omission: "🖖")
# => "👍👍🖖"

# tuncate_words
puts "Oh dear! Oh dear! I shall be late!".truncate_words(6)
# => "Oh dear! Oh dear! I shall..."

puts "Oh dear! Oh dear! I shall be late!".truncate_words(4, omission: '&hellip;')
# => "Oh dear! Oh dear!&hellip;"

puts "Oh dear! Oh dear! I shall be late!".truncate_words(2, separator: '!')
# => "Oh dear! Oh dear! I shall be late..."

# inquiry
puts "production".inquiry.production? # => true
puts "active".inquiry.inactive?       # => false

# starts_with and ends_with
puts "foo".starts_with?("f") # => true
puts "foo".ends_with?("o")   # => true

# indent
puts "  foo".indent(2)        # => "    foo"
puts "foo\n\t\tbar".indent(2) # => "\t\tfoo\n\t\t\t\tbar"
puts "foo".indent(2, "\t")    # => "\t\tfoo"

# Access
# at(position)
puts "hello".at(0)  # => "h"
puts "hello".at(4)  # => "o"
puts "hello".at(-1) # => "o"
puts "hello".at(10) # => nil

# from(position)
puts "hello".from(0)  # => "hello"
puts "hello".from(2)  # => "llo"
puts "hello".from(-2) # => "lo"
puts "hello".from(10) # => nil

# to(position)
puts "hello".to(0)  # => "h"
puts "hello".to(2)  # => "hel"

# first(limit)
puts "hello".first(3)  # => hel
puts "hello".first(1)  # => h

# last(limit)
puts "hello".last(3)  # => llo
puts "hello".last(1)  # => o

# pluralize
puts "table".pluralize      # => "tables"
puts "person".pluralize     # => "people"
puts "person".pluralize(1)  # => "person"

# singularize
puts "tables".singularize   # => "table"
puts "people".singularize   # => "person"

# camelize
puts "product".camelize    # => "Product"
puts "admin_user".camelize # => "AdminUser"
puts "backoffice/session".camelize # => "Backoffice::Session"
puts "visual_effect".camelize(:lower) # => "visualEffect"

# underscore
puts "Product".underscore   # => "product"
puts "AdminUser".underscore # => "admin_user"
puts "Backoffice::Session".underscore # => "backoffice/session"

# titleize
puts "alice in wonderland".titleize # => "Alice In Wonderland"
puts "fermat's enigma".titleize     # => "Fermat's Enigma"

# dasherize
puts "name".dasherize         # => "name"
puts "contact_data".dasherize # => "contact-data"

# demodulize
puts "Product".demodulize                        # => "Product"
puts "Backoffice::UsersController".demodulize    # => "UsersController"
puts "Admin::Hotel::ReservationUtils".demodulize # => "ReservationUtils"

# deconstantize
puts "Product".deconstantize                        # => ""
puts "Backoffice::UsersController".deconstantize    # => "Backoffice"
puts "Admin::Hotel::ReservationUtils".deconstantize # => "Admin::Hotel"

# parameterize
puts "John Smith".parameterize # => "john-smith"
puts "Kurt Gödel".parameterize # => "kurt-godel"
puts "John Smith".parameterize(preserve_case: true) # => "John-Smith"
puts "Kurt Gödel".parameterize(separator: "_") # => "kurt_godel"

# tableize
puts "Person".tableize      # => "people"
puts "Invoice".tableize     # => "invoices"
puts "InvoiceLine".tableize # => "invoice_lines"

# classify 
puts "people".classify        # => "Person"
puts "invoices".classify      # => "Invoice"
puts "invoice_lines".classify # => "InvoiceLine"

# constantize
puts "Integer".constantize # => Integer
puts ""

# humanize
puts "name".humanize                         # => "Name"
puts "author_id".humanize                    # => "Author"
puts "author_id".humanize(capitalize: false) # => "author"
puts "comments_count".humanize               # => "Comments count"
puts "_id".humanize                          # => "Id"
puts 'ssl_error'.humanize # => "SSL error"

# foreign_key
puts "User".foreign_key           # => "user_id"
puts "InvoiceLine".foreign_key    # => "invoice_line_id"
puts "Admin::Session".foreign_key # => "session_id"
puts "User".foreign_key(false) # => "userid"

# Conversions
# to_date, to_time, to_datetime
puts "2010-07-27".to_date         # => Tue, 27 Jul 2010
puts "2010-07-27 23:37:00".to_time     # => 2010-07-27 23:37:00 +0200
puts "2010-07-27 23:37:00".to_datetime # => Tue, 27 Jul 2010 23:37:00 +0000

# Bytes
puts 2.kilobytes   # => 2048
puts 3.megabytes   # => 3145728
puts 3.5.gigabytes # => 3758096384
puts -4.exabytes   # => -4611686018427387904
puts 1.megabyte # => 1048576

# Time
puts 1.day.from_now
puts 2.weeks.from_now
puts 1.month.from_now

# extensions to big decimal : to_s
puts BigDecimal(5.00, 6).to_s       # => "5.0"
puts BigDecimal(5.00, 6).to_s("e")  # => "0.5E1"
puts BigDecimal(5.10, 6).to_s       # => "5.1"

# sum
puts [1, 2, 3].sum # => 6
puts (1..100).sum  # => 5050

p [[1, 2], [2, 3], [3, 4]].sum    # => [1, 2, 2, 3, 3, 4]
p %w(foo bar baz).sum             # => "foobarbaz"
res = {a: 1, b: 2, c: 3}.sum          # => [:a, 1, :b, 2, :c, 3]
p res

puts [].sum    # => 0
puts [].sum(1) # => 1

puts (1..5).sum {|n| n * 2 } # => 30
puts [2, 4, 6, 8, 10].sum    # => 30

# exclude?
puts [1,2,3].exclude?(4)    # => true
puts [1,2,3].exclude?(2)    # => false

# include?
puts [1,2,3].include?(4)    # => false
puts [1,2,3].include?(2)    # => true

# including
a = [ 1, 2, 3 ]                  
p a.including(4, 5)         # => [ 1, 2, 3, 4, 5 ]
p a
p ["David", "Rafael"].including %w[ Aaron Todd ] # => ["David", "Rafael", "Aaron", "Todd"]

# excluding
p ["David", "Rafael", "Aaron", "Todd"].excluding("Aaron", "Todd") # => ["David", "Rafael"]

# pluck
p [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name) # => ["David", "Rafael", "Aaron"]
p [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :name) # => [[1, "David"], [2, "Rafael"]]

# pick -> extracts the given key from the first element only
p [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pick(:name) # => "David"
p [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pick(:id, :name) # => [1, "David"]


# extensions to array
# to
p %w(a b c d).to(2) # => ["a", "b", "c"]
p [].to(7)          # => []

# from()
p %w(a b c d).from(2)  # => ["c", "d"]
p %w(a b c d).from(10) # => []
p [].from(0)           # => []

# including
p [ 1, 2, 3 ].including(4, 5)          # => [ 1, 2, 3, 4, 5 ]
p [ [ 0, 1 ] ].including([ [ 1, 0 ] ]) # => [ [ 0, 1 ], [ 1, 0 ] ]

# excluding
p ["David", "Rafael", "Aaron", "Todd"].excluding("Aaron", "Todd") # => ["David", "Rafael"]
p [ [ 0, 1 ], [ 1, 0 ] ].excluding([ [ 1, 0 ] ])                  # => [ [ 0, 1 ] ]

# first, second, third, fourth, fifth ....
p %w(a b c d).third # => "c"
p %w(a b c d).fifth # => nil

# extracting
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
odd_numbers = numbers.extract! { |number| number.odd? } # => [1, 3, 5, 7, 9]
p numbers       # => [0, 2, 4, 6, 8]
p odd_numbers   # => [1, 3, 5, 7, 9]

# Conversions
# to_sentence
p %w().to_sentence                # => ""
p %w(Earth).to_sentence           # => "Earth"
p %w(Earth Wind).to_sentence      # => "Earth and Wind"
p %w(Earth Wind Fire).to_sentence # => "Earth, Wind, and Fire"

p %w(Earth Wind).to_sentence(two_words_connector: " or ")      # => "Earth or Wind"
p %w(Earth Wind Fire).to_sentence(words_connector: " or ")      # => "Earth or Wind, and Fire"
p %w(Earth Wind Fire).to_sentence(last_word_connector: " or ")      # => "Earth, Wind or Fire"

# to_fs
p [].to_fs(:db)            # => "null"
p [1,2].to_fs          # => "[1, 2]"

# to_xml
puts  [{a: 1, b: 2}, {c: 3}].to_xml

# wrapping
p Array.wrap(nil)       # => []
p Array.wrap([1, 2, 3]) # => [1, 2, 3]
p Array.wrap(0)         # => [0]

p Array.wrap(foo: :bar) # => [{:foo=>:bar}]
p Array(foo: :bar)      # => [[:foo, :bar]]

# duplicating
# deep_dup
array = [1,[2,3]]
dup = array.deep_dup
p dup
dup[1][2] = 4
p dup

# grouping
# in_groups_of(number, fill_with = nil)
p [1, 2, 3].in_groups_of(2) # => [[1, 2], [3, nil]]
p [1, 2, 3].in_groups_of(2, 0) # => [[1, 2], [3, 0]]
p [1, 2, 3].in_groups_of(2, false) # => [[1, 2], [3]]

# in_groups(number, fill_with = nil)
p %w(1 2 3 4 5 6 7).in_groups(3)
# => [["1", "2", "3"], ["4", "5", nil], ["6", "7", nil]]

p %w(1 2 3 4 5 6 7).in_groups(3, "0")
# => [["1", "2", "3"], ["4", "5", "0"], ["6", "7", "0"]]

p %w(1 2 3 4 5 6 7).in_groups(3, false)
# => [["1", "2", "3"], ["4", "5"], ["6", "7"]]

# split
p [1, 2, 3, 4, 5].split(3)              # => [[1, 2], [4, 5]]
p (1..10).to_a.split { |i| i % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]
p [0, 1, -5, 1, 1, "foo", "bar"].split(1)
# => [[0], [-5], [], ["foo", "bar"]]


# Extensions to hash
# conversion 
# to_xml

r = {"foo" => 1, "bar" => 2}.to_xml
puts  r
puts ""

# merging
a = {a: 1, b: 1}.merge(a: 0, c: 2)
p a
# => {:a=>0, :b=>1, :c=>2}

# reverse_merge
b = {a: 1, b: 1}.reverse_merge(a: 0, c: 2)
p b
# => {:a=>1, :c=>2, :b=>1}

# deep_merge
c = {a: {b: 1}}.deep_merge(a: {c: 2})
p c
# => {:a=>{:b=>1, :c=>2}}

# merge
c = {a: {b: 1}}.merge(a: {c: 2})
p c
# => {:a=>{:c=>2}}

# deep_dup
hash = { a: 1, b: { c: 2, d: [3, 4] } }
dup = hash.deep_dup
p dup
dup[:b][:e] = 5
dup[:b][:d] << 5

puts hash[:b][:e] == nil      # => true
puts hash[:b][:d] == [3, 4]   # => true

puts "Hash : #{hash}"
puts "Duplicate hash : #{dup}"

# dup vs deep_dup
# dup will also change original hash if we made changes to duplicate hash
# But deep_dup won't change original hash if we made changes to duplicate hash

# Wroking with keys
# except
hashh = {a: 1, b: 2}
p hashh.except(:a)      # => {:b=>2}
p hashh               # => {:a=>1, :b=>2}

# except!
# removes key from original hash also
hash2 = {a: 1, b: 2}
p hash2.except!(:a)      # => {:b=>2}
p hash2                 # => {:b=>2}

# stringify_keys
res3 =  {nil => nil, 1 => 1, a: :a}
p res3.stringify_keys
# => {"" => nil, "1" => 1, "a" => :a}

res4 = {nil => nil, 1 => 1, nested: {a: 3, 5 => 5}}
p res4.stringify_keys
# => {""=>nil, "1"=>1, "nested"=>{a=>3, 5=>5}}

# deep_stringify_keys
res5 = {nil => nil, 1 => 1, nested: {a: 3, 5 => 5}}
p res5.deep_stringify_keys
# => {""=>nil, "1"=>1, "nested"=>{"a"=>3, "5"=>5}}
puts ""


# symbolize_keys
res6 = {nil => nil, 1 => 1, "a" => "a"}
p res6.symbolize_keys
# => {nil=>nil, 1=>1, :a=>"a"}

# deep_symbolize_keys
res7 = {nil => nil, 1 => 1, "nested" => {"a" => 3, 5 => 5}}
p res7.deep_symbolize_keys
# => {nil=>nil, 1=>1, nested:{a:3, 5=>5}}

p res7.symbolize_keys
# => {nil=>nil, 1=>1, nested:{"a":3, 5=>5}}

# assert_valid_keys(*valid_keys)
h1 = { name: 'Rob', years: '28' }
# p h1.assert_valid_keys(:name, :age) # => raises "ArgumentError: Unknown key: :years. Valid keys are: :name, :age"
h2 ={ name: 'Rob', age: '28' }
# p h2.assert_valid_keys('name', 'age') # => raises "ArgumentError: Unknown key: :name. Valid keys are: 'name', 'age'"
h3 = { name: 'Rob', age: '28' }
p h3.assert_valid_keys(:name, :age)   # => passes, raises nothing

puts ""


# Working with values
# deep_transform_values
hash = { person: { name: 'Rob', age: '28' } }

p hash.deep_transform_values{ |value| value.to_s.upcase }
# => {person: {name: "ROB", age: "28"}}


# slice!
hash = {a: 1, b: 2}
rest = hash.slice!(:a) # => {:b=>2}
p hash                   # => {:a=>1}


# extract!
hash = {a: 1, b: 2}
rest = hash.extract!(:a) # => {:a=>1}
p hash                     # => {:b=>2}

# Extensions to Regexp
# multiline?
p %r{.}.multiline?  # => false
p %r{.}m.multiline? # => true

p Regexp.new('.').multiline?                    # => false
p Regexp.new('.', Regexp::MULTILINE).multiline? # => true
puts ""

# Extensions to Range
# to_s
p (Date.today..Date.tomorrow).to_s
# => "2009-10-25..2009-10-26"

p (Date.today..Date.tomorrow).to_s(:db)
# => "BETWEEN '2009-10-25' AND '2009-10-26'"

# === and include?
p (1..10) === (3..7)  # => true
p (1..10) === (0..7)  # => false
p (1..10) === (3..11) # => false
p (1...9) === (3..9)  # => false
puts ""
p (1..10).include?(3..7)  # => true
p (1..10).include?(0..7)  # => false
p (1..10).include?(3..11) # => false
p (1...9).include?(3..9)  # => false
puts ""

# overlaps?
p (1..10).overlaps?(7..11)  # => true
p (1..10).overlaps?(0..7)   # => true
p (1..10).overlaps?(11..27) # => false
puts ""

# Extensions to date
p Date.current
p Date.yesterday
p Date.tomorrow
puts ""

# named dates
d = Date.today 
p d
p d.beginning_of_week          # => Mon, 03 May 2010
p d.beginning_of_week(:sunday) # => Sun, 02 May 2010
p d.end_of_week                # => Sun, 09 May 2010
p d.end_of_week(:sunday)       # => Sat, 08 May 2010

p d.monday
p d.sunday

p d.next_week
p d.prev_week
p d.prev_week(:saturday)
p d.beginning_of_month
p d.end_of_month
puts ""

p d.beginning_of_quarter
p d.end_of_quarter

p d.beginning_of_year
p d.end_of_year
puts ""

p d.years_ago(21)  
p d.years_since(10)
puts ""

p d.months_ago(1)
p d.months_since(1)
puts ""

p d.weeks_ago(4)
p d.weeks_since(4)

p d.advance(years: 1, weeks: 2)
p d.advance(months: 2, days: -2)

# changing components : change()
p Date.new(2010, 12, 23).change(year: 2011, month: 11)
# => Wed, 23 Nov 2011

# durations
d = Date.current
p d + 1.year
p d - 3.hours

p d.beginning_of_day
p d.end_of_day

d = DateTime.current
p d
p d.beginning_of_hour
p d.end_of_hour
p d.beginning_of_minute
p d.end_of_minute

# ago(seconds)
p d.ago(1)
p d.ago(60)

# since(seconds)
p d.since(1)
p d.since(60)
puts " "

p d.midnight
p d.seconds_since_midnight

p d 
p d.utc
p d.utc?    # false
puts " "


# Extensions to Time
t = Time.current
p t

p t.all_day
p t.all_week
p t.all_month
p t.all_quarter
p t.all_year
puts ""

p t.prev_year
p t.next_year
p t.prev_day
p t.next_day
p t.prev_month
p t.next_month
puts ""

p t + 1.year

# Extensions to File
pn = Pathname.new("/home/drashtirathod/Practise/app/models/post.rb").read
size = pn.size
puts pn 

# atomic_write
File.atomic_write("sample.txt") do |file|
    file.write("Hello World")
end


