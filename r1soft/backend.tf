terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "remote-exec-chyngyzkan" 
        key = "r1soft/r1soft.state" #in the same bucket but in different folder 
    }
}