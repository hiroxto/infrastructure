resource "cloudflare_page_rule" "dot_to_install_script" {
  zone_id = var.cloudflare_zone_id
  target  = "dot.${var.domain_name}/*"
  actions {
    forwarding_url {
      status_code = 301
      url         = "https://raw.githubusercontent.com/hiroxto/dotfiles/main/scripts/utils/auto-install.bash"
    }
  }
}
