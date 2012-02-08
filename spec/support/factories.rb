Factory.define :user do |u|
  u.sequence(:email) { |n| "foo#{n}@example12345.com" }
  u.password "secret"
end

Factory.define :paste do |p|
  p.sequence(:title) { |n| "test paste ##{n}" }
  p.sequence(:code)  { |n| "some code ##{n}" }
end
