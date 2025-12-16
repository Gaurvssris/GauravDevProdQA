module "RG" {
source = "../../Infra/RG/RG"
    Rg = var.prodnewRg
  
}
module "STRG" {
    depends_on = [ module.RG ]
    source = "../../Infra/Storage"
    strg = var.prodnewStrg
  }
  module "Vnet" {
    depends_on = [ module.RG ]
    source = "../../Infra/VNET"
    vnetgaurav = var.prodVnetGS
    
  }
  module "Subnet" {
    depends_on = [ module.RG, module.Vnet ]
    source = "../../Infra/SUBNET"
    subnetG = var.prodSubnetGS
}
module "NIC" {
    depends_on = [ module.RG, module.Subnet ,module.Vnet]
  source = "../../Infra/NIC"
  nicGS = var.prodNICGSS
}
module "VM" {
    depends_on = [ module.RG, module.Subnet ,module.Vnet,module.NIC]
    source = "../../Infra/VM"
VMgaurav = var.prodnewVMG
  
}