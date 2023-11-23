# resource "aws_iam_group" "admin_iam_group" {
#   name = "admin-iam-group"
# }

# resource "aws_iam_policy_attachment" "admins-attach" {
#   name       = "admins-attach"
#   groups     = [aws_iam_group.admin_iam_group.id]
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }

# resource "aws_iam_user" "admin_1" {
#   name = "admin1"

# }

# resource "aws_iam_group_membership" "adminUsers" {
#   name  = "adminUsers"
#   group = aws_iam_group.admin_iam_group.id
#   users = [
#     aws_iam_user.admin_1.name
#   ]
# }

# resource "aws_iam_access_key" "admin1_access" {
#   user = aws_iam_user.admin_1.name
# }
