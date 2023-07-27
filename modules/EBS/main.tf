resource "aws_ebs_volume" "awsvolume" {
  availability_zone = var.AZ
  size = var.size
  encrypted = "false"

  tags = {
    name = "new_volume_mounttoec2"
  }
}
resource "aws_volume_attachment" "mountvolumetoec2" {
  device_name = var.device_name
  instance_id = var.instance_id
  volume_id = "${aws_ebs_volume.awsvolume.id}"
}