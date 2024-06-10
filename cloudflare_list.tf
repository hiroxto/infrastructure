resource "cloudflare_list" "force_www" {
  account_id  = cloudflare_account.main.id
  name        = "force_www"
  description = ""
  kind        = "redirect"

  item {
    value {
      redirect {
        source_url            = "https://hiroxto.net/"
        target_url            = "https://www.hiroxto.net/"
        status_code           = 301
        preserve_query_string = "enabled"
        include_subdomains    = "disabled"
        subpath_matching      = "enabled"
        preserve_path_suffix  = "enabled"
      }
    }
  }

  item {
    value {
      redirect {
        source_url            = "https://hiroxto-net.pages.dev/"
        target_url            = "https://www.hiroxto.net/"
        status_code           = 301
        preserve_query_string = "enabled"
        include_subdomains    = "disabled"
        subpath_matching      = "enabled"
        preserve_path_suffix  = "enabled"
      }
    }
  }
}
