resource "cloudflare_pages_project" "hiroxto_net" {
  account_id        = cloudflare_account.main.id
  name              = "hiroxto-net"
  production_branch = "master"

  build_config {
    build_command       = "yarn run build"
    destination_dir     = ".svelte-kit/cloudflare"
    web_analytics_tag   = "e0d5dee8390443a6b976e38a1dc80a50"
    web_analytics_token = "4373f2bef44d493282d4425c8cac6d99"
  }

  source {
    type = "github"
    config {
      owner                         = "hiroxto"
      repo_name                     = "hiroxto.net"
      production_branch             = "master"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes = [
        "*",
      ]
      preview_branch_excludes = [
        "renovate/linters",
        "renovate/actions-*",
      ]
    }
  }

  deployment_configs {
    preview {
      environment_variables = {
        YARN_VERSION = "1"
      }
      fail_open   = true
      usage_model = "standard"
    }
    production {
      environment_variables = {
        YARN_VERSION = "1"
      }
      fail_open   = true
      usage_model = "standard"
    }
  }
}

resource "cloudflare_pages_project" "train_photo_blog" {
  account_id        = cloudflare_account.main.id
  name              = "hiroxto-train-photo-blog"
  production_branch = "master"

  build_config {
    build_command       = "bash ./scripts/build.sh --gc --minify"
    destination_dir     = "public"
    web_analytics_tag   = "8e14646aca0848d78854819449f2231e"
    web_analytics_token = "879077f54dc9403d8a0aeebc504d0e4f"
  }

  source {
    type = "github"
    config {
      owner                         = "hiroxto"
      repo_name                     = "train-photo-blog"
      production_branch             = "master"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes = [
        "*",
      ]
      preview_branch_excludes = []
    }
  }

  deployment_configs {
    preview {
      environment_variables = {
        HUGO_VERSION = "0.78.2"
      }
      fail_open   = true
      usage_model = "standard"
    }
    production {
      environment_variables = {
        HUGO_VERSION = "0.78.2"
      }
      fail_open   = true
      usage_model = "standard"
    }
  }
}
