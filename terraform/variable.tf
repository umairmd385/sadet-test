variable region {
    type = string
}

variable access_key {
    type = string
}

variable secret_key {
    type = string
}

variable username {
    default = "ubuntu"
}

variable PATH_TO_PRIVATE_KEY {
    default = "ssh-connfile"
}

variable PATH_TO_PUBLIC_KEY {
    default  = "ssh-connfile.pub"
}