module "RG" {
source = "../../Infra/RG/RG"
    Rg = var.QAnewRg
  
}
module "STRG" {
    depends_on = [ module.RG ]
    source = "../../Infra/Storage"
    strg = var.QAnewStrg
  }
  module "Vnet" {
    depends_on = [ module.RG ]
    source = "../../Infra/VNET"
    vnetgaurav = var.QAVnetGS
    
  }
  module "Subnet" {
    depends_on = [ module.RG, module.Vnet ]
    source = "../../Infra/SUBNET"
    subnetG = var.QASubnetGS
}
module "NIC" {
    depends_on = [ module.RG, module.Subnet ,module.Vnet]
  source = "../../Infra/NIC"
  nicGS = var.QANICGSS
}
module "VM" {
    depends_on = [ module.RG, module.Subnet ,module.Vnet,module.NIC]
    source = "../../Infra/VM"
VMgaurav = var.QAnewVMG
  
}