# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
user = User.create :email => 'john@example.com', 
                   :password => 'guessit',
                   :password_confirmation => 'guessit'
Category.create [{:name => 'Marketing Tips'},
                 {:name => 'Event'},
                 {:name => 'Travel'},
                 {:name => 'Misc'}]
