resource "null_resource" "test" {
  triggers = {
    timestamp = timestamp()
  }
}
