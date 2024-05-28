resource "cloudflare_pages_domain" "root_hiroxto_net" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.hiroxto_net.name
  domain       = "hiroxto.net"
}

resource "cloudflare_pages_domain" "www_hiroxto_net" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.hiroxto_net.name
  domain       = "www.hiroxto.net"
}

resource "cloudflare_pages_domain" "train_photo_blog" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.train_photo_blog.name
  domain       = "train-photo-blog.hiroxto.net"
}
