package command

import (
  "fmt"
)

type DestroyCmd struct {
  SubCmd
}

func NewDestroyCmd(name string) (*DestroyCmd, error) {
  sc, err := newSubCmd(name)
  instance := &DestroyCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *DestroyCmd) Run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
