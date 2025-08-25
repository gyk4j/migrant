package command

import (
  "fmt"
)

type InitCmd struct {
  SubCmd
}

func NewInitCmd(name string) (*InitCmd, error) {
  sc, err := newSubCmd(name)
  instance := &InitCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *InitCmd) Run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
