
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: 1)
end

