provider "flux" {
  kubernetes = {
    config_path = var.config_path
  }
  git = {
    url = "https://github.com/${var.github_repository}.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}
module "flux" {
  source = "fluxcd/flux/kubernetes"
  flux_version = "v2.3.0"
}
resource "flux_bootstrap_git" "this" {
  path = var.target_path
}
