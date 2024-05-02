FactoryBot.define do
  factory :add_on do
    sequence(:name) { |n| "AddOn #{n}" }
    total_spots { 1 }                                # Default total spots

    # Define optional parameters
    transient do
      custom_start_time { nil }
      custom_end_time { nil }
      custom_total_spots { nil }
    end

    # Override default attributes if custom parameters are provided
    before(:create) do |add_on, evaluator|
      add_on.start_time = evaluator.custom_start_time if evaluator.custom_start_time
      add_on.end_time = evaluator.custom_end_time if evaluator.custom_end_time
      add_on.total_spots = evaluator.custom_total_spots if evaluator.custom_total_spots
    end
  end

  factory :trip do
    sequence(:name) { |n| "AddOn #{n}" }
  end

  factory :trip_add_on do
    # Define associations
    association :trip, factory: :trip
    association :add_on, factory: :add_on
  end
end
