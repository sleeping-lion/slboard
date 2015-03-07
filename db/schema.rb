# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140505080021) do

  create_table "blog_categories", force: true do |t|
    t.integer  "user_id",                                         null: false
    t.integer  "blog_category_id"
    t.string   "title",                 limit: 60,                null: false
    t.integer  "blogs_count",                      default: 0,    null: false
    t.integer  "blog_categories_count",            default: 0,    null: false
    t.boolean  "enable",                           default: true, null: false
    t.boolean  "leaf",                             default: true
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "blog_categories", ["blog_category_id"], name: "index_blog_categories_on_blog_category_id", using: :btree
  add_index "blog_categories", ["user_id"], name: "index_blog_categories_on_user_id", using: :btree

  create_table "blog_comments", force: true do |t|
    t.integer  "blog_id",                       null: false
    t.integer  "user_id"
    t.string   "title",              limit: 60, null: false
    t.string   "name",               limit: 60
    t.string   "encrypted_password", limit: 40
    t.string   "salt",               limit: 40
    t.text     "content",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "blog_comments", ["blog_id"], name: "index_blog_comments_on_blog_id", using: :btree
  add_index "blog_comments", ["user_id"], name: "index_blog_comments_on_user_id", using: :btree

  create_table "blog_contents", force: true do |t|
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: true do |t|
    t.integer  "user_id",                                       null: false
    t.integer  "blog_category_id",                              null: false
    t.string   "title",               limit: 60,                null: false
    t.string   "description",                                   null: false
    t.string   "photo"
    t.integer  "blog_comments_count",            default: 0,    null: false
    t.integer  "count",                          default: 0,    null: false
    t.boolean  "enable",                         default: true, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "blogs", ["blog_category_id"], name: "index_blogs_on_blog_category_id", using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contact_contents", force: true do |t|
    t.boolean "html",    default: false, null: false
    t.text    "content",                 null: false
  end

  create_table "contacts", force: true do |t|
    t.string   "name",       limit: 60
    t.string   "email"
    t.string   "phone",      limit: 40
    t.string   "title",      limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "faq_categories", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "title",                     null: false
    t.integer  "faqs_count", default: 0,    null: false
    t.boolean  "enable",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "faq_categories", ["user_id"], name: "index_faq_categories_on_user_id", using: :btree

  create_table "faq_contents", force: true do |t|
    t.boolean "html",    default: false, null: false
    t.text    "content"
  end

  create_table "faqs", force: true do |t|
    t.integer  "faq_category_id",                null: false
    t.integer  "user_id",                        null: false
    t.string   "title",                          null: false
    t.integer  "count",           default: 0,    null: false
    t.boolean  "enable",          default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faqs", ["faq_category_id"], name: "index_faqs_on_faq_category_id", using: :btree
  add_index "faqs", ["user_id"], name: "index_faqs_on_user_id", using: :btree

  create_table "galleries", force: true do |t|
    t.integer  "user_id",                                       null: false
    t.integer  "gallery_category_id",                           null: false
    t.string   "title",               limit: 60,                null: false
    t.string   "content",                                       null: false
    t.string   "location"
    t.string   "photo",                                         null: false
    t.integer  "count",                          default: 0,    null: false
    t.boolean  "enable",                         default: true, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "galleries", ["gallery_category_id"], name: "index_galleries_on_gallery_category_id", using: :btree
  add_index "galleries", ["user_id"], name: "index_galleries_on_user_id", using: :btree

  create_table "gallery_categories", force: true do |t|
    t.integer  "user_id",                                   null: false
    t.string   "title",           limit: 60,                null: false
    t.integer  "galleries_count",            default: 0,    null: false
    t.boolean  "enable",                     default: true, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "gallery_categories", ["user_id"], name: "index_gallery_categories_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "title",       limit: 60,                null: false
    t.integer  "users_count",            default: 0,    null: false
    t.boolean  "enable",                 default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "guest_book_comments", force: true do |t|
    t.integer  "guest_book_id",                 null: false
    t.integer  "user_id"
    t.string   "name",               limit: 60
    t.string   "encrypted_password", limit: 40
    t.string   "salt",               limit: 40
    t.text     "content",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "guest_book_comments", ["guest_book_id"], name: "index_guest_book_comments_on_guest_book_id", using: :btree
  add_index "guest_book_comments", ["user_id"], name: "index_guest_book_comments_on_user_id", using: :btree

  create_table "guest_book_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "guest_books", force: true do |t|
    t.integer  "user_id"
    t.string   "title",                     limit: 60,                null: false
    t.string   "name",                      limit: 60
    t.string   "encrypted_password",        limit: 40
    t.integer  "guest_book_comments_count",            default: 0,    null: false
    t.integer  "count",                                default: 0,    null: false
    t.boolean  "enable",                               default: true, null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "guest_books", ["user_id"], name: "index_guest_books_on_user_id", using: :btree

  create_table "histories", force: true do |t|
    t.integer  "user_id",                              null: false
    t.string   "year",       limit: 40,                null: false
    t.string   "title",      limit: 60,                null: false
    t.text     "content",                              null: false
    t.integer  "count",                 default: 0,    null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type", limit: 100
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name",     limit: 60
    t.string   "action_name",         limit: 60
    t.string   "view_name",           limit: 60
    t.string   "request_hash",        limit: 130
    t.string   "ip_address",          limit: 60
    t.string   "session_hash",        limit: 100
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "notice_contents", force: true do |t|
    t.boolean "html",    default: false, null: false
    t.text    "content",                 null: false
  end

  create_table "notices", force: true do |t|
    t.integer  "user_id",                              null: false
    t.string   "title",      limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.integer  "count",                 default: 0,    null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id", using: :btree

  create_table "portfolio_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "portfolios", force: true do |t|
    t.integer  "user_id",                    null: false
    t.string   "title",                      null: false
    t.string   "url",                        null: false
    t.text     "description",                null: false
    t.string   "photo",                      null: false
    t.boolean  "enable",      default: true, null: false
    t.integer  "count",       default: 0,    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "portfolios", ["user_id"], name: "index_portfolios_on_user_id", using: :btree

  create_table "question_comments", force: true do |t|
    t.integer  "question_id",                   null: false
    t.integer  "user_id"
    t.string   "name",               limit: 60
    t.string   "encrypted_password", limit: 40
    t.string   "salt",               limit: 40
    t.text     "content",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "question_comments", ["question_id"], name: "index_question_comments_on_question_id", using: :btree
  add_index "question_comments", ["user_id"], name: "index_question_comments_on_user_id", using: :btree

  create_table "question_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "questions", force: true do |t|
    t.integer  "user_id"
    t.string   "title",                   limit: 60,                 null: false
    t.string   "name",                    limit: 60
    t.string   "encrypted_password",      limit: 40
    t.boolean  "secret",                             default: false, null: false
    t.integer  "question_comments_count",            default: 0,     null: false
    t.integer  "count",                              default: 0,     null: false
    t.boolean  "enable",                             default: true,  null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "resource_photos", force: true do |t|
    t.integer  "resource_id",                           null: false
    t.string   "photo",                                 null: false
    t.string   "alt",         limit: 60,                null: false
    t.boolean  "enable",                 default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "resource_photos", ["resource_id"], name: "index_resource_photos_on_resource_id", using: :btree

  create_table "resources", force: true do |t|
    t.integer  "ad_position_id",                              null: false
    t.string   "title",          limit: 60,                   null: false
    t.string   "description"
    t.string   "controller",     limit: 60,                   null: false
    t.string   "menu_action",    limit: 60, default: "index", null: false
    t.boolean  "use_category",              default: false,   null: false
    t.boolean  "menu_display",              default: true,    null: false
    t.integer  "per",                       default: 10,      null: false
    t.boolean  "desc",                      default: true,    null: false
    t.boolean  "enable",                    default: true,    null: false
    t.integer  "priority",                  default: 100,     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "resources", ["ad_position_id"], name: "index_resources_on_ad_position_id", using: :btree
  add_index "resources", ["controller"], name: "index_resources_on_controller", unique: true, using: :btree
  add_index "resources", ["title"], name: "index_resources_on_title", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "user_photos", force: true do |t|
    t.integer  "user_id",                              null: false
    t.string   "photo",                                null: false
    t.string   "alt",        limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_photos", ["user_id"], name: "index_user_photos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "group_id",                                          null: false
    t.string   "email",                                             null: false
    t.string   "name",                   limit: 60,                 null: false
    t.string   "encrypted_password",                                null: false
    t.string   "photo"
    t.string   "description"
    t.string   "alternate_name",         limit: 60
    t.boolean  "gender",                            default: true
    t.date     "birth_date"
    t.date     "death_date"
    t.string   "url"
    t.string   "job_title",              limit: 60
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_photos_count",                 default: 0,     null: false
    t.boolean  "admin",                             default: false, null: false
    t.boolean  "intro",                             default: false, null: false
    t.boolean  "enable",                            default: true,  null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
