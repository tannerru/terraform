variable "vm_list" {
  type = map(object({
    name = string
    machine_type = string
    zone = string
  }))
}
  
