resource "aws_key_pair" "example" {
  key_name   = "task"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "server" {
  ami                         = "ami-0ec10929233384c7f"
  instance_type               = "t3.micro"
  key_name = aws_key_pair.example.key_name
  tags = {
    Name = "UbuntuServer"
  }

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"                          # ✅ Correct for Ubuntu AMIs
#     private_key = file("~/.ssh/id_rsa")             # Path to private key
#     host        = self.public_ip
#     timeout     = "2m"
#   }

#   provisioner "file" {
#     source      = "file10"
#     destination = "/home/ubuntu/file10"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "touch /home/ubuntu/file200",
#       "echo 'hello from manduuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu' >> /home/ubuntu/file200"
#     ]
#   }
#    provisioner "local-exec" {
#     command = "touch file500" 
    
   
#  }
 }

 resource "null_resource" "run_script" {
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.server.public_ip
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
    }

    inline = [
      "echo 'hellooo formm nico' >> /home/ubuntu/file200",

    ]
  }

#   triggers = {
#     always_run = "${timestamp()}"
#   }
  triggers = {
  script_hash = filemd5("script.sh") 
  }
 }