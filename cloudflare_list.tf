resource "cloudflare_list" "force_custom_domain" {
  account_id  = cloudflare_account.main.id
  name        = "force_custom_domain"
  description = "Cloudflare Pagesのドメインをカスタムドメインにリダイレクトする"
  kind        = "redirect"

  # www
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

  # utils
  item {
    value {
      redirect {
        source_url            = "https://hiroxto-utils-hiroxto-net.pages.dev/"
        target_url            = "https://utils.hiroxto.net/"
        status_code           = 301
        preserve_query_string = "enabled"
        include_subdomains    = "disabled"
        subpath_matching      = "enabled"
        preserve_path_suffix  = "enabled"
      }
    }
  }

  # tpb
  item {
    value {
      redirect {
        source_url            = "https://hiroxto-train-photo-blog.pages.dev/"
        target_url            = "https://train-photo-blog.hiroxto.net/"
        status_code           = 301
        preserve_query_string = "enabled"
        include_subdomains    = "disabled"
        subpath_matching      = "enabled"
        preserve_path_suffix  = "enabled"
      }
    }
  }

  # swarm-checkin-regulation-checker
  item {
    value {
      redirect {
        source_url            = "https://swarm-checkin-regulation-checker.pages.dev/"
        target_url            = "https://swarm-checkin-regulation-checker.hiroxto.net/"
        status_code           = 301
        preserve_query_string = "enabled"
        include_subdomains    = "disabled"
        subpath_matching      = "enabled"
        preserve_path_suffix  = "enabled"
      }
    }
  }
}
