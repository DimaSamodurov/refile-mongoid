# Integrate [Refile](https://github.com/refile/refile) with [Mongoid](https://github.com/mongoid/mongoid).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'refile-mongoid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install refile-mongoid


## Usage

Se original [Refile](https://github.com/refile/refile) documentation for usage.

You just do not need to create a database migration as attachment id field is defined automatically on the model.

### Using attachments within Embedded documents

Because storing/deleting of files is triggered by callbacks, 
you might want to specify ```cascade_callbacks: true``` for your embedded associations e.g:


```ruby
class Photo
  include Mongoid::Document
  attachment :image
end

class Album
  include Mongoid::Document
  embeds_many :photos, cascade_callbacks: true
end
```

See [MongoID doc](http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/#cascading-callbacks)

## Testing 

    $ rake


