class Color < ActiveHash::Base
  self.data = [
    {:id => 1, :name => "Red", value: 'red'},
    {:id => 2, :name => "Bule", value: 'bule'},
    {:id => 3, :name => "Tea", value: 'tea'}
  ]
end
