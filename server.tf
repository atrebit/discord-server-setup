locals {
  text_channel_list = flatten([
    for category, category_definition in var.server_layout :
    [
      for channel_name, channel_definition in category_definition.text_channels :
      merge(
        {
          category = category
          name     = channel_name
        },
        channel_definition
      )
    ]
  ])
  text_channels = {
    for index, channel in local.text_channel_list :
    index => channel
  }
}

resource discord_category_channel categories {
  for_each  = var.server_layout
  name      = each.key
  server_id = var.server_id
  position  = each.value.position
}

resource discord_text_channel text_channels {
  for_each  = local.text_channels
  server_id = var.server_id
  category  = discord_category_channel.categories[each.value.category].id
  name      = each.value.name
  position  = each.value.position
  topic     = each.value.topic
  nsfw      = each.value.nsfw
}

# resource discord_voice_channel voice_channels {
#   name = "General"
#   server_id = var.server_id
#   category = ""
#   position = 0
#   bitrate = 128
#   userlimit = 5
# }