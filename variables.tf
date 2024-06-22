variable server_id {
  type        = string
  description = "server_id for the discord_server"
}
variable server_layout {
#  type        = map(string)
  description = "layout for the discord_server"
  default     = [
    0 = "test_category", 1 = "category_01"
  ]
}

