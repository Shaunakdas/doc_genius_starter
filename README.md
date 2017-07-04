# DocGenius Rails App

This README has all the documents used in building this project.

Things covered:

** Rails Explaination
* [Scaffold](https://gun.io/blog/using-scaffolding/) - What happend when you use scaffold for generating models in Rails
* [Rails Tutorials](https://www.railstutorial.org/book/toy_app) - Rails tutorials used in building this project
* [Nokogiri Taking a lot of time](https://stackoverflow.com/questions/26878263/libxml2-missing-mac-os-x-10-10) - Install libxml2 and separately and install nokogiri using system libraries
* [Excel Parsing -xls](https://github.com/zdavatz/spreadsheet/blob/master/GUIDE.md) - For parsing xls files only.
* [Excel Parsing -xlsx](https://github.com/weshatheleopard/rubyXL) - For parsing all other type of xlsx file
* [Running scripts from Rails console](https://stackoverflow.com/questions/10313181/pass-ruby-script-file-to-rails-console) 
* [Restarting already existing running server](https://stackoverflow.com/questions/15072846/server-is-already-running-in-rails)
* [Rolling back a failed Rails migration](https://stackoverflow.com/a/5466779)
* [Self Join/Making Tree of model](http://guides.rubyonrails.org/association_basics.html#self-joins) When a model want to reference itself.
* Ruby version
2.3.0

** Adding Api controller
```
rails generate controller Analytics
```
Move analytics_controller from app/controllers to app/controllers/api.Add a method in the analytics_controller and change existing content as 
```
class Api::AnalyticsController < ApiController
	def trial
		response ={}
	    render json: response.to_json, status: 200
	end
end
```
Inside config/routes.rb, first delete existing route 
```
resources :analytics
```
and add api route.
```
namespace :api, :defaults => {:format => :json} do  
    resources :analytics  do 
      collection do
        get   :get_analytics
      end
    end
  end
```
Now you can see the new api on [http://localhost:3000/api/analytics/get_analytics](http://localhost:3000/api/analytics/get_analytics)

* Execute file in Rails console

```
bundle exec rails runner "eval(File.read 'your_script.rb')"
```
* System dependencies

* Configuration

* Database creation

** Database initialization
* [Adding Mysql gem to Exisitng Rails App](https://teamtreehouse.com/community/how-do-i-install-the-mysql-gem-and-how-do-i-set-it-as-the-default-database-for-rails) - Adding Mysql gem in Rails when Mysql is already installed
* [MySQL ERROR 2002 (HY000)](https://stackoverflow.com/a/43407957) - When Mysql gives this error. Stop and Restart server.
* [Polymorphic field]
```
rails generate scaffold UserEntityScore entity:references{polymorphic}:index 
``` 
* [Find/Create By multiple reference fields] Be cautious to just use reference only. Any value fields should be updated by directly referencnig the output object
```
stream = Stream.find_or_create_by(:name => stream_name,:subject => subject)
```
* [Find/Create By multiple reference and value fields]
```
user_breakup = UserBreakup.where(:ref_field_1 => ref_object_1, :ref_field_2 =>ref_object_2).first
user_breakup = UserBreakup.create(:ref_field_1 => ref_object_1, :ref_field_2 =>ref_object_2,:value_field_1 => 0, :value_field_1 => 0) if not user_breakup
```

** Migration
* [Migrations Add/Remove Reference](https://stackoverflow.com/questions/5648970/rails-migration-with-adding-and-removing-reference) - Adding and Removing reference using migration
* [Migration Change Table Name](https://stackoverflow.com/questions/471416/how-do-you-write-a-migration-to-rename-an-activerecord-model-and-its-table-in-ra) - How to change Table Name using Migrations
* [Migration to define decimal fields]
```
change_column :table_name, :field_name, :decimal, :precision => 10, :scale => 2
```


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
