resource "cloudflare_page_rule" "dot_to_install_script" {
  zone_id = cloudflare_zone.main.id
  target  = "dot.${cloudflare_zone.main.zone}/*"
  actions {
    forwarding_url {
      status_code = 301
      url         = "https://raw.githubusercontent.com/hiroxto/dotfiles/main/scripts/utils/auto-install.bash"
    }
  }
}
