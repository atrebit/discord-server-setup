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
      position      = number
      text_channels = map(
        object({
          position = number
          topic    = string
          nsfw     = bool
        })
      )
      voice_channels = map(
        object({
          position                        = number
          bitrate                         = number
          userlimit                       = number
          sync_parent_category_permitions = bool
        })
      )
    })
  )
  description = "discord server layout to be created"
}

variable role_permissions {
  type = map(
    object({
      create_instant_invite  = string
      kick_members           = string
      ban_members            = string
      administrator          = string
      manage_channels        = string
      manage_guild           = string
      add_reactions          = string
      view_audit_log         = string
      priority_speaker       = string
      stream                 = string
      view_channel           = string
      send_messages          = string
      send_tts_messages      = string
      manage_messages        = string
      embed_links            = string
      attach_files           = string
      read_message_history   = string
      mention_everyone       = string
      use_external_emojis    = string
      view_guild_insights    = string
      connect                = string
      speak                  = string
      mute_members           = string
      deafen_members         = string
      move_members           = string
      use_vad                = string
      change_nickname        = string
      manage_nicknames       = string
      manage_roles           = string
      manage_webhooks        = string
      manage_emojis          = string
      request_to_speak       = string
      manage_threads         = string
      create_public_threads  = string
      create_private_threads = string
      use_external_stickers  = string
      send_thread_messages   = string
    })
  )
  description = "each permission can have the values: allow, deny, unset"
}

