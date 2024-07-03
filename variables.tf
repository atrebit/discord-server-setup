variable discord_token {
  type        = string
  description = "discord api token, created via https://quibtech.com/p/manage-discord-servers-with-terraform/#obtain-discord-api-token"
}

variable server_id {
  type        = string
  description = "server id of your discord server"
}

variable server_layout {
  type = map(
    object({
      position = number
      text_channels = map(
        object({
          position = number
          topic = string
          nsfw = bool
        })
      )
      voice_channels = map(
        object({
          position = number
          bitrate = number
          userlimit = number
          sync_parent_category_permitions = bool
        })
      )
    })
  )
  description = "discord server layout to be created"
}

