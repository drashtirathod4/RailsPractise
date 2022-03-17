require "active_support/all"
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

