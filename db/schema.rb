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

ActiveRecord::Schema.define(version: 20170705111900) do

  create_table "acad_entity_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "average_value",    precision: 10
    t.decimal  "max_value",        precision: 10
    t.decimal  "last_value",       precision: 10
    t.decimal  "time_spent",       precision: 10
    t.integer  "passed_count"
    t.integer  "failed_count"
    t.integer  "seen_count"
    t.decimal  "percentile",       precision: 10
    t.string   "acad_entity_type"
    t.integer  "acad_entity_id"
    t.integer  "attempt_score_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["acad_entity_type", "acad_entity_id"], name: "index_acad_entity_scores_on_acad_entity_type_and_acad_entity_id", using: :btree
    t.index ["attempt_score_id"], name: "index_acad_entity_scores_on_attempt_score_id", using: :btree
  end

  create_table "answer_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text"
    t.boolean  "correct"
    t.integer  "word_question_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["word_question_id"], name: "index_answer_options_on_word_question_id", using: :btree
  end

  create_table "attempt_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "value",           precision: 10
    t.decimal  "time_taken",      precision: 10
    t.integer  "correct_count"
    t.integer  "incorrect_count"
    t.boolean  "seen"
    t.boolean  "passed"
    t.boolean  "failed"
    t.integer  "game_attempt_id"
    t.integer  "game_holder_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["game_attempt_id"], name: "index_attempt_scores_on_game_attempt_id", using: :btree
    t.index ["game_holder_id"], name: "index_attempt_scores_on_game_holder_id", using: :btree
  end

  create_table "auth_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number"
    t.string   "auth_token"
    t.integer  "otp"
    t.string   "device_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_phone_number_id"
    t.index ["user_id"], name: "index_auth_tokens_on_user_id", using: :btree
    t.index ["user_phone_number_id"], name: "index_auth_tokens_on_user_phone_number_id", using: :btree
  end

  create_table "auto_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "question_tag"
    t.string   "answer_tag"
    t.integer  "question_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["question_type_id"], name: "index_auto_questions_on_question_type_id", using: :btree
  end

  create_table "benifits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.string   "title"
    t.string   "explainer"
    t.integer  "sequence"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "seq_stream"
    t.integer  "seq_standard"
    t.integer  "subject_id"
    t.integer  "stream_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["stream_id"], name: "index_chapters_on_stream_id", using: :btree
    t.index ["subject_id"], name: "index_chapters_on_subject_id", using: :btree
  end

  create_table "difficulty_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_attempts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "game_type"
    t.integer  "game_id"
    t.integer  "game_session_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["game_session_id"], name: "index_game_attempts_on_game_session_id", using: :btree
    t.index ["game_type", "game_id"], name: "index_game_attempts_on_game_type_and_game_id", using: :btree
    t.index ["user_id"], name: "index_game_attempts_on_user_id", using: :btree
  end

  create_table "game_holders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.string   "game_type"
    t.string   "image_url"
    t.integer  "latest_sequence"
    t.integer  "game_count"
    t.integer  "question_type_id"
    t.integer  "rank_name_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["question_type_id"], name: "index_game_holders_on_question_type_id", using: :btree
    t.index ["rank_name_id"], name: "index_game_holders_on_rank_name_id", using: :btree
  end

  create_table "game_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "attempt_date"
    t.integer  "game_holder_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["game_holder_id"], name: "index_game_sessions_on_game_holder_id", using: :btree
  end

  create_table "practice_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.string   "question_text"
    t.string   "option_text"
    t.integer  "game_holder_id"
    t.integer  "auto_question_id"
    t.integer  "difficulty_level_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["auto_question_id"], name: "index_practice_questions_on_auto_question_id", using: :btree
    t.index ["difficulty_level_id"], name: "index_practice_questions_on_difficulty_level_id", using: :btree
    t.index ["game_holder_id"], name: "index_practice_questions_on_game_holder_id", using: :btree
  end

  create_table "question_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.string   "image_url"
    t.integer  "sub_topic_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["sub_topic_id"], name: "index_question_types_on_sub_topic_id", using: :btree
  end

  create_table "rank_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.integer  "sequence"
    t.string   "display_text"
    t.string   "explainer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "region_percentile_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "percentile_count"
    t.decimal  "score",            precision: 10
    t.string   "acad_entity_type"
    t.integer  "acad_entity_id"
    t.integer  "region_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["acad_entity_type", "acad_entity_id"], name: "index_region_percentile_scores_on_acad_entity", using: :btree
    t.index ["region_id"], name: "index_region_percentile_scores_on_region_id", using: :btree
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.string   "display_text"
    t.string   "region_type"
    t.integer  "parent_region_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["parent_region_id"], name: "index_regions_on_parent_region_id", using: :btree
  end

  create_table "standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_streams_on_subject_id", using: :btree
  end

  create_table "sub_topics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_sub_topics_on_topic_id", using: :btree
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.integer  "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_topics_on_chapter_id", using: :btree
  end

  create_table "user_acad_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "acad_entity_type"
    t.integer  "acad_entity_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["acad_entity_type", "acad_entity_id"], name: "index_user_acad_profiles_on_acad_entity_type_and_acad_entity_id", using: :btree
    t.index ["user_id"], name: "index_user_acad_profiles_on_user_id", using: :btree
  end

  create_table "user_phone_numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_phone_numbers_on_user_id", using: :btree
  end

  create_table "user_regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "registration_date"
    t.integer  "user_id"
    t.integer  "region_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["region_id"], name: "index_user_regions_on_region_id", using: :btree
    t.index ["user_id"], name: "index_user_regions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.date     "reset_password_sent_at"
    t.integer  "sign_in_count"
    t.date     "current_sign_in_at"
    t.date     "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.date     "remember_created_at"
    t.string   "confirmation_token"
    t.date     "confirmed_at"
    t.date     "confirmation_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "word_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text"
    t.string   "hint"
    t.string   "explaination"
    t.integer  "sequence"
    t.integer  "correct_count"
    t.integer  "game_holder_id"
    t.integer  "difficulty_level_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["difficulty_level_id"], name: "index_word_questions_on_difficulty_level_id", using: :btree
    t.index ["game_holder_id"], name: "index_word_questions_on_game_holder_id", using: :btree
  end

  create_table "working_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "sequence"
    t.string   "question_text"
    t.integer  "game_holder_id"
    t.integer  "difficulty_level_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["difficulty_level_id"], name: "index_working_rules_on_difficulty_level_id", using: :btree
    t.index ["game_holder_id"], name: "index_working_rules_on_game_holder_id", using: :btree
  end

  add_foreign_key "acad_entity_scores", "attempt_scores"
  add_foreign_key "answer_options", "word_questions"
  add_foreign_key "attempt_scores", "game_attempts"
  add_foreign_key "attempt_scores", "game_holders"
  add_foreign_key "auth_tokens", "user_phone_numbers"
  add_foreign_key "auth_tokens", "users"
  add_foreign_key "auto_questions", "question_types"
  add_foreign_key "chapters", "streams"
  add_foreign_key "chapters", "subjects"
  add_foreign_key "game_attempts", "game_sessions"
  add_foreign_key "game_attempts", "users"
  add_foreign_key "game_holders", "question_types"
  add_foreign_key "game_holders", "rank_names"
  add_foreign_key "game_sessions", "game_holders"
  add_foreign_key "practice_questions", "auto_questions"
  add_foreign_key "practice_questions", "difficulty_levels"
  add_foreign_key "practice_questions", "game_holders"
  add_foreign_key "question_types", "sub_topics"
  add_foreign_key "region_percentile_scores", "regions"
  add_foreign_key "streams", "subjects"
  add_foreign_key "sub_topics", "topics"
  add_foreign_key "topics", "chapters"
  add_foreign_key "user_acad_profiles", "users"
  add_foreign_key "user_phone_numbers", "users"
  add_foreign_key "user_regions", "regions"
  add_foreign_key "user_regions", "users"
  add_foreign_key "word_questions", "difficulty_levels"
  add_foreign_key "word_questions", "game_holders"
  add_foreign_key "working_rules", "difficulty_levels"
  add_foreign_key "working_rules", "game_holders"
end
