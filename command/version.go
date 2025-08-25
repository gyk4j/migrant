package command

import (
  "fmt"
)

type VersionCmd struct {
  SubCmd
}

func newVersionCmd(name string) (*VersionCmd, error) {
  sc, err := newSubCmd(name)
  instance := &VersionCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *VersionCmd) run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
