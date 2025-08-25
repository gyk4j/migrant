package command

import (
  "fmt"
)

type ProvisionCmd struct {
  SubCmd
}

func NewProvisionCmd(name string) (*ProvisionCmd, error) {
  sc, err := newSubCmd(name)
  instance := &ProvisionCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *ProvisionCmd) Run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
