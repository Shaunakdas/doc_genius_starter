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

ActiveRecord::Schema.define(version: 20170704153823) do

  create_table "answer_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text"
    t.boolean  "correct"
    t.integer  "word_question_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["word_question_id"], name: "index_answer_options_on_word_question_id", using: :btree
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

  add_foreign_key "answer_options", "word_questions"
  add_foreign_key "auto_questions", "question_types"
  add_foreign_key "chapters", "streams"
  add_foreign_key "chapters", "subjects"
  add_foreign_key "game_holders", "question_types"
  add_foreign_key "game_holders", "rank_names"
  add_foreign_key "game_sessions", "game_holders"
  add_foreign_key "practice_questions", "auto_questions"
  add_foreign_key "practice_questions", "difficulty_levels"
  add_foreign_key "practice_questions", "game_holders"
  add_foreign_key "question_types", "sub_topics"
  add_foreign_key "streams", "subjects"
  add_foreign_key "sub_topics", "topics"
  add_foreign_key "topics", "chapters"
  add_foreign_key "word_questions", "difficulty_levels"
  add_foreign_key "word_questions", "game_holders"
  add_foreign_key "working_rules", "difficulty_levels"
  add_foreign_key "working_rules", "game_holders"
end
