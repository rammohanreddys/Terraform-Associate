# local provider
resource "local_file" "pet" {
filename = "/root/cat.txt"
content = "i love cats"
}
# random provider
resource "random_pet" "dog" {
prefix = "Mrs"
separator = "."
length = "2"
}
