terraform {
  required_providers {
    discord = {
      source = "aequasi/discord"
      version = "0.0.4"
    }
  }
}

provider discord {
    token = "placeholder-discord-token"
}

resource discord_category_channel chatting {
  for_each = tomap(var.server_layout)
  name = each.value
  server_id = var.server_id
}