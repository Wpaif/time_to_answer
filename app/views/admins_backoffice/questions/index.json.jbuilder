json.array! @questions do |question|
  json.id question.id
  json.description question.description
  json.subject question.subject.description

  json.answers do
    json.array! question.answers do |answer|
      json.id answer.id
      json.description answer.description
      json.correct? answer.correct
    end
  end

  json.created_at question.created_at
  json.updated_at question.updated_at
end
