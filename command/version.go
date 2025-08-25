package command

import (
  "fmt"
)

type VersionCmd struct {
  SubCmd
}

func NewVersionCmd(name string) (*VersionCmd, error) {
  sc, err := newSubCmd(name)
  instance := &VersionCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *VersionCmd) Run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
