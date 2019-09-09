#!/bin/bash
mkdir -p /home/ec2-user/.ssh
cat <<FILE > /home/ec2-user/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrWEhZ5QHccTZ3jhi5f9WklS5QUsWXF08oMIInLSJYzsn2OkDS3VzoBz7WrO+1cOoU8O86IFXHb3UX4eqNFSCF6iViAecUFK79tYJdDeZa64aZhMexGMPExwh/au7vwdxCUUpy0vpjySoeDxV1wlWb1hoQ/Na8FWYu+SpW2iAwILF2nAsN+ueljiZ05ZcPDW9z4bCNaByDbTWRkkKKik9kUXquryerTlfsuidFIHR1Ga1TbYz+9+sh35eb7s9q+oojE+FaJVwNuJgrjucDqKVXw1tW64pb8MCS8SJK+7NR4lDUeJB7Xrj7wLJ2cdKchQX2R7MTEUznl4GtgkkgVBhv user@localhost
FILE
chown ec2-user.ec2-user /home/ec2-user/.ssh/authorized_keys
chmod 400 /home/ec2-user/.ssh/authorized_keys
