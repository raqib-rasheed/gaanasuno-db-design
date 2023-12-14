
Table "users" {
  "id" integer [pk]
  "phone_number" integer
}

Table "user_played_songs" {
  "id" integer [pk]
  "user_id" integer
  "song_id" integer
  "created_at" timestamp
}

Table "user_preferences" {
  "id" integer [pk]
  "user_id" integer
}

Table "user_preference_genres" {
  "id" integer [pk]
  "user_preference_id" integer
  "genre_id" integer
}

Table "user_preference_languages" {
  "id" integer [pk]
  "user_preference_id" integer
  "language_id" integer
}

Table "albums" {
  "id" integer [pk]
  "genre_id" integer
  "name" varchar
  "image_url" varchar
  "share_url" varchar
  "released_on" timestamp
  "language_id" integer
}

Table "album_comments" {
  "id" integer [pk]
  "album_id" integer
  "comment_id" integer
}

Table "album_likes" {
  "id" integer [pk]
  "album_id" integer
  "like_id" integer
}

Table "album_composers" {
  "id" integer [pk]
  "composer_id" integer
  "album_id" integer
}

Table "composers" {
  "id" integer [pk]
  "name" varchar
}

Table "album_songs" {
  "id" integer [pk]
  "album_id" integer
  "song_id" integer
}

Table "album_songs_order" {
  "id" integer [pk]
  "album_song_id" integer
  "order" integer
}

Table "songs" {
  "id" integer [pk]
  "title" varchar
  "language_id" integer
  "released_on" timestamp
  "duration" integer [note: 'Duration of song in seconds']
  "share_url" varchar
  "genre_id" integer

}

Table "singers" {
  "id" integer [pk]
  "name" varchar
}

Table "song_singers" {
  "id" integer [pk]
  "song_id" integer
  "singer_id" integer
}

Table "lyricists" {
  "id" integer [pk]
  "name" varchar
}

Table "song_lyricists" {
  "id" integer [pk]
  "song_id" integer
  "lyricist_id" integer
}

Table "song_comments" {
  "id" integer [pk]
  "song_id" integer
  "comment_id" integer
}

Table "song_likes" {
  "id" integer [pk]
  "song_id" integer
  "like_id" integer
}

Table "genres" {
  "id" integer [pk]
  "name" varchar
}

Table "languages" {
  "id" integer [pk]
  "name" varchar
}

Table "playlists" {
  "id" integer [pk]
  "name" varchar
  "owner" integer
  "share_url" varchar
}

Table "playlist_collaborators" {
  "id" integer [pk]
  "playlist_id" integer
  "user_id" integer
}

Table "playlist_songs" {
  "id" integer [pk]
  "song_id" integer
  "playlist_id" integer
}

Table "playlist_comments" {
  "id" integer [pk]
  "playlist_id" integer
  "comment_id" integer
}


Table "playlist_likes" {
  "id" integer [pk]
  "playlist_id" integer
  "like_id" integer
}


Table "playlist_songs_orders" {
  "id" integer [pk]
  "playlist_song_id" integer
  "order" integer
}


Table "followers" {
  "id" integer [pk]
  "user_id" integer
  "follower_id" integer
}

Table "comments" {
  "id" integer [pk]
  "user_id" integer
  "comment" varchar
  "created_at" timestamp
}

Table "comment_replies" {
  "id" integer [pk]
  "parent_comment_id" integer
  "comment_id" integer
}

Table "likes" {
  "id" integer [pk]
  "user_id" integer
  "created_at" timestamp
}

Table "recent_activities" {
  "id" integer [pk]
  "activity_id" integer
}

Ref:"users"."id" < "user_preferences"."user_id"
Ref:"users"."id" < "playlists"."owner"
Ref: "users"."id" < "user_played_songs"."user_id"
Ref: "users"."id" < "comments"."user_id"
Ref:"users"."id" < "playlist_collaborators"."user_id"
Ref: "users"."id" < "likes"."user_id"
Ref: "users"."id" < "followers"."user_id" 
Ref: "users"."id" < "followers"."follower_id"
  
Ref:"user_preferences"."id" < "user_preference_languages"."user_preference_id"
Ref:"user_preference_languages"."language_id" < "languages"."id"
Ref:"user_preferences"."id" < "user_preference_genres"."user_preference_id"
Ref: "user_preference_genres"."genre_id" < "genres"."id"

Ref:"albums"."id" < "album_composers"."album_id"
Ref:"albums"."language_id" - "languages"."id"
Ref:"composers"."id" < "album_composers"."composer_id"
Ref:"albums"."id" < "album_songs"."album_id"
Ref:"genres"."id" - "albums"."genre_id"
Ref:"album_songs"."song_id" < "songs"."id"
Ref:"songs"."genre_id" - "genres"."id"
Ref:"songs"."language_id" - "languages"."id"
Ref:"songs"."id" < "song_singers"."song_id"
Ref:"singers"."id" < "song_singers"."singer_id"
Ref:"songs"."id" < "song_lyricists"."song_id"
Ref:"lyricists"."id" < "song_lyricists"."lyricist_id"
Ref:"album_songs_order"."album_song_id" > "album_songs"."id"
Ref: "albums"."id" < "album_comments"."album_id"
Ref: "comments"."id" < "album_comments"."comment_id"

Ref: "comments"."id" < "playlist_comments"."comment_id"
Ref:"playlists"."id" < "playlist_collaborators"."playlist_id"
Ref:"playlist_songs"."song_id" < "songs"."id"
Ref:"playlists"."id" < "playlist_songs"."playlist_id"
Ref:"playlist_songs_orders"."playlist_song_id" > "playlist_songs"."id"
Ref: "playlists"."id" < "playlist_comments"."playlist_id"
Ref: "songs"."id" < "song_comments"."song_id"
Ref: "comments"."id" < "song_comments"."comment_id"
Ref: "album_likes"."like_id" > "likes"."id"
Ref: "album_likes"."album_id" > "albums"."id"
Ref: "playlist_likes"."playlist_id" > "playlists"."id"
Ref: "playlist_likes"."like_id" > "likes"."id"
Ref: "comments"."id" < "comment_replies"."comment_id"
Ref: "user_played_songs"."song_id" < "songs"."id"
Ref: "songs"."id" < "song_likes"."song_id"
Ref: "likes"."id" < "song_likes"."like_id"
Ref: "comments"."id" < "comment_replies"."parent_comment_id"

Ref: "recent_activities"."activity_id" > "comments"."id"

Ref: "likes"."id" < "recent_activities"."activity_id"
