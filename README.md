# ContentForOnce

Seems like `content_for`, content_for_once embed the HTML tags(especially, `javascript_include_tag` and `stylesheet_link_tag`) just only once.

## Usage

Add this line to your Rails application's Gemfile:

```ruby
gem 'content_for_once'
```

Prepare some layout file.

```haml
-# layout.html.haml
%html
  %head
    = yield :css
    = yield :js
```

Write `content_for_once` block, and write tags that you want to use it only once in the page.

```
-# sample.html.haml
- content_for_once :css do
  = stylesheet_link_tag "sample1"

= render 'sample_mini'
```

```
-# _sample_mini.html.haml
- content_for_once :css do
  = stylesheet_link_tag "sample1"
  = stylesheet_link_tag "sample2"
```

Then rendered page has unique tags!

```sample.html
<html>
  <head>
    <link rel='stylesheet' href='sample1.css'>
    <link rel='stylesheet' href='sample2.css'>
  </head>
<html>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tanukiti1987/content_for_once.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Acknowledgment

`content_for_once` is being influenced [s21g's article](http://blog.s21g.com/articles/203).
Thanks.
