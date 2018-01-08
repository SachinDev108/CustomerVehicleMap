FactoryGirl.define do

  factory :customer, class: Customer do
  	name { 'tester' }
    address { '421 8th Avenue, New York, NY, United States' }
    city { 'New York' }
    state { 'NY' }
    zip { '10001' }
    email { 'test1@yopmail.com' }
    phone { '1236247891' }
    lat { '40.7515458' }
    lng { '-73.9959106' }
    vehicles {build_list :vehicles, 1 }
  end
end


FactoryGirl.define do
  factory :vehicles, class: Vehicle do
    year { '2018' }
    make { '2018-01-01' }
    model { 'xyz model' }
    style { 'Chevrolet' }
  end
end