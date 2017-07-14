# RedactorRails

Rails Integration for Redactor 2. This gem creates models, controllers and uploaders for picture/document uploads. It also generates a basic configuration file.

Note: This gem doesn't include the javascript and stylesheet files for redactor. Please visit the official [redactor site](https://imperavi.com/redactor/) to purchase the assets.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redactor_rails'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install redactor_rails
```

## Usage

### 1. Run generator

After installing the gem, run

```
rails generate redactor_rails:install
```

This will install the migration, model and uploader files to your application. Then run

```
rake db:migrate
```

### 2. Download the asset files

Download from the official [redactor site](https://imperavi.com/redactor/) and place it in `app/assets/javascripts/redactor_rails/` folder. Then, include these in your application. You can skip these if you include all your assets using `require_tree .`


Add to your `application.js`:

```
//= require_tree ./redactor-rails
```

Add to your `application.css`:

```
*= require_tree ./redactor-rails
```

redactor requires jQuery. So, add that to your assets if you don't already

### 3. Initialize Redactor

For each textarea that you want to use with Redactor, add the "redactor" class.

```
<%= text_area_tag :editor, "", :id => "redactor", :rows => 40, :cols => 120 %>
```

### 4. Customize redactor

You can customize your redactor configuration in your `app/assets/javascripts/redactor_rails/config.js` file
Check out [the official docs](https://imperavi.com/redactor/docs/) for settings and API.

### 5. Customize uploaders

The gem will create uploader files that will handle the upload using Carrierwave. Check out `app/uploaders/redactor_rails/` directory and modify the uploaders based on your needs. Refer [carrierwave docs](https://github.com/carrierwaveuploader/carrierwave) for instructions.

### 6. Authenticate users
In order to authenticate users, just add this method to your application_controller.rb. The default (if this method is absent) will allow all users to upload content.

```ruby
def redactor_authenticate_user!
  return current_user.blank? # or something like this
end
```

### 7. Associate user_id to uploads
The table includes user_id column, and you can set the user with the following method.

```ruby
def redactor_current_user
  return current_user # or something like this
end
```

If the above method is absent, the default is `redactor_current_user || current_user || current_resource_owner || nil`

## Advanced

### 1. Redactor Plugins
To use any of [redactor plugins](https://imperavi.com/redactor/plugins/), download them to your `app/assets/javascripts/redactor_rails` and modify the configuration in `config.js` to add plugin.

### 2. Turbolinks
When your app uses turbolinks, it will cache the page, and so when you renavigate to that page using browser navigation, your redactor will exist but will not function.

```
$(document).on("turbolinks:before-cache", function() {
  $('.redactor').redactor('core.destroy');
});
```

## Credits

This gem was based on the [redactor-rails]() gem that was built for an earlier free version of redactor, and that gem was partially based on [ck-editor](https://github.com/galetahub/ckeditor) project

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kbravi/redactor_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

