# Spotlify

Streaming music service.

## Artist
- name: string
- bio: text
- genre: string
- (albums)
- (label)

## Song
- name: string
- artist: string -> Artist
- duration: integer
- released_at: date
- (album)
- (genre)

## Playlists
- name: string
- songs -> Many Songs
- created_at: timestamp
- (subscribers)
- (is public)


- Users can sign up, create a profile

