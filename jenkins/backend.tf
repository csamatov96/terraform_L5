terraform {
    backend "s3" { #
        region = "us-east-2" #
        bucket = "remote-exec-chyngyzkan" ##
        key = "remote.state"
    }
}