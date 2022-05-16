terraform {
  required_providers {
    triton = {
      source = "joyent/triton"
      version = "0.8.2"
    }
    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }
  }
}
