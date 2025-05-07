resource "cloudflare_account" "main" {
  name = "hiroxto"
  type = "standard"
  settings = {
    enforce_twofactor = true
  }
}
