resource "cloudflare_account" "main" {
  name              = "hiroxto"
  type              = "standard"
  enforce_twofactor = true
}
