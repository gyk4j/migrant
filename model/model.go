package model

type Config struct {
  vm Vm
}

type Vm struct {
  box string
  hostName string
}

type Provider struct {
  virtualbox VirtualBox
}

type VirtualBox struct {
  name string
  memory int
  cpus int
}

type Network struct {
  privateNetwork PrivateNetwork
}

type PrivateNetwork struct {
  ip string
}

type Provision struct {
  shell string
  inline []string
}
