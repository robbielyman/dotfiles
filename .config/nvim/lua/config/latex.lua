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
  }
}
