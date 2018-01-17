json.extract! datafile, :id, :name, :filen, :user_id, :created_at, :updated_at
json.url datafile_url(datafile, format: :json)
