require('latex').setup{
  imaps = {
    add = {
      ["\\colon"] = ":",
      ["\\tilde"] = "~",
    }
  },
  conceals = {
    add = {
      ["colon"] = ":"
    }
  },
  surrounds = {
    enabled  = true,
    command = "c",
    environment = "E"
  }
}
