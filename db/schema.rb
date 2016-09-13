ActiveRecord::Schema.define(version: 20160913002654) do
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string   'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories_trips', id: false, force: :cascade do |t|
    t.integer 'category_id', null: false
    t.integer 'trip_id',     null: false
  end

  add_index 'categories_trips', ['category_id', 'trip_id'], name: 'index_categories_trips_on_category_id_and_trip_id', using: :btree
  add_index 'categories_trips', ['trip_id', 'category_id'], name: 'index_categories_trips_on_trip_id_and_category_id', using: :btree

  create_table 'trips', force: :cascade do |t|
    t.string   'title'
    t.string   'description'
    t.string   'price'
    t.string   'image'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string   'username'
    t.string   'password_digest'
    t.string   'password_confirmation'
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end
end
