module "RG" {
source = "../../Infra/RG/RG"
    Rg = var.newRg
  
}
module "STRG" {
    depends_on = [ module.RG ]
    source = "../../Infra/Storage"
    strg = var.newStrg
  }
  module "Vnet" {
    depends_on = [ module.RG ]
    source = "../../Infra/VNET"
    vnetgaurav = var.VnetGS
    
  }
  module "Subnet" {
    depends_on = [ module.RG, module.Vnet ]
    source = "../../Infra/SUBNET"
    subnetG = var.SubnetGS
}
module "NIC" {
    depends_on = [ module.RG, module.Subnet ,module.Vnet]
  source = "../../Infra/NIC"
  nicGS = var.NICGSS
}
module "VM" {
    depends_on = [ module.RG, module.Subnet ,module.Vnet,module.NIC]
    source = "../../Infra/VM"
VMgaurav = var.newVMG
  
}