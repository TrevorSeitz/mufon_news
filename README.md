# MufonNews

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib`. To experiment with that code, run `bin/run_mufon_scraper` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mufon_news'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mufon_news

## Usage

The CLI opens with a list of options: see UFO news, see MUFON news or see a list of the most recent sightings reported to MUFON.

When you choose the option you want, you are directed to the next level.  in the case of the UFO news or the MUFON news, that will be a list of stories you can choose to read.  The list of recent sightings will give you a lis tof reports, including the case #, the date of the sighting, the date of the report, where the sighting was, and a short description of the event.

When you chose the story you want to read, you are directed to a page that gives you the text of the story and when you are done, you can go back t the list of stories to choose another.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TrevorSeitz/mufon_news.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
